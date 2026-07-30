#ifndef HASH_TABLE_H
#define HASH_TABLE_H

#include "../model/stock.h"

extern Node *hashTable[TABLE_SIZE];

unsigned int hashFunction(const char *symbol);

int insertNode(Stock stock);

Node* searchNode(const char *symbol);

int deleteNode(const char *symbol);

#endif