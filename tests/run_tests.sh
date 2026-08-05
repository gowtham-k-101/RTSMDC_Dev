#!/bin/bash

# Run all CUnit test binaries in this folder.
# Usage: ./tests/run_tests.sh

set -e
cd "$(dirname "$0")"

TESTS=(
    test_validator
    test_hash_table
    test_lru_cache
    test_statistics
    test_authentication
    test_cache_manager
    test_storage
    test_logging
    test_timestamp
    test_thread_manager
    test_main
)

for test in "${TESTS[@]}"; do
    echo "Running $test..."
    if ./$test; then
        echo "$test PASSED"
    else
        echo "$test FAILED"
        exit 1
    fi
    echo
 done

echo "All tests completed."
