/*
 * CUnit test suite for hash table module
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CUnit/Basic.h>

#include "model/stock.h"
#include "hash_table/hash_table.h"

static void test_insertSearchDeleteNode(void)
{
    clearHashTable();

    Stock s1 = {"AAPL", 150.5f, 1000};
    Stock s2 = {"GOOG", 2800.0f, 500};

    CU_ASSERT_EQUAL(insertNode(s1), 1);
    CU_ASSERT_EQUAL(insertNode(s2), 1);

    Node *found1 = searchNode("AAPL");
    CU_ASSERT_PTR_NOT_NULL(found1);
    if (found1 != NULL)
    {
        CU_ASSERT_STRING_EQUAL(found1->stock.symbol, "AAPL");
        CU_ASSERT_DOUBLE_EQUAL(found1->stock.price, 150.5f, 0.01f);
    }

    Node *found2 = searchNode("GOOG");
    CU_ASSERT_PTR_NOT_NULL(found2);

    Node *notFound = searchNode("MSFT");
    CU_ASSERT_PTR_NULL(notFound);

    CU_ASSERT_EQUAL(deleteNode("AAPL"), 1);
    CU_ASSERT_PTR_NULL(searchNode("AAPL"));

    CU_ASSERT_EQUAL(deleteNode("NONEXISTENT"), 0);

    /* Bucket collision chain test to exercise previous != NULL deletion branch */
    char symBuf[20];
    int k;
    for (k = 0; k < 50; k++)
    {
        snprintf(symBuf, sizeof(symBuf), "STK%d", k);
        Stock st = {"", 10.0f + (float)k, 100 + k};
        strncpy(st.symbol, symBuf, sizeof(st.symbol) - 1);
        (void)insertNode(st);
    }
    /* Delete all inserted stocks to exercise chained previous != NULL deletions */
    for (k = 0; k < 50; k++)
    {
        snprintf(symBuf, sizeof(symBuf), "STK%d", k);
        (void)deleteNode(symBuf);
    }

    clearHashTable();
    CU_ASSERT_PTR_NULL(searchNode("GOOG"));
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("HashTableSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_insertSearchDeleteNode", test_insertSearchDeleteNode))
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
