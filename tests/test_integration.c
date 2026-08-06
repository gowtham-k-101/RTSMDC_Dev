/*
 * Integration test suite for RTSMDC_Dev
 * Tests multi-module workflows end-to-end
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
    Stock s1 = {"INTG1", 100.0f, 1000};
    Stock s2 = {"INTG2", 200.0f, 2000};
    Stock s3 = {"INTG3", 300.0f, 3000};

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

    /* 3. Persistence Save & Load */
    CU_ASSERT_EQUAL(saveCache(), 0);
    CU_ASSERT_EQUAL(backupCache(), 0);

    clearCache();
    CU_ASSERT_PTR_NULL(searchNode("INTG1"));

    int loaded = loadCache();
    CU_ASSERT_TRUE(loaded >= 3);
    CU_ASSERT_PTR_NOT_NULL(searchNode("INTG1"));

    /* 4. Logging Operations */
    CU_ASSERT_EQUAL(logInfo("INTG_TEST", "Integration test step finished"), 0);
    CU_ASSERT_EQUAL(logStockOperation("INTG_TEST", "LOOKUP", "INTG1"), 0);

    /* 5. Clean Shutdown */
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
