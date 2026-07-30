#include <stdio.h>

#include "../model/stock.h"
#include "../hash_table/hash_table.h"
#include "../lru_cache/lru_cache.h"
#include "../analytics/analytics.h"
#include "../logging/logger.h"

#include "storage.h"

#define CACHE_FILE "data/cache_data.dat"
#define BACKUP_FILE "data/backup.dat"

void saveCache(void)
{
    FILE *fp;

    int i;

    Node *current;

    fp = fopen(CACHE_FILE, "w");

    if (fp == NULL)
    {
        printf("Unable To Save Cache\n");

        logError("CACHE_SAVE_FAILED");

        return;
    }

    for (i = 0; i < TABLE_SIZE; i++)
    {
        current = hashTable[i];

        while (current != NULL)
        {
            fprintf(fp,
                    "%s %.2f %ld\n",
                    current->stock.symbol,
                    current->stock.price,
                    current->stock.volume);

            current = current->hashNext;
        }
    }

    fclose(fp);

    logInfo("CACHE_SAVED");

    printf("Cache Saved Successfully\n");
}

void loadCache(void)
{
    FILE *fp;

    Stock stock;

    Node *node;

    fp = fopen(CACHE_FILE, "r");

    if (fp == NULL)
    {
        return;
    }

    while (fscanf(fp,
                  "%19s %f %ld",
                  stock.symbol,
                  &stock.price,
                  &stock.volume) == 3)
    {
        insertNode(stock);

        node = searchNode(stock.symbol);

        if (node != NULL)
        {
            addToFront(node);
        }
    }

    fclose(fp);

    logInfo("CACHE_LOADED");
}

void backupCache(void)
{
    FILE *source;

    FILE *destination;

    int ch;

    source = fopen(CACHE_FILE, "r");

    if (source == NULL)
    {
        printf("No Cache Data Available\n");
        return;
    }

    destination = fopen(BACKUP_FILE, "w");

    if (destination == NULL)
    {
        fclose(source);

        printf("Backup Failed\n");

        return;
    }

    while ((ch = fgetc(source)) != EOF)
    {
        fputc(ch, destination);
    }

    fclose(source);
    fclose(destination);

    logInfo("CACHE_BACKUP_CREATED");

    printf("Backup Created Successfully\n");
}