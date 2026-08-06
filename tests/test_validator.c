/*
 * CUnit test suite for validator module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "validation/validator.h"

static void test_validateSymbol(void)
{
    CU_ASSERT_TRUE(validateSymbol("AAPL"));
    CU_ASSERT_TRUE(validateSymbol("GOOG123"));
    CU_ASSERT_FALSE(validateSymbol(NULL));
    CU_ASSERT_FALSE(validateSymbol(""));
    CU_ASSERT_FALSE(validateSymbol("INVALID SYMBOL"));
    CU_ASSERT_FALSE(validateSymbol("THIS_SYMBOL_IS_WAY_TOO_LONG_FOR_THE_LIMIT"));
}

static void test_validatePrice(void)
{
    CU_ASSERT_TRUE(validatePrice(10.5f));
    CU_ASSERT_TRUE(validatePrice(0.01f));
    CU_ASSERT_FALSE(validatePrice(0.0f));
    CU_ASSERT_FALSE(validatePrice(-5.0f));
}

static void test_validateVolume(void)
{
    CU_ASSERT_TRUE(validateVolume(100));
    CU_ASSERT_TRUE(validateVolume(0));
    CU_ASSERT_FALSE(validateVolume(-1));
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("ValidatorSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if ((NULL == CU_add_test(pSuite, "test_validateSymbol", test_validateSymbol)) ||
        (NULL == CU_add_test(pSuite, "test_validatePrice", test_validatePrice)) ||
        (NULL == CU_add_test(pSuite, "test_validateVolume", test_validateVolume)))
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
