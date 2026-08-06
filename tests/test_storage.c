/*
 * CUnit test suite for storage / persistence module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "persistence/storage.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"
#include "thread_manager/thread_manager.h"

static void test_storageAPIs(void)
{
    clearHashTable();
    clearLRU();

    Stock s = {"SAVE_TEST", 123.45f, 500};
    (void)insertNode(s);
    Node *n = searchNode("SAVE_TEST");
    if (n != NULL)
    {
        addToFront(n);
    }

    int saveRes = saveCache();
    CU_ASSERT_EQUAL(saveRes, 0);

    int loadRes = loadCache();
    CU_ASSERT_TRUE(loadRes >= 0);

    int backupRes = backupCache();
    CU_ASSERT_EQUAL(backupRes, 0);

    clearHashTable();
    clearLRU();
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("StorageSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_storageAPIs", test_storageAPIs))
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
