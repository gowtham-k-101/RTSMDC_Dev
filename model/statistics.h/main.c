#ifndef STATISTICS_H
#define STATISTICS_H

typedef struct
{
    unsigned long cacheHits;

    unsigned long cacheMisses;

    unsigned long inserts;

    unsigned long updates;

    unsigned long deletions;

    unsigned long evictions;

} Statistics;

#endif
