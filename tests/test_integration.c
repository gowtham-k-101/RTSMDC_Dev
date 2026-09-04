/*
 * RTSMDC_Dev
 * CUnit integration test suite (test_integration.c)
 *
 * End-to-end integration testing of caching, logging, binary storage, and multi-thread operations.
 *
 * Thread ownership / synchronization:
 *   - Executes within single-threaded and multi-threaded test environment.
 *
 * Public APIs:
 *   - Test suite execution entry point.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CUnit/Basic.h>

#include "model/stock.h"
#include "validation/validator.h"
#include "hash_table/hash_table.h"
#include "lru_cache/lru_cache.h"
#include "analytics/analytics.h"
#include "logging/logger.h"
#include "persistence/storage.h"
#include "thread_manager/thread_manager.h"
#include "cache_manager/cache_manager.h"
#include "authentication/auth.h"

static void test_endToEndWorkflow(void)
{
    CU_ASSERT_EQUAL(initializeThreadManager(), 0);
    initializeStatistics();
    clearCache();

    /* 1. Add Stock Items up to capacity */
    Stock s1 = {"INTG1", 10000, 9950, 10050, 1000, "NASDAQ"};
    Stock s2 = {"INTG2", 20000, 19950, 20050, 2000, "NYSE"};
    Stock s3 = {"INTG3", 30000, 29950, 30050, 3000, "AMEX"};

    CU_ASSERT_EQUAL(cacheLock(), 0);
    CU_ASSERT_EQUAL(insertNode(s1), 1);
    Node *n1 = searchNode("INTG1");
    CU_ASSERT_PTR_NOT_NULL(n1);
    if (n1 != NULL) addToFront(n1);

    CU_ASSERT_EQUAL(insertNode(s2), 1);
    Node *n2 = searchNode("INTG2");
    if (n2 != NULL) addToFront(n2);

    CU_ASSERT_EQUAL(insertNode(s3), 1);
    Node *n3 = searchNode("INTG3");
    if (n3 != NULL) addToFront(n3);
    CU_ASSERT_EQUAL(cacheUnlock(), 0);

    /* 2. Record Ops & Stats */
    recordHit();
    recordMiss();
    CU_ASSERT_TRUE(getHitRatio() > 0.0f);

    /* 3. Asynchronous Persistence Request */
    CU_ASSERT_EQUAL(requestCacheSaveAndWait(), 0);
    CU_ASSERT_EQUAL(backupCache(), 0);

    clearCache();
    CU_ASSERT_PTR_NULL(searchNode("INTG1"));

    int loaded = loadCache();
    CU_ASSERT_TRUE(loaded >= 3);
    CU_ASSERT_PTR_NOT_NULL(searchNode("INTG1"));

    /* 4. Logging Operations */
    CU_ASSERT_EQUAL(logInfo("INTG_TEST", "Integration test step finished"), 0);
    CU_ASSERT_EQUAL(logStockOperation("INTG_TEST", "LOOKUP", "INTG1"), 0);

    /* 5. High-volume insertion and eviction integration test */
    int i;
    for (i = 0; i < 110; i++)
    {
        char sym[20];
        snprintf(sym, sizeof(sym), "INTG_BULK_%d", i);
        Stock st = {"", (uint32_t)(1500 + i * 10), (uint32_t)(1490 + i * 10), (uint32_t)(1510 + i * 10), 100 + i, "NASDAQ"};
        strncpy(st.symbol, sym, sizeof(st.symbol) - 1);

        CU_ASSERT_EQUAL(cacheLock(), 0);
        if (insertNode(st) == 1)
        {
            Node *node = searchNode(st.symbol);
            if (node != NULL) { addToFront(node); }
        }
        CU_ASSERT_EQUAL(cacheUnlock(), 0);
    }

    /* 6. Clean Shutdown */
    clearCache();
    saveStatistics();
    CU_ASSERT_EQUAL(shutdownThreadManager(), 0);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("IntegrationSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_endToEndWorkflow", test_endToEndWorkflow))
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
