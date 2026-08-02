#!/bin/bash

set -e
cd "$(dirname "$0")"

CFLAGS="-Wall -Wextra -g -I.. $(pkg-config --cflags cunit)"
LIBS="$(pkg-config --libs cunit)"

gcc $CFLAGS -o test_hash_table test_hash_table.c ../hash_table/hash_table.c ../memory/memory_manager.c $LIBS
gcc $CFLAGS -o test_validator test_validator.c ../validation/validator.c $LIBS
gcc $CFLAGS -o test_lru_cache test_lru_cache.c ../lru_cache/lru_cache.c ../memory/memory_manager.c $LIBS
gcc $CFLAGS -o test_statistics test_statistics.c ../analytics/analytics.c $LIBS
gcc $CFLAGS -o test_storage test_storage.c ../persistence/storage.c ../hash_table/hash_table.c ../memory/memory_manager.c ../lru_cache/lru_cache.c ../logging/logger.c ../logging/timestamp.c $LIBS
gcc $CFLAGS -o test_logging test_logging.c ../logging/logger.c ../logging/timestamp.c $LIBS
gcc $CFLAGS -o test_memory_manager test_memory_manager.c ../memory/memory_manager.c $LIBS

echo "Compiled all CUnit test binaries."
