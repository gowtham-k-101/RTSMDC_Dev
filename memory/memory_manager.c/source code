#include <stdio.h>
#include <stdlib.h>

#include "../model/stock.h"
#include "memory_manager.h"

Node* allocateNode(void)
{
    Node *node;

    node = (Node *)malloc(sizeof(Node));

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