/*
 * RTSMDC_Dev
 * Persistence layer (storage.c)
 *
 * Cache save/load/backup functions for disk storage.
 *
 * Thread ownership / synchronization:
 *   - Acquires cacheLock()/cacheUnlock() to serialize cache file operations.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>

#include "model/stock.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"
#include "analytics/analytics.h"
#include "logging/logger.h"
#include "thread_manager/thread_manager.h"

#include "persistence/storage.h"

#define CACHE_FILE "data/cache_data.dat"
#define BACKUP_FILE "data/backup.dat"

int saveCache(void)
{
    FILE *fp;
    int i;
    Node *current;
    int result = -1;

    if (cacheLock() != 0)
    {
        return -1;
    }

    fp = fopen(CACHE_FILE, "w");
    if (fp == NULL)
    {
        logError("CACHE", "CACHE_SAVE_FAILED");
        goto cleanup;
    }

    for (i = 0; i < TABLE_SIZE; i++)
    {
        current = hashTable[i];

        while (current != NULL)
        {
            if (fprintf(fp,
                        "%s %.2f %d\n",
                        current->stock.symbol,
                        current->stock.price,
                        current->stock.volume) < 0)
            {
                goto cleanup;
            }

            current = current->hashNext;
        }
    }

    if (fclose(fp) != 0)
    {
        fp = NULL;
        goto cleanup;
    }

    logInfo("CACHE", "CACHE_SAVED");
    printf("Cache Saved Successfully\n");
    result = 0;
    goto unlock;

cleanup:
    if (fp != NULL)
    {
        fclose(fp);
    }
    printf("Unable To Save Cache\n");

unlock:
    cacheUnlock();
    return result;
}

int loadCache(void)
{
    FILE *fp;
    Stock stock;
    Node *node;
    int loadCount = 0;

    if (cacheLock() != 0)
    {
        return -1;
    }

    fp = fopen(CACHE_FILE, "r");
    if (fp == NULL)
    {
        logError("CACHE", "CACHE_LOAD_FAILED");
        cacheUnlock();
        return -1;
    }

    clearHashTable();
    clearLRU();

    while (fscanf(fp,
                  "%19s %f %d",
                  stock.symbol,
                  &stock.price,
                  &stock.volume) == 3)
    {
        if (insertNode(stock) == 0)
        {
            continue;
        }

        node = searchNode(stock.symbol);
        if (node != NULL)
        {
            addToFront(node);
            loadCount++;
        }
    }

    fclose(fp);
    logInfo("CACHE", "CACHE_LOADED");
    cacheUnlock();
    return loadCount;
}

int backupCache(void)
{
    FILE *source = NULL;
    FILE *destination = NULL;
    int ch;
    int result = -1;

    if (cacheLock() != 0)
    {
        return -1;
    }

    source = fopen(CACHE_FILE, "r");
    if (source == NULL)
    {
        logError("CACHE", "CACHE_BACKUP_FAILED");
        printf("No Cache Data Available\n");
        cacheUnlock();
        return -1;
    }

    destination = fopen(BACKUP_FILE, "w");
    if (destination == NULL)
    {
        logError("CACHE", "CACHE_BACKUP_FAILED");
        printf("Backup Failed\n");
        goto cleanup;
    }

    while ((ch = fgetc(source)) != EOF)
    {
        if (fputc(ch, destination) == EOF)
        {
            logError("CACHE", "CACHE_BACKUP_FAILED");
            goto cleanup;
        }
    }

    if (fclose(destination) != 0)
    {
        destination = NULL;
        logError("CACHE", "CACHE_BACKUP_FAILED");
        goto cleanup;
    }
    destination = NULL;

    if (fclose(source) != 0)
    {
        source = NULL;
        logError("CACHE", "CACHE_BACKUP_FAILED");
        goto cleanup;
    }
    source = NULL;

    logInfo("CACHE", "CACHE_BACKUP_CREATED");
    printf("Backup Created Successfully\n");
    result = 0;

    cacheUnlock();
    return result;

cleanup:
    if (source != NULL)
    {
        fclose(source);
    }
    if (destination != NULL)
    {
        fclose(destination);
    }

    cacheUnlock();
    return result;
}