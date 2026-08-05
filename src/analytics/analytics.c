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
#include <stdio.h>

#include "model/statistics.h"

#include "analytics/analytics.h"

Statistics stats;

void initializeStatistics(void)
{
    stats.cacheHits = 0;
    stats.cacheMisses = 0;

    stats.inserts = 0;
    stats.updates = 0;
    stats.deletions = 0;

    stats.evictions = 0;
}

void recordHit(void)
{
    stats.cacheHits++;
}

void recordMiss(void)
{
    stats.cacheMisses++;
}

void recordInsert(void)
{
    stats.inserts++;
}

void recordUpdate(void)
{
    stats.updates++;
}

void recordDelete(void)
{
    stats.deletions++;
}

void recordEviction(void)
{
    stats.evictions++;
}

float getHitRatio(void)
{
    uint64_t totalRequests;

    totalRequests =
        (uint64_t)stats.cacheHits +
        (uint64_t)stats.cacheMisses;

    if (totalRequests == 0ULL)
    {
        return 0.0f;
    }

    return ((float)stats.cacheHits /
            (float)totalRequests) * 100.0f;
}

void displayStatistics(void)
{
    printf("\n");
    printf("=====================================\n");
    printf("         CACHE STATISTICS\n");
    printf("=====================================\n");

    printf("Cache Hits     : %" PRIu32 "\n",
           stats.cacheHits);

    printf("Cache Misses   : %" PRIu32 "\n",
           stats.cacheMisses);

    printf("Insertions     : %" PRIu32 "\n",
           stats.inserts);

    printf("Updates        : %" PRIu32 "\n",
           stats.updates);

    printf("Deletions      : %" PRIu32 "\n",
           stats.deletions);

    printf("Evictions      : %" PRIu32 "\n",
           stats.evictions);

    printf("Hit Ratio      : %.2f%%\n",
           getHitRatio());

    printf("=====================================\n");
}

void saveStatistics(void)
{
    FILE *fp;

    fp = fopen("data/statistics.dat", "w");

    if (fp == NULL)
    {
        return;
    }

    fprintf(fp,
            "%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
            stats.cacheHits,
            stats.cacheMisses,
            stats.inserts,
            stats.updates,
            stats.deletions,
            stats.evictions);

    fclose(fp);
}

void loadStatistics(void)
{
    FILE *fp;

    fp = fopen("data/statistics.dat", "r");

    if(fp == NULL)
    {
        initializeStatistics();
        return;
    }

    fscanf(fp,
           "%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
           &stats.cacheHits,
           &stats.cacheMisses,
           &stats.inserts,
           &stats.updates,
           &stats.deletions,
           &stats.evictions);

    fclose(fp);
}