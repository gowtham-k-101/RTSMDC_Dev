/*
 * RTSMDC_Dev
 * CUnit test suite for storage persistence module (test_storage.c)
 *
 * Unit tests for binary saveCache(), loadCache(), backupCache(), missing files, and disk errors.
 *
 * Thread ownership / synchronization:
 *   - Executes within single-threaded test harness.
 *
 * Public APIs:
 *   - Test suite execution entry point.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <CUnit/Basic.h>

#include "persistence/storage.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"
#include "thread_manager/thread_manager.h"

static void test_storageAPIs(void)
{
    clearHashTable();
    clearLRU();

    Stock s = {"SAVE_TEST", 12345, 12300, 12400, 500, "NASDAQ"};
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

    /* Test error paths when data/cache_data.dat is missing */
    (void)remove("data/cache_data.dat");
    int loadResFail = loadCache();
    CU_ASSERT_EQUAL(loadResFail, -1);

    int backupResFail = backupCache();
    CU_ASSERT_EQUAL(backupResFail, -1);

    /* Test fopen write failure paths using directory placement */
    (void)remove("data/cache_data.dat");
    if (mkdir("data/cache_data.dat", 0755) == 0)
    {
        CU_ASSERT_EQUAL(saveCache(), -1);
        (void)rmdir("data/cache_data.dat");
    }

    (void)remove("data/backup.dat");
    if (mkdir("data/backup.dat", 0755) == 0)
    {
        /* Re-create valid cache_data.dat for backup target fail test */
        FILE *tmp = fopen("data/cache_data.dat", "wb");
        if (tmp != NULL) { fwrite(&s, sizeof(Stock), 1, tmp); fclose(tmp); }
        CU_ASSERT_EQUAL(backupCache(), -1);
        (void)rmdir("data/backup.dat");
        (void)remove("data/cache_data.dat");
    }
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
