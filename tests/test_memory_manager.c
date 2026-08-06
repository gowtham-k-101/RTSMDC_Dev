/*
 * CUnit test suite for memory manager module
 */

#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

#include "memory/memory_manager.h"

static void test_allocateAndFreeNode(void)
{
    Node *node = allocateNode();
    CU_ASSERT_PTR_NOT_NULL(node);
    if (node != NULL)
    {
        CU_ASSERT_PTR_NULL(node->hashNext);
        CU_ASSERT_PTR_NULL(node->prevLRU);
        CU_ASSERT_PTR_NULL(node->nextLRU);
        freeNode(node);
    }

    freeNode(NULL);
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("MemoryManagerSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_allocateAndFreeNode", test_allocateAndFreeNode))
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
