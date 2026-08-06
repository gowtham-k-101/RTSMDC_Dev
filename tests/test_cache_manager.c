/*
 * CUnit test suite for cache manager module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "cache_manager/cache_manager.h"
#include "thread_manager/thread_manager.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"

static void test_cacheManagerFunctions(void)
{
    clearCache();
    displayStocks();
    displayLRU();
    clearCache();
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("CacheManagerSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_cacheManagerFunctions", test_cacheManagerFunctions))
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
