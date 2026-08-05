/*
 * RTSMDC_Dev
 * Memory manager (memory_manager.h)
 *
 * Node allocation and release helpers.
 *
 * Thread ownership / synchronization:
 *   - No internal synchronization required.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef MEMORY_MANAGER_H
#define MEMORY_MANAGER_H

#include "model/stock.h"

Node* allocateNode(void);

void freeNode(Node *node);

#endif