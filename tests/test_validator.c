#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <string.h>

#include "../validation/validator.h"

void test_validateSymbol_null(void)
{
    CU_ASSERT_EQUAL(validateSymbol(NULL), 0);
}

void test_validateSymbol_empty(void)
{
    CU_ASSERT_EQUAL(validateSymbol(""), 0);
}

void test_validateSymbol_invalid_length(void)
{
    char symbol[SYMBOL_LENGTH + 2];
    memset(symbol, 'A', sizeof(symbol));
    symbol[sizeof(symbol) - 1] = '\0';

    CU_ASSERT_EQUAL(validateSymbol(symbol), 0);
}

void test_validateSymbol_invalid_characters(void)
{
    CU_ASSERT_EQUAL(validateSymbol("AAPL$"), 0);
    CU_ASSERT_EQUAL(validateSymbol("AAPL!"), 0);
}

void test_validateSymbol_valid(void)
{
    CU_ASSERT_EQUAL(validateSymbol("AAPL"), 1);
}

void test_validatePrice(void)
{
    CU_ASSERT_EQUAL(validatePrice(0.0f), 0);
    CU_ASSERT_EQUAL(validatePrice(-1.0f), 0);
    CU_ASSERT_EQUAL(validatePrice(1.0f), 1);
}

void test_validateVolume(void)
{
    CU_ASSERT_EQUAL(validateVolume(-1), 0);
    CU_ASSERT_EQUAL(validateVolume(0), 1);
    CU_ASSERT_EQUAL(validateVolume(100), 1);
}

int main(void)
{
    CU_initialize_registry();

    CU_pSuite suite = CU_add_suite("ValidatorSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_add_test(suite, "test_validateSymbol_null", test_validateSymbol_null);
    CU_add_test(suite, "test_validateSymbol_empty", test_validateSymbol_empty);
    CU_add_test(suite, "test_validateSymbol_invalid_length", test_validateSymbol_invalid_length);
    CU_add_test(suite, "test_validateSymbol_invalid_characters", test_validateSymbol_invalid_characters);
    CU_add_test(suite, "test_validateSymbol_valid", test_validateSymbol_valid);
    CU_add_test(suite, "test_validatePrice", test_validatePrice);
    CU_add_test(suite, "test_validateVolume", test_validateVolume);

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();
    return (failures > 0) ? 1 : 0;
}
