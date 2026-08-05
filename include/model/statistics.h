/*
 * RTSMDC_Dev
 * Data model definitions (statistics.h)
 *
 * Domain objects for stock, user, and statistics state.
 *
 * Thread ownership / synchronization:
 *   - Pure data representations; no thread ownership.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef STATISTICS_H
#define STATISTICS_H

#include <stdint.h>

typedef struct
{
    uint32_t cacheHits;

    uint32_t cacheMisses;

    uint32_t inserts;

    uint32_t updates;

    uint32_t deletions;

    uint32_t evictions;

} Statistics;

#endif
