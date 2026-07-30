#ifndef LRU_CACHE_H
#define LRU_CACHE_H

#include "../model/stock.h"

extern Node *lruHead;
extern Node *lruTail;

void addToFront(Node *node);

void moveToFront(Node *node);

void removeFromLRU(Node *node);

Node* getLRUTail(void);

void displayLRU(void);

#endif
