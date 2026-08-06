/*
 * CUnit test suite for main entry point verification
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "thread_manager/thread_manager.h"
#include "cache_manager/cache_manager.h"

static void test_mainInitialization(void)
{
    CU_ASSERT_EQUAL(initializeThreadManager(), 0);
    clearCache();
    CU_ASSERT_EQUAL(shutdownThreadManager(), 0);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("MainSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_mainInitialization", test_mainInitialization))
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
