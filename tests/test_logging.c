#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../logging/logger.h"

#define LOG_FILE "logs/application.log"
#define LOG_DIR "logs"

void ensure_log_dir(void)
{
    mkdir(LOG_DIR, 0755);
}

void cleanup_log_file(void)
{
    remove(LOG_FILE);
}

int file_contains(const char *path, const char *needle)
{
    FILE *fp = fopen(path, "r");
    if (fp == NULL) return 0;

    char buffer[512];
    int found = 0;

    while (fgets(buffer, sizeof(buffer), fp) != NULL)
    {
        if (strstr(buffer, needle) != NULL)
        {
            found = 1;
            break;
        }
    }

    fclose(fp);
    return found;
}

void test_logInfo(void)
{
    ensure_log_dir();
    cleanup_log_file();

    logInfo("TEST_INFO");
    CU_ASSERT_TRUE(file_contains(LOG_FILE, "INFO | TEST_INFO"));
}

void test_logError_and_logStockOperation(void)
{
    ensure_log_dir();
    cleanup_log_file();

    logError("TEST_ERROR");
    logStockOperation("STOCK_TEST", "AAPL");

    CU_ASSERT_TRUE(file_contains(LOG_FILE, "ERROR | TEST_ERROR"));
    CU_ASSERT_TRUE(file_contains(LOG_FILE, "STOCK_TEST | AAPL"));
}

int main(void)
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("LoggerSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_add_test(suite, "test_logInfo", test_logInfo);
    CU_add_test(suite, "test_logError_and_logStockOperation", test_logError_and_logStockOperation);

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();
    return (failures > 0) ? 1 : 0;
}
