#include <stdio.h>

#include "../model/statistics.h"

#include "analytics.h"

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
    unsigned long totalRequests;

    totalRequests =
        stats.cacheHits +
        stats.cacheMisses;

    if (totalRequests == 0UL)
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

    printf("Cache Hits     : %lu\n",
           stats.cacheHits);

    printf("Cache Misses   : %lu\n",
           stats.cacheMisses);

    printf("Insertions     : %lu\n",
           stats.inserts);

    printf("Updates        : %lu\n",
           stats.updates);

    printf("Deletions      : %lu\n",
           stats.deletions);

    printf("Evictions      : %lu\n",
           stats.evictions);

    printf("Hit Ratio      : %.2f%%\n",
           getHitRatio());

    printf("=====================================\n");
}

void saveStatistics(void)
{
    FILE *fp;

    fp = fopen("data/statistics.dat", "w");

    if(fp == NULL)
    {
        return;
    }

    fprintf(fp,
            "%lu %lu %lu %lu %lu %lu\n",
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
           "%lu %lu %lu %lu %lu %lu",
           &stats.cacheHits,
           &stats.cacheMisses,
           &stats.inserts,
           &stats.updates,
           &stats.deletions,
           &stats.evictions);

    fclose(fp);
}