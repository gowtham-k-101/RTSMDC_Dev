#include <stdio.h>
#include <string.h>

#include "../model/stock.h"

#include "../validation/validator.h"

#include "../hash_table/hash_table.h"

#include "../lru_cache/lru_cache.h"

#include "../analytics/analytics.h"

#include "../logging/logger.h"

#include "cache_manager.h"

void addStock(void)
{
    Stock stock;

    Node *node;

    printf("\nEnter Stock Symbol : ");
    scanf("%19s", stock.symbol);

    printf("Enter Stock Price : ");
    scanf("%f", &stock.price);

    printf("Enter Volume : ");
    scanf("%ld", &stock.volume);

    if (!validateSymbol(stock.symbol))
    {
        printf("Invalid Symbol\n");

        logError("INVALID_SYMBOL");

        return;
    }

    if (!validatePrice(stock.price))
    {
        printf("Invalid Price\n");

        logError("INVALID_PRICE");

        return;
    }

    if (!validateVolume(stock.volume))
    {
        printf("Invalid Volume\n");

        logError("INVALID_VOLUME");

        return;
    }

    if (searchNode(stock.symbol) != NULL)
    {
        printf("Stock Already Exists\n");

        logError("DUPLICATE_STOCK");

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
            "STOCK_ADD",
            stock.symbol);

        printf("Stock Added Successfully\n");
    }
}

void searchStock(void)
{
    char symbol[SYMBOL_LENGTH];

    Node *node;

    printf("\nEnter Stock Symbol : ");

    scanf("%19s", symbol);

    node = searchNode(symbol);

    if (node == NULL)
    {
        recordMiss();

        logStockOperation(
            "SEARCH_MISS",
            symbol);

        printf("Stock Not Found\n");

        return;
    }

    recordHit();

    moveToFront(node);

    logStockOperation(
        "SEARCH_HIT",
        symbol);

    printf("\nStock Found\n");

    printf("Symbol : %s\n",
           node->stock.symbol);

    printf("Price  : %.2f\n",
           node->stock.price);

    printf("Volume : %ld\n",
           node->stock.volume);
}

void updateStock(void)
{
    char symbol[SYMBOL_LENGTH];

    float newPrice;

    Node *node;

    printf("\nEnter Stock Symbol : ");

    scanf("%19s", symbol);

    node = searchNode(symbol);

    if (node == NULL)
    {
        printf("Stock Not Found\n");

        return;
    }

    printf("Enter New Price : ");

    scanf("%f", &newPrice);

    if (!validatePrice(newPrice))
    {
        printf("Invalid Price\n");

        return;
    }

    node->stock.price = newPrice;

    moveToFront(node);

    recordUpdate();

    logStockOperation(
        "STOCK_UPDATE",
        symbol);

    printf("Stock Updated Successfully\n");
}

void deleteStock(void)
{
    char symbol[SYMBOL_LENGTH];

    Node *node;

    printf("\nEnter Stock Symbol : ");

    scanf("%19s", symbol);

    node = searchNode(symbol);

    if (node == NULL)
    {
        printf("Stock Not Found\n");

        return;
    }

    removeFromLRU(node);

    if (deleteNode(symbol))
    {
        recordDelete();

        logStockOperation(
            "STOCK_DELETE",
            symbol);

        printf("Stock Deleted Successfully\n");
    }
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
            printf("%-15s %-15.2f %-15ld\n",
                   current->stock.symbol,
                   current->stock.price,
                   current->stock.volume);

            current = current->hashNext;
        }
    }
}