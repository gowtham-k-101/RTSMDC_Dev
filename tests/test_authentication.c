/*
 * CUnit test suite for authentication module
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <CUnit/Basic.h>

#include "authentication/auth.h"

static void test_registerAndLoginUser(void)
{
    (void)unlink("data/users.dat");

    FILE *fp = fopen("tests_auth_input.txt", "w");
    if (fp != NULL)
    {
        /* 1. Register valid user 1 */
        fprintf(fp, "testuser1\npass1234\n");
        /* 2. Register valid user 2 */
        fprintf(fp, "testuser2\npass5678\n");
        /* 3. Register duplicate user */
        fprintf(fp, "testuser1\n");
        /* 4. Login valid user 1 */
        fprintf(fp, "testuser1\npass1234\n");
        /* 5. Login valid user 2 */
        fprintf(fp, "testuser2\npass5678\n");
        /* 6. Login wrong password */
        fprintf(fp, "testuser1\nwrongpass\n");
        /* 7. Login non-existent user */
        fprintf(fp, "nonexistent\npass1234\n");
        fclose(fp);
    }

    FILE *saved_stdin = stdin;
    stdin = fopen("tests_auth_input.txt", "r");

    if (stdin != NULL)
    {
        int regResult1 = registerUser();
        CU_ASSERT_EQUAL(regResult1, 1);

        int regResult2 = registerUser();
        CU_ASSERT_EQUAL(regResult2, 1);

        int dupResult = registerUser();
        CU_ASSERT_EQUAL(dupResult, 0);

        int loginResult1 = loginUser();
        CU_ASSERT_EQUAL(loginResult1, 1);

        int loginResult2 = loginUser();
        CU_ASSERT_EQUAL(loginResult2, 1);

        int wrongPassResult = loginUser();
        CU_ASSERT_EQUAL(wrongPassResult, 0);

        int nonExistResult = loginUser();
        CU_ASSERT_EQUAL(nonExistResult, 0);

        fclose(stdin);
    }
    stdin = saved_stdin;
    (void)unlink("tests_auth_input.txt");

    /* EOF test on empty stdin stream */
    FILE *empty_file = fopen("tests_empty.txt", "w");
    if (empty_file != NULL) { fclose(empty_file); }
    stdin = fopen("tests_empty.txt", "r");
    if (stdin != NULL)
    {
        CU_ASSERT_EQUAL(registerUser(), 0);
        CU_ASSERT_EQUAL(loginUser(), 0);
        fclose(stdin);
    }
    stdin = saved_stdin;
    (void)unlink("tests_empty.txt");

    (void)unlink("data/users.dat");
}

int main(void)
{
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
    {
        return CU_get_error();
    }

    pSuite = CU_add_suite("AuthSuite", NULL, NULL);
    if (pSuite == NULL)
    {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(pSuite, "test_registerAndLoginUser", test_registerAndLoginUser))
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
