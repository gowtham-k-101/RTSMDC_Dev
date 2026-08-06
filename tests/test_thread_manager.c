/*
 * CUnit test suite for thread manager module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "thread_manager/thread_manager.h"

static void test_threadManagerLifecycle(void)
{
    CU_ASSERT_EQUAL(initializeThreadManager(), 0);

    CU_ASSERT_EQUAL(cacheLock(), 0);
    CU_ASSERT_EQUAL(cacheUnlock(), 0);

    CU_ASSERT_EQUAL(enqueueLogEntry("Test entry"), 0);

    CU_ASSERT_EQUAL(signalCacheSave(), 0);

    CU_ASSERT_EQUAL(shutdownThreadManager(), 0);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("ThreadManagerSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_threadManagerLifecycle", test_threadManagerLifecycle))
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
