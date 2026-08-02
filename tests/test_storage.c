#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#include "../persistence/storage.h"
#include "../hash_table/hash_table.h"
#include "../memory/memory_manager.h"
#include "../model/stock.h"

#define CACHE_FILE "data/cache_data.dat"
#define BACKUP_FILE "data/backup.dat"
#define LOG_DIR "logs"
#define DATA_DIR "data"

void ensure_directories(void)
{
    mkdir(DATA_DIR, 0755);
    mkdir(LOG_DIR, 0755);
}

void cleanup_files(void)
{
    remove(CACHE_FILE);
    remove(BACKUP_FILE);
}

void reset_hash_table(void)
{
    int i;

    for (i = 0; i < TABLE_SIZE; i++)
    {
        hashTable[i] = NULL;
    }
}

void test_save_and_backup_cache(void)
{
    Stock stock;

    ensure_directories();
    cleanup_files();
    reset_hash_table();

    strcpy(stock.symbol, "AAPL");
    stock.price = 150.0f;
    stock.volume = 1000;
    insertNode(stock);

    saveCache();
    FILE *cache_fp = fopen(CACHE_FILE, "r");
    CU_ASSERT_PTR_NOT_NULL(cache_fp);
    if (cache_fp) fclose(cache_fp);

    backupCache();
    FILE *backup_fp = fopen(BACKUP_FILE, "r");
    CU_ASSERT_PTR_NOT_NULL(backup_fp);
    if (backup_fp) fclose(backup_fp);

    cleanup_files();
}

int main(void)
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("StorageSuite", NULL, NULL);
    if (suite == NULL) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_add_test(suite, "test_save_and_backup_cache", test_save_and_backup_cache);
    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();
    return (failures > 0) ? 1 : 0;
}
