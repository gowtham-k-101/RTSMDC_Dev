/*
 * RTSMDC_Dev
 * Analytics subsystem (analytics.c)
 *
 * Statistics tracking and cache performance recording.
 *
 * Thread ownership / synchronization:
 *   - Stateless operations; no thread ownership.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <inttypes.h>
#include <pthread.h>
#include <stdio.h>

#include "model/statistics.h"
#include "analytics/analytics.h"

Statistics stats;
static pthread_mutex_t statsMutex = PTHREAD_MUTEX_INITIALIZER;

void initializeStatistics(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.cacheHits = 0;
    stats.cacheMisses = 0;
    stats.inserts = 0;
    stats.updates = 0;
    stats.deletions = 0;
    stats.evictions = 0;
    (void)pthread_mutex_unlock(&statsMutex);
}

void recordHit(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.cacheHits++;
    (void)pthread_mutex_unlock(&statsMutex);
}

void recordMiss(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.cacheMisses++;
    (void)pthread_mutex_unlock(&statsMutex);
}

void recordInsert(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.inserts++;
    (void)pthread_mutex_unlock(&statsMutex);
}

void recordUpdate(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.updates++;
    (void)pthread_mutex_unlock(&statsMutex);
}

void recordDelete(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.deletions++;
    (void)pthread_mutex_unlock(&statsMutex);
}

void recordEviction(void)
{
    (void)pthread_mutex_lock(&statsMutex);
    stats.evictions++;
    (void)pthread_mutex_unlock(&statsMutex);
}

float getHitRatio(void)
{
    uint64_t totalRequests;
    float ratio;

    (void)pthread_mutex_lock(&statsMutex);
    totalRequests = (uint64_t)stats.cacheHits + (uint64_t)stats.cacheMisses;

    if (totalRequests == 0ULL)
    {
        (void)pthread_mutex_unlock(&statsMutex);
        return 0.0f;
    }

    ratio = ((float)stats.cacheHits / (float)totalRequests) * 100.0f;
    (void)pthread_mutex_unlock(&statsMutex);

    return ratio;
}

void displayStatistics(void)
{
    (void)pthread_mutex_lock(&statsMutex);

    printf("\n");
    printf("=====================================\n");
    printf("         CACHE STATISTICS\n");
    printf("=====================================\n");

    printf("Cache Hits     : %" PRIu32 "\n", stats.cacheHits);
    printf("Cache Misses   : %" PRIu32 "\n", stats.cacheMisses);
    printf("Insertions     : %" PRIu32 "\n", stats.inserts);
    printf("Updates        : %" PRIu32 "\n", stats.updates);
    printf("Deletions      : %" PRIu32 "\n", stats.deletions);
    printf("Evictions      : %" PRIu32 "\n", stats.evictions);

    {
        uint64_t totalRequests = (uint64_t)stats.cacheHits + (uint64_t)stats.cacheMisses;
        float ratio = (totalRequests == 0ULL) ? 0.0f : (((float)stats.cacheHits / (float)totalRequests) * 100.0f);
        printf("Hit Ratio      : %.2f%%\n", ratio);
    }

    printf("=====================================\n");

    (void)pthread_mutex_unlock(&statsMutex);
}

void saveStatistics(void)
{
    FILE *fp;

    (void)pthread_mutex_lock(&statsMutex);
    fp = fopen("data/statistics.dat", "w");

    if (fp == NULL)
    {
        (void)pthread_mutex_unlock(&statsMutex);
        return;
    }

    (void)fprintf(fp,
                  "%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
                  stats.cacheHits,
                  stats.cacheMisses,
                  stats.inserts,
                  stats.updates,
                  stats.deletions,
                  stats.evictions);

    (void)fclose(fp);
    (void)pthread_mutex_unlock(&statsMutex);
}

void loadStatistics(void)
{
    FILE *fp;

    (void)pthread_mutex_lock(&statsMutex);
    fp = fopen("data/statistics.dat", "r");

    if (fp == NULL)
    {
        (void)pthread_mutex_unlock(&statsMutex);
        initializeStatistics();
        return;
    }

    if (fscanf(fp,
               "%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               &stats.cacheHits,
               &stats.cacheMisses,
               &stats.inserts,
               &stats.updates,
               &stats.deletions,
               &stats.evictions) != 6)
    {
        /* Invalid or corrupt file format, reset to zeros */
        stats.cacheHits = 0;
        stats.cacheMisses = 0;
        stats.inserts = 0;
        stats.updates = 0;
        stats.deletions = 0;
        stats.evictions = 0;
    }

    (void)fclose(fp);
    (void)pthread_mutex_unlock(&statsMutex);
}