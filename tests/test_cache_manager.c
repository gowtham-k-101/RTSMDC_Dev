/*
 * CUnit test suite for cache manager module
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <CUnit/Basic.h>

#include "cache_manager/cache_manager.h"
#include "thread_manager/thread_manager.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"

static void test_cacheManagerInteractive(void)
{
    clearCache();

    FILE *fp = fopen("tests_cache_input.txt", "w");
    if (fp != NULL)
    {
        /* 1. Add valid stock AAPL */
        fprintf(fp, "AAPL\n150.00\n1000\nNASDAQ\n");
        /* 2. Add valid stock MSFT */
        fprintf(fp, "MSFT\n250.00\n2000\nNASDAQ\n");
        /* 3. Add duplicate stock AAPL */
        fprintf(fp, "AAPL\n150.00\n1000\nNASDAQ\n");
        /* 4. Add stock invalid symbol */
        fprintf(fp, "123BAD\n150.00\n1000\nNASDAQ\n");
        /* 5. Add stock invalid price */
        fprintf(fp, "GOOG\n-10.0\n1000\nNASDAQ\n");
        /* 6. Add stock invalid volume */
        fprintf(fp, "GOOG\n100.0\n-50\nNASDAQ\n");

        /* 7. Search existing AAPL */
        fprintf(fp, "AAPL\n");
        /* 8. Search missing XYZ */
        fprintf(fp, "XYZ\n");

        /* 9. Update existing AAPL */
        fprintf(fp, "AAPL\n175.50\n");
        /* 10. Update existing AAPL invalid price */
        fprintf(fp, "AAPL\n-20.00\n");
        /* 11. Update missing XYZ */
        fprintf(fp, "XYZ\n100.00\n");

        /* 12. Delete existing AAPL */
        fprintf(fp, "AAPL\n");
        /* 13. Delete missing XYZ */
        fprintf(fp, "XYZ\n");

        fclose(fp);
    }

    FILE *saved_stdin = stdin;
    stdin = fopen("tests_cache_input.txt", "r");

    if (stdin != NULL)
    {
        addStock();
        addStock();
        addStock(); /* Duplicate */
        addStock(); /* Bad symbol */
        addStock(); /* Bad price */
        addStock(); /* Bad volume */

        searchStock(); /* AAPL */
        searchStock(); /* XYZ */

        updateStock(); /* AAPL to 175.50 */
        updateStock(); /* AAPL bad price */
        updateStock(); /* XYZ */

        deleteStock(); /* AAPL */
        deleteStock(); /* XYZ */

        fclose(stdin);
    }

    stdin = saved_stdin;
    (void)unlink("tests_cache_input.txt");

    displayStocks();
    displayLRU();
    clearCache();
}

static void test_cacheManagerEviction(void)
{
    clearCache();
    FILE *fp = fopen("tests_evict_input.txt", "w");
    if (fp != NULL)
    {
        int i;
        for (i = 0; i < 102; i++)
        {
            fprintf(fp, "EVICT%d\n100.00\n500\nNYSE\n", i);
        }
        fclose(fp);
    }

    FILE *saved_stdin = stdin;
    stdin = fopen("tests_evict_input.txt", "r");
    if (stdin != NULL)
    {
        int i;
        for (i = 0; i < 102; i++)
        {
            addStock();
        }
        fclose(stdin);
    }
    stdin = saved_stdin;
    (void)unlink("tests_evict_input.txt");
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

    if ((NULL == CU_add_test(pSuite, "test_cacheManagerInteractive", test_cacheManagerInteractive)) ||
        (NULL == CU_add_test(pSuite, "test_cacheManagerEviction", test_cacheManagerEviction)))
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
