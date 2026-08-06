/*
 * CUnit test suite for hash table module
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CUnit/Basic.h>

#include "model/stock.h"
#include "hash_table/hash_table.h"

static void test_hashFunction(void)
{
    unsigned int h1 = hashFunction("AAPL");
    unsigned int h2 = hashFunction("AAPL");
    unsigned int h3 = hashFunction("GOOG");

    CU_ASSERT_EQUAL(h1, h2);
    CU_ASSERT_TRUE(h1 < TABLE_SIZE);
    CU_ASSERT_TRUE(h3 < TABLE_SIZE);
}

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

    if ((NULL == CU_add_test(pSuite, "test_hashFunction", test_hashFunction)) ||
        (NULL == CU_add_test(pSuite, "test_insertSearchDeleteNode", test_insertSearchDeleteNode)))
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
