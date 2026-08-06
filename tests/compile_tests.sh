#!/bin/bash

set -e
cd "$(dirname "$0")"

CFLAGS="-Wall -Wextra -g -pthread -I../include -I../src"
LIBS="-lcunit"


CORE="../src/cache_manager/cache_manager.c ../src/thread_manager/thread_manager.c ../src/persistence/storage.c ../src/hash_table/hash_table.c ../src/lru_cache/lru_cache.c ../src/memory/memory_manager.c ../src/logging/logger.c ../src/logging/timestamp.c ../src/analytics/analytics.c ../src/validation/validator.c ../src/authentication/auth.c"


gcc $CFLAGS -o test_hash_table test_hash_table.c $CORE $LIBS
gcc $CFLAGS -o test_validator test_validator.c ../src/validation/validator.c $LIBS
gcc $CFLAGS -o test_lru_cache test_lru_cache.c $CORE $LIBS
gcc $CFLAGS -o test_statistics test_statistics.c ../src/analytics/analytics.c $LIBS
gcc $CFLAGS -o test_authentication test_authentication.c ../src/authentication/auth.c $LIBS
gcc $CFLAGS -o test_cache_manager test_cache_manager.c $CORE $LIBS

gcc $CFLAGS -o test_storage test_storage.c $CORE $LIBS
gcc $CFLAGS -o test_logging test_logging.c $CORE $LIBS
gcc $CFLAGS -o test_memory_manager test_memory_manager.c ../src/memory/memory_manager.c $LIBS
gcc $CFLAGS -o test_timestamp test_timestamp.c ../src/logging/timestamp.c $LIBS
gcc $CFLAGS -DTEST_MAIN -o test_main test_main.c $CORE $LIBS
gcc $CFLAGS -o test_thread_manager test_thread_manager.c $CORE $LIBS
gcc $CFLAGS -o test_integration test_integration.c $CORE $LIBS
echo "Compiled all CUnit test binaries."


