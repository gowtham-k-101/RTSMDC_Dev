/*
 * RTSMDC_Dev
 * Memory manager (memory_manager.c)
 *
 * Node allocation and release helpers.
 *
 * Thread ownership / synchronization:
 *   - No internal synchronization required.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>
#include <stdlib.h>

#include "model/stock.h"
#include "memory/memory_manager.h"

Node* allocateNode(void)
{
    Node *node;

    node = malloc(sizeof(*node));

    if (node == NULL)
    {
        printf("Memory Allocation Failed\n");
        return NULL;
    }

    node->hashNext = NULL;
    node->prevLRU = NULL;
    node->nextLRU = NULL;

    return node;
}

void freeNode(Node *node)
{
    if (node != NULL)
    {
        free(node);
    }
}