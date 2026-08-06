/*
 * RTSMDC_Dev
 * Cache manager (cache_manager.c)
 *
 * Public cache operations and user-facing stock commands.
 *
 * Thread ownership / synchronization:
 *   - Calls cacheLock()/cacheUnlock() to protect shared cache state.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>
#include <string.h>

#include "model/stock.h"

#include "validation/validator.h"

#include "hash_table/hash_table.h"

#include "lru_cache/lru_cache.h"

#include "analytics/analytics.h"

#include "logging/logger.h"
#include "thread_manager/thread_manager.h"

#include "cache_manager/cache_manager.h"

/*
 * RTSMDC_Dev
 * Cache manager (cache_manager.c)
 *
 * Public cache operations and user-facing stock commands.
 *
 * Thread ownership / synchronization:
 *   - Calls cacheLock()/cacheUnlock() to protect shared cache state.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>
#include <string.h>

#include "model/stock.h"
#include "validation/validator.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"
#include "analytics/analytics.h"
#include "logging/logger.h"
#include "thread_manager/thread_manager.h"
#include "cache_manager/cache_manager.h"

static int countCacheNodes(void)
{
    int count = 0;
    int i;
    Node *curr;

    for (i = 0; i < TABLE_SIZE; ++i)
    {
        curr = hashTable[i];
        while (curr != NULL)
        {
            count++;
            curr = curr->hashNext;
        }
    }
    return count;
}

void addStock(void)
{
    Stock stock;
    Node *node;

    printf("\nEnter Stock Symbol : ");
    if (scanf("%19s", stock.symbol) != 1)
    {
        return;
    }

    printf("Enter Stock Price : ");
    if (scanf("%f", &stock.price) != 1)
    {
        return;
    }

    printf("Enter Volume : ");
    if (scanf("%d", &stock.volume) != 1)
    {
        return;
    }

    if (!validateSymbol(stock.symbol))
    {
        printf("Invalid Symbol\n");
        (void)logError("CACHE", "INVALID_SYMBOL");
        return;
    }

    if (!validatePrice(stock.price))
    {
        printf("Invalid Price\n");
        (void)logError("CACHE", "INVALID_PRICE");
        return;
    }

    if (!validateVolume(stock.volume))
    {
        printf("Invalid Volume\n");
        (void)logError("CACHE", "INVALID_VOLUME");
        return;
    }

    if (cacheLock() != 0)
    {
        printf("Unable to acquire cache lock\n");
        (void)logError("CACHE", "CACHE_LOCK_FAILED");
        return;
    }

    if (searchNode(stock.symbol) != NULL)
    {
        (void)cacheUnlock();
        printf("Stock Already Exists\n");
        (void)logError("CACHE", "DUPLICATE_STOCK");
        return;
    }

    /* Capacity eviction check */
    if (countCacheNodes() >= CACHE_CAPACITY)
    {
        Node *tail = getLRUTail();
        if (tail != NULL)
        {
            char evictSymbol[SYMBOL_LENGTH];
            (void)strncpy(evictSymbol, tail->stock.symbol, (size_t)SYMBOL_LENGTH - 1U);
            evictSymbol[SYMBOL_LENGTH - 1] = '\0';

            removeFromLRU(tail);
            (void)deleteNode(evictSymbol);
            recordEviction();
            (void)logStockOperation("CACHE", "CACHE_EVICT", evictSymbol);
        }
    }

    if (insertNode(stock) != 0)
    {
        node = searchNode(stock.symbol);
        if (node != NULL)
        {
            addToFront(node);
        }

        recordInsert();
        (void)logStockOperation("CACHE", "STOCK_ADD", stock.symbol);
        printf("Stock Added Successfully\n");
    }

    (void)cacheUnlock();
}

void searchStock(void)
{
    char symbol[SYMBOL_LENGTH];
    Node *node;

    printf("\nEnter Stock Symbol : ");
    if (scanf("%19s", symbol) != 1)
    {
        return;
    }

    (void)cacheLock();
    node = searchNode(symbol);

    if (node == NULL)
    {
        recordMiss();
        (void)logStockOperation("CACHE", "SEARCH_MISS", symbol);
        (void)cacheUnlock();
        printf("Stock Not Found\n");
        return;
    }

    recordHit();
    moveToFront(node);
    (void)logStockOperation("CACHE", "SEARCH_HIT", symbol);

    printf("\nStock Found\n");
    printf("Symbol : %s\n", node->stock.symbol);
    printf("Price  : %.2f\n", node->stock.price);
    printf("Volume : %d\n", node->stock.volume);

    (void)cacheUnlock();
}

void updateStock(void)
{
    char symbol[SYMBOL_LENGTH];
    float newPrice;
    Node *node;

    printf("\nEnter Stock Symbol : ");
    if (scanf("%19s", symbol) != 1)
    {
        return;
    }

    printf("Enter New Price : ");
    if (scanf("%f", &newPrice) != 1)
    {
        return;
    }

    if (!validatePrice(newPrice))
    {
        printf("Invalid Price\n");
        return;
    }

    (void)cacheLock();
    node = searchNode(symbol);

    if (node == NULL)
    {
        (void)cacheUnlock();
        printf("Stock Not Found\n");
        return;
    }

    node->stock.price = newPrice;
    moveToFront(node);
    recordUpdate();
    (void)logStockOperation("CACHE", "STOCK_UPDATE", symbol);

    printf("Stock Updated Successfully\n");
    (void)cacheUnlock();
}

void deleteStock(void)
{
    char symbol[SYMBOL_LENGTH];
    Node *node;

    printf("\nEnter Stock Symbol : ");
    if (scanf("%19s", symbol) != 1)
    {
        return;
    }

    (void)cacheLock();
    node = searchNode(symbol);

    if (node == NULL)
    {
        (void)cacheUnlock();
        printf("Stock Not Found\n");
        return;
    }

    removeFromLRU(node);

    if (deleteNode(symbol) != 0)
    {
        recordDelete();
        (void)logStockOperation("CACHE", "STOCK_DELETE", symbol);
        printf("Stock Deleted Successfully\n");
    }

    (void)cacheUnlock();
}

void displayStocks(void)
{
    int i;
    Node *current;

    (void)cacheLock();

    printf("\n");
    printf("=========================================\n");
    printf("             STOCK CACHE\n");
    printf("=========================================\n");

    printf("%-15s %-15s %-15s\n",
           "SYMBOL",
           "PRICE",
           "VOLUME");

    printf("=========================================\n");

    for (i = 0; i < TABLE_SIZE; i++)
    {
        current = hashTable[i];

        while (current != NULL)
        {
            printf("%-15s %-15.2f %-15d\n",
                   current->stock.symbol,
                   current->stock.price,
                   current->stock.volume);

            current = current->hashNext;
        }
    }

    (void)cacheUnlock();
}

void clearCache(void)
{
    (void)cacheLock();
    clearLRU();
    clearHashTable();
    (void)cacheUnlock();
}