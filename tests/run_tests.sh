#!/bin/bash

# Run all CUnit test binaries in this folder.
# Usage: ./run_tests.sh

set -e

TESTS=(
    test_validator
    test_hash_table
    test_lru_cache
    test_statistics
    test_storage
    test_logging
    test_memory_manager
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
