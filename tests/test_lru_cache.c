#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <string.h>

#include "../lru_cache/lru_cache.h"
#include "../memory/memory_manager.h"
#include "../model/stock.h"

void resetLRU(void)
{
    Node *current = lruHead;
    while (current != NULL) {
        Node *next = current->nextLRU;
        current->prevLRU = NULL;
        current->nextLRU = NULL;
        current = next;
    }
    lruHead = NULL;
    lruTail = NULL;
}

void test_addToFront_single_node(void)
{
    Node *node = allocateNode();
    strcpy(node->stock.symbol, "AAPL");

    resetLRU();
    addToFront(node);

    CU_ASSERT_PTR_EQUAL(lruHead, node);
    CU_ASSERT_PTR_EQUAL(lruTail, node);
    CU_ASSERT_PTR_NULL(node->prevLRU);
    CU_ASSERT_PTR_NULL(node->nextLRU);

    freeNode(node);
}

void test_moveToFront_and_remove(void)
{
    Node *node1 = allocateNode();
    Node *node2 = allocateNode();
    Node *node3 = allocateNode();

    strcpy(node1->stock.symbol, "AAPL");
    strcpy(node2->stock.symbol, "GOOG");
    strcpy(node3->stock.symbol, "MSFT");

    resetLRU();
    addToFront(node1);
    addToFront(node2);
    addToFront(node3);

    CU_ASSERT_PTR_EQUAL(lruHead, node3);
    CU_ASSERT_PTR_EQUAL(lruTail, node1);

    moveToFront(node1);
    CU_ASSERT_PTR_EQUAL(lruHead, node1);
    CU_ASSERT_PTR_EQUAL(lruTail, node2);

    removeFromLRU(node1);
    CU_ASSERT_PTR_EQUAL(lruHead, node3);
    CU_ASSERT_PTR_NULL(node1->prevLRU);
    CU_ASSERT_PTR_NULL(node1->nextLRU);

    freeNode(node1);
    freeNode(node2);
    freeNode(node3);
}

int main(void)
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("LRUSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_add_test(suite, "test_addToFront_single_node", test_addToFront_single_node);
    CU_add_test(suite, "test_moveToFront_and_remove", test_moveToFront_and_remove);

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();
    return (failures > 0) ? 1 : 0;
}
