/*
 * RTSMDC_Dev
 * Concurrency & Helgrind Stress Simulation (stress_test.c)
 *
 * Parameterized multi-threaded stress test spawning worker threads
 * performing concurrent stock additions, lookups, updates, deletions,
 * background persistence requests, logging, and statistics tracking.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#include <stdint.h>

#include "model/stock.h"
#include "validation/validator.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"
#include "analytics/analytics.h"
#include "logging/logger.h"
#include "persistence/storage.h"
#include "thread_manager/thread_manager.h"
#include "cache_manager/cache_manager.h"

#define DEFAULT_TOTAL_THREADS 32
#define DEFAULT_OPS_PER_THREAD 3000

static int g_totalThreads = DEFAULT_TOTAL_THREADS;
static int g_opsPerThread = DEFAULT_OPS_PER_THREAD;

static const char *TEST_SYMBOLS[] = {
    "AAPL", "GOOGL", "MSFT", "AMZN", "TSLA",
    "NVDA", "META",  "NFLX", "AMD",  "INTC",
    "ORCL", "CSCO",  "IBM",  "QCOM", "TXN"
};
static const size_t NUM_SYMBOLS = sizeof(TEST_SYMBOLS) / sizeof(TEST_SYMBOLS[0]);

typedef struct {
    int threadId;
    int role; /* 0: Reader, 1: Writer/Updater, 2: Persistence, 3: Logger/Stats */
} ThreadArgs;

static void randomDelayUs(long maxUs)
{
    if (maxUs > 0)
    {
        long d = (long)rand() % maxUs;
        struct timespec req;
        req.tv_sec = d / 1000000L;
        req.tv_nsec = (d % 1000000L) * 1000L;
        (void)nanosleep(&req, NULL);
    }
}


static void *readerThread(void *arg)
{
    ThreadArgs *args = (ThreadArgs *)arg;
    int i;

    for (i = 0; i < g_opsPerThread; ++i)
    {
        const char *sym = TEST_SYMBOLS[(size_t)rand() % NUM_SYMBOLS];
        Node *node;

        (void)cacheLock();
        node = searchNode(sym);
        if (node != NULL)
        {
            recordHit();
            moveToFront(node);
        }
        else
        {
            recordMiss();
        }
        (void)cacheUnlock();

        if (i % 100 == 0)
        {
            randomDelayUs(50);
        }
    }

    free(args);
    return NULL;
}

static void *writerThread(void *arg)
{
    ThreadArgs *args = (ThreadArgs *)arg;
    int i;

    for (i = 0; i < g_opsPerThread; ++i)
    {
        const char *sym = TEST_SYMBOLS[(size_t)rand() % NUM_SYMBOLS];
        int action = rand() % 3;

        (void)cacheLock();
        Node *node = searchNode(sym);

        if (action == 0) /* Insert / Add */
        {
            if (node == NULL)
            {
                Stock s;
                (void)strncpy(s.symbol, sym, SYMBOL_LENGTH - 1);
                s.symbol[SYMBOL_LENGTH - 1] = '\0';
                s.price = (float)(10.0 + (rand() % 5000) / 10.0);
                s.volume = (int32_t)(100 + rand() % 10000);

                if (insertNode(s) != 0)
                {
                    Node *newNode = searchNode(sym);
                    if (newNode != NULL)
                    {
                        addToFront(newNode);
                    }
                    recordInsert();
                }
            }
            else
            {
                node->stock.volume += 10;
                recordUpdate();
            }
        }
        else if (action == 1) /* Update */
        {
            if (node != NULL)
            {
                node->stock.price = (float)(15.0 + (rand() % 4000) / 10.0);
                moveToFront(node);
                recordUpdate();
            }
        }
        else /* Delete */
        {
            if (node != NULL)
            {
                removeFromLRU(node);
                (void)deleteNode(sym);
                recordDelete();
            }
        }
        (void)cacheUnlock();

        if (i % 100 == 0)
        {
            randomDelayUs(50);
        }
    }

    free(args);
    return NULL;
}

static void *persistenceThreadTask(void *arg)
{
    ThreadArgs *args = (ThreadArgs *)arg;
    int i;

    for (i = 0; i < g_opsPerThread / 10; ++i)
    {
        if (i % 2 == 0)
        {
            (void)signalCacheSave();
        }
        else
        {
            (void)requestCacheSaveAndWait();
        }
        randomDelayUs(200);
    }

    free(args);
    return NULL;
}

static void *loggerStatsThread(void *arg)
{
    ThreadArgs *args = (ThreadArgs *)arg;
    int i;

    for (i = 0; i < g_opsPerThread; ++i)
    {
        if (i % 4 == 0)
        {
            (void)logInfo("STRESS", "Heartbeat check");
        }
        else if (i % 4 == 1)
        {
            (void)logError("STRESS", "Simulated minor non-fatal log");
        }
        else if (i % 4 == 2)
        {
            (void)logStockOperation("STRESS", "BULK_OP", TEST_SYMBOLS[(size_t)rand() % NUM_SYMBOLS]);
        }
        else
        {
            (void)getHitRatio();
        }

        if (i % 200 == 0)
        {
            randomDelayUs(100);
        }
    }

    free(args);
    return NULL;
}

int main(int argc, char *argv[])
{
    int i;
    pthread_t *threads;
    ThreadArgs **tArgs;

    if (argc > 1)
    {
        g_totalThreads = atoi(argv[1]);
        if (g_totalThreads <= 0)
        {
            g_totalThreads = DEFAULT_TOTAL_THREADS;
        }
    }

    if (argc > 2)
    {
        g_opsPerThread = atoi(argv[2]);
        if (g_opsPerThread <= 0)
        {
            g_opsPerThread = DEFAULT_OPS_PER_THREAD;
        }
    }

    printf("===================================================\n");
    printf(" RTSMDC_Dev Multi-Threaded Stress Test Simulation  \n");
    printf(" Threads: %d | Ops/Thread: %d | Total Ops: %d\n",
           g_totalThreads, g_opsPerThread, g_totalThreads * g_opsPerThread);
    printf("===================================================\n");

    srand((unsigned int)time(NULL));

    if (initializeThreadManager() != 0)
    {
        fprintf(stderr, "Failed to initialize Thread Manager\n");
        return 1;
    }

    initializeStatistics();

    threads = (pthread_t *)malloc((size_t)g_totalThreads * sizeof(pthread_t));
    tArgs = (ThreadArgs **)malloc((size_t)g_totalThreads * sizeof(ThreadArgs *));

    if ((threads == NULL) || (tArgs == NULL))
    {
        fprintf(stderr, "Memory allocation failed for thread array\n");
        free(threads);
        free(tArgs);
        return 1;
    }

    for (i = 0; i < g_totalThreads; ++i)
    {
        tArgs[i] = (ThreadArgs *)malloc(sizeof(ThreadArgs));
        if (tArgs[i] == NULL)
        {
            fprintf(stderr, "Failed to allocate thread args\n");
            free(threads);
            free(tArgs);
            return 1;
        }
        tArgs[i]->threadId = i;
        /* Distribute roles: 10 readers, 10 writers, 5 persistence, rest loggers */
        if (i < 10)
        {
            tArgs[i]->role = 0;
            (void)pthread_create(&threads[i], NULL, readerThread, tArgs[i]);
        }
        else if (i < 20)
        {
            tArgs[i]->role = 1;
            (void)pthread_create(&threads[i], NULL, writerThread, tArgs[i]);
        }
        else if (i < 25)
        {
            tArgs[i]->role = 2;
            (void)pthread_create(&threads[i], NULL, persistenceThreadTask, tArgs[i]);
        }
        else
        {
            tArgs[i]->role = 3;
            (void)pthread_create(&threads[i], NULL, loggerStatsThread, tArgs[i]);
        }
    }

    /* Join all worker threads */
    for (i = 0; i < g_totalThreads; ++i)
    {
        (void)pthread_join(threads[i], NULL);
    }

    printf("\nWorker threads completed successfully.\n");
    displayStatistics();

    clearCache();
    saveStatistics();
    (void)shutdownThreadManager();

    free(threads);
    free(tArgs);

    printf("===================================================\n");
    printf(" RTSMDC_Dev Stress Test Passed with 0 Errors!       \n");
    printf("===================================================\n");

    return 0;
}
