#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>

#include "../memory/memory_manager.h"

void test_allocateNode_returns_non_null(void)
{
    Node *node = allocateNode();

    CU_ASSERT_PTR_NOT_NULL(node);
    CU_ASSERT_PTR_NULL(node->hashNext);
    CU_ASSERT_PTR_NULL(node->prevLRU);
    CU_ASSERT_PTR_NULL(node->nextLRU);

    freeNode(node);
}

void test_freeNode_handles_null(void)
{
    freeNode(NULL);
    CU_ASSERT_TRUE(1);
}

int main(void)
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("MemoryManagerSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_add_test(suite, "test_allocateNode_returns_non_null", test_allocateNode_returns_non_null);
    CU_add_test(suite, "test_freeNode_handles_null", test_freeNode_handles_null);

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();
    return (failures > 0) ? 1 : 0;
}
