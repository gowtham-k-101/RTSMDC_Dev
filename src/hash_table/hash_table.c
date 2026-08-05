/*
 * RTSMDC_Dev
 * Hash table storage (hash_table.c)
 *
 * Hash-based stock symbol lookup and storage.
 *
 * Thread ownership / synchronization:
 *   - No internal synchronization; caller must protect shared structures.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "model/stock.h"
#include "memory/memory_manager.h"

#include "hash_table/hash_table.h"

Node *hashTable[TABLE_SIZE] = {NULL};

unsigned int hashFunction(const char *symbol)
{
    unsigned int hash = 0;

    while (*symbol)
    {
        hash = (hash * 31) + (unsigned char)(*symbol);
        symbol++;
    }

    return hash % TABLE_SIZE;
}

int insertNode(Stock stock)
{
    unsigned int index;

    Node *newNode;

    index = hashFunction(stock.symbol);

    newNode = allocateNode();

    if (newNode == NULL)
    {
        return 0;
    }

    newNode->stock = stock;

    newNode->hashNext = hashTable[index];

    hashTable[index] = newNode;

    return 1;
}

void clearHashTable(void)
{
    uint32_t index;
    Node *current;
    Node *next;

    for (index = 0U; index < TABLE_SIZE; ++index)
    {
        current = hashTable[index];

        while (current != NULL)
        {
            next = current->hashNext;
            freeNode(current);
            current = next;
        }

        hashTable[index] = NULL;
    }
}

Node* searchNode(const char *symbol)
{
    unsigned int index;

    Node *current;

    index = hashFunction(symbol);

    current = hashTable[index];

    while (current != NULL)
    {
        if (strcmp(current->stock.symbol, symbol) == 0)
        {
            return current;
        }

        current = current->hashNext;
    }

    return NULL;
}

int deleteNode(const char *symbol)
{
    unsigned int index;

    Node *current;
    Node *previous;

    index = hashFunction(symbol);

    current = hashTable[index];
    previous = NULL;

    while (current != NULL)
    {
        if (strcmp(current->stock.symbol, symbol) == 0)
        {
            if (previous == NULL)
            {
                hashTable[index] = current->hashNext;
            }
            else
            {
                previous->hashNext = current->hashNext;
            }

            freeNode(current);

            return 1;
        }

        previous = current;
        current = current->hashNext;
    }

    return 0;
}