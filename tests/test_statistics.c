#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>

#include "../analytics/analytics.h"

void reset_stats(void)
{
    initializeStatistics();
}

void test_initializeStatistics(void)
{
    reset_stats();

    CU_ASSERT_EQUAL(stats.cacheHits, 0UL);
    CU_ASSERT_EQUAL(stats.cacheMisses, 0UL);
    CU_ASSERT_EQUAL(stats.inserts, 0UL);
    CU_ASSERT_EQUAL(stats.updates, 0UL);
    CU_ASSERT_EQUAL(stats.deletions, 0UL);
    CU_ASSERT_EQUAL(stats.evictions, 0UL);
}

void test_record_functions_and_getHitRatio(void)
{
    reset_stats();

    recordHit();
    recordHit();
    recordMiss();
    recordInsert();
    recordUpdate();
    recordDelete();
    recordEviction();

    CU_ASSERT_EQUAL(stats.cacheHits, 2UL);
    CU_ASSERT_EQUAL(stats.cacheMisses, 1UL);
    CU_ASSERT_EQUAL(stats.inserts, 1UL);
    CU_ASSERT_EQUAL(stats.updates, 1UL);
    CU_ASSERT_EQUAL(stats.deletions, 1UL);
    CU_ASSERT_EQUAL(stats.evictions, 1UL);
    CU_ASSERT_DOUBLE_EQUAL(getHitRatio(), 66.666666, 0.01);
}

int main(void)
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("StatisticsSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_add_test(suite, "test_initializeStatistics", test_initializeStatistics);
    CU_add_test(suite, "test_record_functions_and_getHitRatio", test_record_functions_and_getHitRatio);

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();
    return (failures > 0) ? 1 : 0;
}
