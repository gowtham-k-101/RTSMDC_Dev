/*
 * CUnit test suite for LRU cache module
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CUnit/Basic.h>

#include "model/stock.h"
#include "lru_cache/lru_cache.h"
#include "memory/memory_manager.h"

static void test_lruOperations(void)
{
    clearLRU();

    Node *n1 = allocateNode();
    Node *n2 = allocateNode();
    Node *n3 = allocateNode();

    (void)strncpy(n1->stock.symbol, "S1", SYMBOL_LENGTH);
    (void)strncpy(n2->stock.symbol, "S2", SYMBOL_LENGTH);
    (void)strncpy(n3->stock.symbol, "S3", SYMBOL_LENGTH);

    addToFront(n1);
    CU_ASSERT_PTR_EQUAL(lruHead, n1);
    CU_ASSERT_PTR_EQUAL(lruTail, n1);

    addToFront(n2);
    CU_ASSERT_PTR_EQUAL(lruHead, n2);
    CU_ASSERT_PTR_EQUAL(lruTail, n1);

    addToFront(n3);
    CU_ASSERT_PTR_EQUAL(lruHead, n3);
    CU_ASSERT_PTR_EQUAL(getLRUTail(), n1);

    moveToFront(n1);
    CU_ASSERT_PTR_EQUAL(lruHead, n1);

    removeFromLRU(n2);
    CU_ASSERT_PTR_NOT_EQUAL(lruHead, n2);
    CU_ASSERT_PTR_NOT_EQUAL(lruTail, n2);

    clearLRU();
    CU_ASSERT_PTR_NULL(lruHead);
    CU_ASSERT_PTR_NULL(lruTail);

    freeNode(n1);
    freeNode(n2);
    freeNode(n3);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("LRUCacheSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_lruOperations", test_lruOperations))
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
    int failures = (int)CU_get_number_of_failures();
    CU_cleanup_registry();

    return (failures == 0) ? 0 : 1;
}
