/*
 * RTSMDC_Dev
 * CUnit test suite for validator module (test_validator.c)
 *
 * Unit tests for validateSymbol(), validatePrice(), validateVolume(), and validateExchange().
 *
 * Thread ownership / synchronization:
 *   - Executes within single-threaded test harness.
 *
 * Public APIs:
 *   - Test suite execution entry point.
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "validation/validator.h"

static void test_validateSymbol(void)
{
    /* Valid symbols */
    CU_ASSERT_TRUE(validateSymbol("A"));
    CU_ASSERT_TRUE(validateSymbol("AAPL"));
    CU_ASSERT_TRUE(validateSymbol("GOOG123"));
    CU_ASSERT_TRUE(validateSymbol("ABCDEFGHIJKLMNO1234")); /* 19 chars */

    /* Invalid symbols */
    CU_ASSERT_FALSE(validateSymbol(NULL));
    CU_ASSERT_FALSE(validateSymbol(""));
    CU_ASSERT_FALSE(validateSymbol("INVALID SYMBOL"));
    CU_ASSERT_FALSE(validateSymbol("THIS_SYMBOL_IS_WAY_TOO_LONG_FOR_THE_LIMIT"));
    CU_ASSERT_FALSE(validateSymbol("AAPL@#$"));
    CU_ASSERT_FALSE(validateSymbol("A B C"));
    CU_ASSERT_FALSE(validateSymbol("AAPL\n"));
    CU_ASSERT_FALSE(validateSymbol("AAPL\t"));
}

static void test_validatePrice(void)
{
    /* Valid prices in cents */
    CU_ASSERT_TRUE(validatePrice(1));
    CU_ASSERT_TRUE(validatePrice(1050));
    CU_ASSERT_TRUE(validatePrice(99999999));

    /* Invalid prices */
    CU_ASSERT_FALSE(validatePrice(0));
}

static void test_validateVolume(void)
{
    /* Valid volumes */
    CU_ASSERT_TRUE(validateVolume(0));
    CU_ASSERT_TRUE(validateVolume(1));
    CU_ASSERT_TRUE(validateVolume(100));
    CU_ASSERT_TRUE(validateVolume(2147483647));

    /* Invalid volumes */
    CU_ASSERT_FALSE(validateVolume(-1));
    CU_ASSERT_FALSE(validateVolume(-100));
    CU_ASSERT_FALSE(validateVolume(-2147483647));
}

static void test_validateExchange(void)
{
    CU_ASSERT_TRUE(validateExchange("NASDAQ"));
    CU_ASSERT_TRUE(validateExchange("NYSE"));
    CU_ASSERT_TRUE(validateExchange("AMEX"));
    CU_ASSERT_TRUE(validateExchange("CBOE"));

    CU_ASSERT_FALSE(validateExchange(NULL));
    CU_ASSERT_FALSE(validateExchange(""));
    CU_ASSERT_FALSE(validateExchange("INVALID_EXCH"));
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
        (NULL == CU_add_test(pSuite, "test_validateVolume", test_validateVolume)) ||
        (NULL == CU_add_test(pSuite, "test_validateExchange", test_validateExchange)))
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
