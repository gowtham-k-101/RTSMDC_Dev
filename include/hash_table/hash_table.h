/*
 * RTSMDC_Dev
 * Hash table storage (hash_table.h)
 *
 * Hash-based stock symbol lookup and storage.
 *
 * Thread ownership / synchronization:
 *   - No internal synchronization; caller must protect shared structures.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef HASH_TABLE_H
#define HASH_TABLE_H

#include "model/stock.h"

extern Node *hashTable[TABLE_SIZE];

unsigned int hashFunction(const char *symbol);

int insertNode(Stock stock);

Node* searchNode(const char *symbol);

int deleteNode(const char *symbol);

void clearHashTable(void);

#endif