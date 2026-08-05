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

void addStock(void)
{
    Stock stock;

    Node *node;

    printf("\nEnter Stock Symbol : ");
    scanf("%19s", stock.symbol);

    printf("Enter Stock Price : ");
    scanf("%f", &stock.price);

    printf("Enter Volume : ");
    scanf("%d", &stock.volume);

    if (!validateSymbol(stock.symbol))
    {
        printf("Invalid Symbol\n");

        logError("CACHE", "INVALID_SYMBOL");

        return;
    }

    if (!validatePrice(stock.price))
    {
        printf("Invalid Price\n");

        logError("CACHE", "INVALID_PRICE");

        return;
    }

    if (!validateVolume(stock.volume))
    {
        printf("Invalid Volume\n");

        logError("CACHE", "INVALID_VOLUME");

        return;
    }

    if (cacheLock() != 0)
    {
        printf("Unable to acquire cache lock\n");
        logError("CACHE", "CACHE_LOCK_FAILED");
        return;
    }

    if (searchNode(stock.symbol) != NULL)
    {
        cacheUnlock();

        printf("Stock Already Exists\n");

        logError("CACHE", "DUPLICATE_STOCK");

        return;
    }

    if (insertNode(stock))
    {
        node = searchNode(stock.symbol);

        if (node != NULL)
        {
            addToFront(node);
        }

        recordInsert();

        logStockOperation(
            "CACHE",
            "STOCK_ADD",
            stock.symbol);

        printf("Stock Added Successfully\n");
    }

    cacheUnlock();
}

void searchStock(void)
{
    char symbol[SYMBOL_LENGTH];

    Node *node;

    printf("\nEnter Stock Symbol : ");

    scanf("%19s", symbol);

    cacheLock();

    node = searchNode(symbol);

    if (node == NULL)
    {
        recordMiss();

        logStockOperation(
            "CACHE",
            "SEARCH_MISS",
            symbol);

        cacheUnlock();

        printf("Stock Not Found\n");

        return;
    }

    recordHit();

    moveToFront(node);

    logStockOperation(
            "CACHE",
            "SEARCH_HIT",
            symbol);

    printf("\nStock Found\n");

    printf("Symbol : %s\n",
           node->stock.symbol);

    printf("Price  : %.2f\n",
           node->stock.price);

    printf("Volume : %d\n",
           node->stock.volume);

    cacheUnlock();
}

void updateStock(void)
{
    char symbol[SYMBOL_LENGTH];

    float newPrice;

    Node *node;

    printf("\nEnter Stock Symbol : ");

    scanf("%19s", symbol);

    cacheLock();

    node = searchNode(symbol);

    if (node == NULL)
    {
        cacheUnlock();

        printf("Stock Not Found\n");

        return;
    }

    printf("Enter New Price : ");

    scanf("%f", &newPrice);

    if (!validatePrice(newPrice))
    {
        cacheUnlock();

        printf("Invalid Price\n");

        return;
    }

    node->stock.price = newPrice;

    moveToFront(node);

    recordUpdate();

    logStockOperation(
        "CACHE",
        "STOCK_UPDATE",
        symbol);

    printf("Stock Updated Successfully\n");

    cacheUnlock();
}

void deleteStock(void)
{
    char symbol[SYMBOL_LENGTH];

    Node *node;

    printf("\nEnter Stock Symbol : ");

    scanf("%19s", symbol);

    cacheLock();

    node = searchNode(symbol);

    if (node == NULL)
    {
        cacheUnlock();

        printf("Stock Not Found\n");

        return;
    }

    removeFromLRU(node);

    if (deleteNode(symbol))
    {
        recordDelete();

        logStockOperation(
            "CACHE",
            "STOCK_DELETE",
            symbol);

        printf("Stock Deleted Successfully\n");
    }

    cacheUnlock();
}

void displayStocks(void)
{
    int i;

    Node *current;

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
}