/*
 * RTSMDC_Dev
 * Thread manager module
 * Provides thread-safe logging queue and cache persistence signaling
 */

#include <errno.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "thread_manager/thread_manager.h"
#include "persistence/storage.h"

#define LOG_QUEUE_LENGTH 64
#define MAX_LOG_ENTRY_SIZE 256
#define LOG_FILE "logs/application.log"

static pthread_t logThread;
static pthread_t persistenceThread;

static pthread_mutex_t logMutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t logCond = PTHREAD_COND_INITIALIZER;

static pthread_mutex_t cacheMutex = PTHREAD_MUTEX_INITIALIZER;

static pthread_mutex_t persistenceMutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t persistenceCond = PTHREAD_COND_INITIALIZER;
static pthread_cond_t persistenceDoneCond = PTHREAD_COND_INITIALIZER;

static int logQueueHead = 0;
static int logQueueTail = 0;
static int logQueueCount = 0;
static char logQueue[LOG_QUEUE_LENGTH][MAX_LOG_ENTRY_SIZE];

static int shutdownRequested = 0;
static int saveRequested = 0;
static int saveCompleted = 0;

static int enqueueLogEntryInternal(const char *entry)
{
    if (entry == NULL)
    {
        return -1;
    }

    if (logQueueCount >= LOG_QUEUE_LENGTH)
    {
        return -1;
    }

    (void)strncpy(logQueue[logQueueTail], entry, (size_t)(MAX_LOG_ENTRY_SIZE - 1));
    logQueue[logQueueTail][MAX_LOG_ENTRY_SIZE - 1] = '\0';
    logQueueTail = (logQueueTail + 1) % LOG_QUEUE_LENGTH;
    ++logQueueCount;
    return 0;
}

static void *logThreadMain(void *context)
{
    (void)context;

    while (1)
    {
        (void)pthread_mutex_lock(&logMutex);

        while ((logQueueCount == 0) && (shutdownRequested == 0))
        {
            (void)pthread_cond_wait(&logCond, &logMutex);
        }

        if ((shutdownRequested != 0) && (logQueueCount == 0))
        {
            (void)pthread_mutex_unlock(&logMutex);
            break;
        }

        if (logQueueCount > 0)
        {
            char entry[MAX_LOG_ENTRY_SIZE];
            FILE *fp;

            (void)strncpy(entry, logQueue[logQueueHead], (size_t)MAX_LOG_ENTRY_SIZE);
            entry[MAX_LOG_ENTRY_SIZE - 1] = '\0';
            logQueueHead = (logQueueHead + 1) % LOG_QUEUE_LENGTH;
            --logQueueCount;
            (void)pthread_mutex_unlock(&logMutex);

            fp = fopen(LOG_FILE, "a");
            if (fp != NULL)
            {
                if (fprintf(fp, "%s\n", entry) < 0)
                {
                    /* Failed log write, but preserve application flow. */
                }
                (void)fclose(fp);
            }
        }
        else
        {
            (void)pthread_mutex_unlock(&logMutex);
        }
    }

    return NULL;
}

static void *persistenceThreadMain(void *context)
{
    (void)context;

    while (1)
    {
        (void)pthread_mutex_lock(&persistenceMutex);

        while ((saveRequested == 0) && (shutdownRequested == 0))
        {
            (void)pthread_cond_wait(&persistenceCond, &persistenceMutex);
        }

        if ((shutdownRequested != 0) && (saveRequested == 0))
        {
            (void)pthread_mutex_unlock(&persistenceMutex);
            break;
        }

        saveRequested = 0;
        (void)pthread_mutex_unlock(&persistenceMutex);

        (void)saveCache();

        (void)pthread_mutex_lock(&persistenceMutex);
        saveCompleted = 1;
        (void)pthread_cond_signal(&persistenceDoneCond);
        (void)pthread_mutex_unlock(&persistenceMutex);
    }

    return NULL;
}

int initializeThreadManager(void)
{
    int result;

    (void)memset(logQueue, 0, sizeof(logQueue));
    logQueueHead = 0;
    logQueueTail = 0;
    logQueueCount = 0;
    shutdownRequested = 0;
    saveRequested = 0;
    saveCompleted = 0;

    result = pthread_mutex_init(&logMutex, NULL);
    if (result != 0)
    {
        return -1;
    }

    result = pthread_cond_init(&logCond, NULL);
    if (result != 0)
    {
        (void)pthread_mutex_destroy(&logMutex);
        return -1;
    }

    result = pthread_mutex_init(&persistenceMutex, NULL);
    if (result != 0)
    {
        (void)pthread_mutex_destroy(&cacheMutex);
        (void)pthread_cond_destroy(&logCond);
        (void)pthread_mutex_destroy(&logMutex);
        return -1;
    }

    result = pthread_cond_init(&persistenceCond, NULL);
    if (result != 0)
    {
        (void)pthread_mutex_destroy(&persistenceMutex);
        (void)pthread_mutex_destroy(&cacheMutex);
        (void)pthread_cond_destroy(&logCond);
        (void)pthread_mutex_destroy(&logMutex);
        return -1;
    }

    result = pthread_cond_init(&persistenceDoneCond, NULL);
    if (result != 0)
    {
        (void)pthread_cond_destroy(&persistenceCond);
        (void)pthread_mutex_destroy(&persistenceMutex);
        (void)pthread_mutex_destroy(&cacheMutex);
        (void)pthread_cond_destroy(&logCond);
        (void)pthread_mutex_destroy(&logMutex);
        return -1;
    }

    result = pthread_create(&logThread, NULL, logThreadMain, NULL);
    if (result != 0)
    {
        (void)pthread_cond_destroy(&persistenceDoneCond);
        (void)pthread_cond_destroy(&persistenceCond);
        (void)pthread_mutex_destroy(&persistenceMutex);
        (void)pthread_mutex_destroy(&cacheMutex);
        (void)pthread_cond_destroy(&logCond);
        (void)pthread_mutex_destroy(&logMutex);
        return -1;
    }

    result = pthread_create(&persistenceThread, NULL, persistenceThreadMain, NULL);
    if (result != 0)
    {
        (void)pthread_mutex_lock(&logMutex);
        shutdownRequested = 1;
        (void)pthread_cond_signal(&logCond);
        (void)pthread_mutex_unlock(&logMutex);

        (void)pthread_join(logThread, NULL);

        (void)pthread_cond_destroy(&persistenceDoneCond);
        (void)pthread_cond_destroy(&persistenceCond);
        (void)pthread_mutex_destroy(&persistenceMutex);
        (void)pthread_mutex_destroy(&cacheMutex);
        (void)pthread_cond_destroy(&logCond);
        (void)pthread_mutex_destroy(&logMutex);
        return -1;
    }

    return 0;
}

int shutdownThreadManager(void)
{
    (void)pthread_mutex_lock(&logMutex);
    shutdownRequested = 1;
    (void)pthread_cond_signal(&logCond);
    (void)pthread_mutex_unlock(&logMutex);

    (void)pthread_mutex_lock(&persistenceMutex);
    shutdownRequested = 1;
    (void)pthread_cond_signal(&persistenceCond);
    (void)pthread_mutex_unlock(&persistenceMutex);

    (void)pthread_join(logThread, NULL);
    (void)pthread_join(persistenceThread, NULL);

    (void)pthread_cond_destroy(&persistenceDoneCond);
    (void)pthread_cond_destroy(&persistenceCond);
    (void)pthread_mutex_destroy(&persistenceMutex);
    (void)pthread_mutex_destroy(&cacheMutex);
    (void)pthread_cond_destroy(&logCond);
    (void)pthread_mutex_destroy(&logMutex);

    return 0;
}

int enqueueLogEntry(const char *entry)
{
    int result;

    if (entry == NULL)
    {
        return -1;
    }

    result = pthread_mutex_lock(&logMutex);
    if (result != 0)
    {
        return -1;
    }

    result = enqueueLogEntryInternal(entry);
    if (result == 0)
    {
        (void)pthread_cond_signal(&logCond);
    }

    (void)pthread_mutex_unlock(&logMutex);
    return result;
}

int signalCacheSave(void)
{
    int result;

    result = pthread_mutex_lock(&persistenceMutex);
    if (result != 0)
    {
        return -1;
    }

    saveRequested = 1;
    saveCompleted = 0;
    (void)pthread_cond_signal(&persistenceCond);
    (void)pthread_mutex_unlock(&persistenceMutex);

    return 0;
}

int requestCacheSaveAndWait(void)
{
    int result;

    result = pthread_mutex_lock(&persistenceMutex);
    if (result != 0)
    {
        return -1;
    }

    if (shutdownRequested != 0)
    {
        (void)pthread_mutex_unlock(&persistenceMutex);
        return -1;
    }

    saveRequested = 1;
    saveCompleted = 0;
    (void)pthread_cond_signal(&persistenceCond);

    while ((saveCompleted == 0) && (shutdownRequested == 0))
    {
        (void)pthread_cond_wait(&persistenceDoneCond, &persistenceMutex);
    }

    result = (saveCompleted != 0) ? 0 : -1;
    (void)pthread_mutex_unlock(&persistenceMutex);

    return result;
}

int cacheLock(void)
{
    return pthread_mutex_lock(&cacheMutex);
}

int cacheUnlock(void)
{
    return pthread_mutex_unlock(&cacheMutex);
}
