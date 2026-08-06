/*
 * CUnit test suite for analytics / statistics module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "analytics/analytics.h"

static void test_statisticsTracking(void)
{
    initializeStatistics();

    CU_ASSERT_EQUAL(stats.cacheHits, 0);
    CU_ASSERT_EQUAL(stats.cacheMisses, 0);
    CU_ASSERT_DOUBLE_EQUAL(getHitRatio(), 0.0f, 0.01f);

    recordHit();
    recordHit();
    recordMiss();

    CU_ASSERT_EQUAL(stats.cacheHits, 2);
    CU_ASSERT_EQUAL(stats.cacheMisses, 1);
    CU_ASSERT_DOUBLE_EQUAL(getHitRatio(), 66.66f, 0.1f);

    recordInsert();
    recordUpdate();
    recordDelete();
    recordEviction();

    CU_ASSERT_EQUAL(stats.inserts, 1);
    CU_ASSERT_EQUAL(stats.updates, 1);
    CU_ASSERT_EQUAL(stats.deletions, 1);
    CU_ASSERT_EQUAL(stats.evictions, 1);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("StatisticsSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_statisticsTracking", test_statisticsTracking))
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
