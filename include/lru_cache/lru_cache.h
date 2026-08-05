/*
 * RTSMDC_Dev
 * LRU cache manager (lru_cache.h)
 *
 * Least-recently-used cache ordering and eviction support.
 *
 * Thread ownership / synchronization:
 *   - No internal synchronization; callers must manage shared access.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef LRU_CACHE_H
#define LRU_CACHE_H

#include "model/stock.h"

extern Node *lruHead;
extern Node *lruTail;

void addToFront(Node *node);

void moveToFront(Node *node);

void removeFromLRU(Node *node);

Node* getLRUTail(void);

void displayLRU(void);

void clearLRU(void);

#endif
