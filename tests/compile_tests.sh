#!/bin/bash

set -e
cd "$(dirname "$0")"

if [ "$COVERAGE" = "1" ]; then
    CFLAGS="-Wall -Wextra -g --coverage -pthread -I../include -I../src"
    LIBS="-lcunit --coverage"
else
    CFLAGS="-Wall -Wextra -g -pthread -I../include -I../src"
    LIBS="-lcunit"
fi


# Compile shared core object files
gcc $CFLAGS -c ../src/cache_manager/cache_manager.c -o cache_manager.o
gcc $CFLAGS -c ../src/thread_manager/thread_manager.c -o thread_manager.o
gcc $CFLAGS -c ../src/persistence/storage.c -o storage.o
gcc $CFLAGS -c ../src/hash_table/hash_table.c -o hash_table.o
gcc $CFLAGS -c ../src/lru_cache/lru_cache.c -o lru_cache.o
gcc $CFLAGS -c ../src/memory/memory_manager.c -o memory_manager.o
gcc $CFLAGS -c ../src/logging/logger.c -o logger.o
gcc $CFLAGS -c ../src/logging/timestamp.c -o timestamp.o
gcc $CFLAGS -c ../src/analytics/analytics.c -o analytics.o
gcc $CFLAGS -c ../src/validation/validator.c -o validator.o
gcc $CFLAGS -c ../src/authentication/auth.c -o auth.o

CORE_OBJS="cache_manager.o thread_manager.o storage.o hash_table.o lru_cache.o memory_manager.o logger.o timestamp.o analytics.o validator.o auth.o"

gcc $CFLAGS -o test_hash_table test_hash_table.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_validator test_validator.c validator.o $LIBS
gcc $CFLAGS -o test_lru_cache test_lru_cache.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_statistics test_statistics.c analytics.o $LIBS
gcc $CFLAGS -o test_authentication test_authentication.c auth.o $LIBS
gcc $CFLAGS -o test_cache_manager test_cache_manager.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_storage test_storage.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_logging test_logging.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_memory_manager test_memory_manager.c memory_manager.o $LIBS
gcc $CFLAGS -o test_timestamp test_timestamp.c timestamp.o $LIBS
gcc $CFLAGS -DTEST_MAIN -o test_main test_main.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_thread_manager test_thread_manager.c $CORE_OBJS $LIBS
gcc $CFLAGS -o test_integration test_integration.c $CORE_OBJS $LIBS
echo "Compiled all CUnit test binaries."


