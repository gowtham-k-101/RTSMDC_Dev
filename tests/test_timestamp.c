/*
 * CUnit test suite for timestamp module
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CUnit/Basic.h>

#include "logging/timestamp.h"

static void test_getCurrentTimestamp(void)
{
    char buf[30];
    int res = getCurrentTimestamp(buf, sizeof(buf));

    CU_ASSERT_EQUAL(res, 0);
    CU_ASSERT_TRUE(strlen(buf) > 10);

    /* Test NULL buffer */
    CU_ASSERT_EQUAL(getCurrentTimestamp(NULL, 30), -1);

    /* Test zero buffer size */
    CU_ASSERT_EQUAL(getCurrentTimestamp(buf, 0), -1);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("TimestampSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_getCurrentTimestamp", test_getCurrentTimestamp))
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
