# RTSMDC_Dev — Real-Time Stock Market Data Cache System

A high-performance, thread-safe, memory-safe C99/POSIX real-time stock market data caching system.

---

## Key Architecture & Features

- **Hash-Table Lookup & Storage**: O(1) average stock lookup by ticker symbol using custom hash table chained collision resolution.
- **LRU Eviction Policy**: Configurable constant capacity (`CACHE_CAPACITY = 10`). Least-recently-used node (`lruTail`) is automatically evicted and freed when capacity is reached upon stock insertion.
- **Thread Safety & Fine-Grained Synchronization**:
  - Independent POSIX mutexes for cache data (`cacheMutex`), persistence signaling (`persistenceMutex`), statistics tracking (`statsMutex`), user auth (`userMutex`), and log queue (`logMutex`).
  - Strict lock granularity: interactive user input (`scanf`) and heavy file I/O operations are performed outside critical sections.
  - 100% thread lifecycle compliance: single creation, single join, zero detached thread leaks.
- **Asynchronous Persistence & Logging Subsystem**:
  - Asynchronous background log thread flushing formatted log messages (including high-resolution timestamp and thread ID) to `logs/application.log`.
  - Asynchronous background persistence thread executing disk cache saves without blocking main worker threads.
- **Strict Static Analysis & Standards Alignment**:
  - Compiles cleanly with GCC 13+ strict flags: `-Wall -Wextra -Wpedantic -Wconversion -Wshadow -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Werror -D_POSIX_C_SOURCE=200809L -pthread`.
  - Refactored toward practical **MISRA-C:2012** compliance.
- **Comprehensive Verification & Concurrency Stress Testing**:
  - Parameterized multi-threaded stress simulation binary (`stress_test`) running 32 concurrent threads executing 96,000+ operations under ASan, UBSan, and Helgrind.
  - Complete 12-suite CUnit unit and integration test framework (`make test`).

---

## Directory Structure

```text
.
├── include/                   # Header files for core modules
│   ├── analytics/             # Cache statistics tracking API
│   ├── authentication/        # User registration and authentication API
│   ├── cache_manager/         # High-level stock CRUD operations API
│   ├── hash_table/            # Symbol hashing and bucket chain API
│   ├── logging/               # Asynchronous logging & timestamp API
│   ├── lru_cache/             # Doubly linked list LRU cache ordering API
│   ├── memory/                # Safe node memory allocator API
│   ├── model/                 # Data domain models (stock.h, user.h, statistics.h)
│   ├── persistence/           # Cache disk save/load/backup API
│   ├── thread_manager/        # POSIX thread lifecycle and queue signaling API
│   └── validation/            # Symbol, price, volume input validation API
├── src/                       # Source code implementations
│   ├── main.c                 # Interactive CLI menu entry point
│   ├── simulation/            # Multi-threaded stress test runner (stress_test.c)
│   └── ...                    # Implementation files
├── tests/                     # CUnit test suites and test runners
├── data/                      # Persistent storage files (cache_data.dat, users.dat, etc.)
└── logs/                      # Log file output directory (application.log)
```

---

## Build Instructions

### Standard Production Build

Build the primary executable `app` and stress test binary `stress_test`:

```sh
make clean && make
```

### Debug Build with AddressSanitizer & UndefinedBehaviorSanitizer

Build binaries instrumented with ASan and UBSan:

```sh
make clean && make DEBUG=1
```

---

## Testing & Concurrency Verification

### 1. CUnit Unit & Integration Test Suites

Run the complete 12-suite CUnit test runner:

```sh
make test
```

### 2. Multi-Threaded Stress Test Simulation

Execute the parameterized multi-threaded stress simulation with 32 threads performing 96,000 operations (10 reader threads, 10 updater threads, 5 persistence requesters, 7 logger/stats workers):

```sh
./stress_test 32 3000
```

### 3. Helgrind Thread Race & Lock Verification

Run the stress test under Valgrind's Helgrind tool to verify race-free execution and consistent lock ordering:

```sh
valgrind --tool=helgrind ./stress_test 16 1000
```

### 4. Valgrind Memory Leak Verification

Run the main application or stress simulation under Valgrind to verify zero memory leaks:

```sh
valgrind --leak-check=full --show-leak-kinds=all ./stress_test 16 500
```

---

## User Interface & Menu Operations

The application provides a clean command-line interface:
1. **User Registration & Login** (Option 1 & 2)
2. **Add Stock** (Option 1 - validates symbol, price, volume, inserts node, enforces LRU capacity)
3. **Search Stock** (Option 2 - searches hash table, moves hit to LRU head, records hit/miss)
4. **Update Stock** (Option 3 - updates stock price outside lock)
5. **Delete Stock** (Option 4 - unlinks from LRU and frees node)
6. **Display Stocks** (Option 5 - prints hash table inventory under lock)
7. **View Statistics** (Option 6 - displays hits, misses, insertions, updates, deletions, evictions, and hit ratio)
8. **Save / Load / Backup Cache** (Options 7, 8, 9 - serializes cache to disk)
9. **View LRU Order** (Option 10 - displays LRU ordering from head to tail)
10. **Exit** (Option 11 - executes `clearCache()`, saves stats, flushes logs, and terminates threads cleanly)
