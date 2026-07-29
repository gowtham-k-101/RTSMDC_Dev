#ifndef STOCK_H
#define STOCK_H

#define TABLE_SIZE 101
#define CACHE_CAPACITY 10

#define SYMBOL_LENGTH 20

typedef struct
{
    char symbol[SYMBOL_LENGTH];
    float price;
    long volume;
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