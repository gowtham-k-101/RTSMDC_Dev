/*
 * CUnit test suite for logger module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "logging/logger.h"
#include "thread_manager/thread_manager.h"

static void test_loggingFunctions(void)
{
    CU_ASSERT_EQUAL(initializeThreadManager(), 0);

    CU_ASSERT_EQUAL(logInfo("TEST_MOD", "Test info message"), 0);
    CU_ASSERT_EQUAL(logError("TEST_MOD", "Test error message"), 0);
    CU_ASSERT_EQUAL(logStockOperation("TEST_MOD", "ADD", "AAPL"), 0);

    /* NULL parameters check */
    CU_ASSERT_EQUAL(logInfo(NULL, "Msg"), -1);
    CU_ASSERT_EQUAL(logInfo("MOD", NULL), -1);

    (void)shutdownThreadManager();
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("LoggingSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_loggingFunctions", test_loggingFunctions))
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
