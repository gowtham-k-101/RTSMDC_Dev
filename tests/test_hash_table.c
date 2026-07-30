#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <string.h>

#include "../hash_table/hash_table.h"
#include "../memory/memory_manager.h"
#include "../model/stock.h"

void test_hashFunction_same_symbol(void)
{
    unsigned int hash1 = hashFunction("AAPL");
    unsigned int hash2 = hashFunction("AAPL");

    CU_ASSERT_EQUAL(hash1, hash2);
}

void test_insert_search_delete_node(void)
{
    Stock stock;

    strcpy(stock.symbol, "AAPL");
    stock.price = 150.0f;
    stock.volume = 1000;

    Node *found;

    CU_ASSERT_EQUAL(insertNode(stock), 1);

    found = searchNode("AAPL");
    CU_ASSERT_PTR_NOT_NULL(found);
    CU_ASSERT_STRING_EQUAL(found->stock.symbol, "AAPL");
    CU_ASSERT_DOUBLE_EQUAL(found->stock.price, 150.0, 0.001);
    CU_ASSERT_EQUAL(found->stock.volume, 1000);

    CU_ASSERT_EQUAL(deleteNode("AAPL"), 1);
    CU_ASSERT_PTR_NULL(searchNode("AAPL"));
}

int main(void)
{
    CU_initialize_registry();

    CU_pSuite suite = CU_add_suite("HashTableSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (CU_add_test(suite, "test_hashFunction_same_symbol", test_hashFunction_same_symbol) == NULL ||
        CU_add_test(suite, "test_insert_search_delete_node", test_insert_search_delete_node) == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();

    return (failures > 0) ? 1 : 0;
}
