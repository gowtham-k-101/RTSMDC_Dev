/*
 * RTSMDC_Dev
 * LRU cache manager (lru_cache.c)
 *
 * Least-recently-used cache ordering and eviction support.
 *
 * Thread ownership / synchronization:
 *   - No internal synchronization; callers must manage shared access.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>

#include "model/stock.h"
#include "lru_cache/lru_cache.h"

#include "thread_manager/thread_manager.h"

Node *lruHead = NULL;
Node *lruTail = NULL;

void addToFront(Node *node)
{
    if (node == NULL)
    {
        return;
    }

    node->prevLRU = NULL;
    node->nextLRU = lruHead;

    if (lruHead != NULL)
    {
        lruHead->prevLRU = node;
    }

    lruHead = node;

    if (lruTail == NULL)
    {
        lruTail = node;
    }
}

void clearLRU(void)
{
    lruHead = NULL;
    lruTail = NULL;
}

void removeFromLRU(Node *node)
{
    if (node == NULL)
    {
        return;
    }

    if (node->prevLRU != NULL)
    {
        node->prevLRU->nextLRU = node->nextLRU;
    }
    else
    {
        lruHead = node->nextLRU;
    }

    if (node->nextLRU != NULL)
    {
        node->nextLRU->prevLRU = node->prevLRU;
    }
    else
    {
        lruTail = node->prevLRU;
    }

    node->prevLRU = NULL;
    node->nextLRU = NULL;
}

void moveToFront(Node *node)
{
    if (node == NULL)
    {
        return;
    }

    if (node == lruHead)
    {
        return;
    }

    removeFromLRU(node);

    node->prevLRU = NULL;
    node->nextLRU = lruHead;

    if (lruHead != NULL)
    {
        lruHead->prevLRU = node;
    }

    lruHead = node;

    if (lruTail == NULL)
    {
        lruTail = node;
    }
}

Node* getLRUTail(void)
{
    return lruTail;
}

void displayLRU(void)
{
    Node *current;

    (void)cacheLock();
    current = lruHead;

    printf("\n===== LRU ORDER =====\n");

    while (current != NULL)
    {
        printf("%s", current->stock.symbol);

        if (current->nextLRU != NULL)
        {
            printf(" -> ");
        }

        current = current->nextLRU;
    }

    printf("\n");
    (void)cacheUnlock();
}