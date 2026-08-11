/*
 * RTSMDC_Dev
 * Data model definitions (stock.h)
 *
 * Domain objects for stock, user, and statistics state.
 *
 * Thread ownership / synchronization:
 *   - Pure data representations; no thread ownership.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef STOCK_H
#define STOCK_H

#include <stdint.h>

enum
{
    TABLE_SIZE = 101,
    CACHE_CAPACITY = 100,
    SYMBOL_LENGTH = 20
};

typedef struct
{
    char symbol[SYMBOL_LENGTH];
    uint32_t price_cents;
    uint32_t bid_cents;
    uint32_t ask_cents;
    int32_t volume;
    char exchange[8];
} Stock;

typedef struct Node
{
    Stock stock;

    /*
     * Hash Table Chain Pointer
     */
    struct Node *hashNext;

    /*
     * LRU Doubly Linked List Pointers
     */
    struct Node *prevLRU;
    struct Node *nextLRU;

} Node;

#endif