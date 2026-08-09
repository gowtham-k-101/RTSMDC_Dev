# RTSMDC_Dev — Real-Time Stock Market Data Cache System

A high-performance, thread-safe, memory-safe C99/POSIX real-time stock market data caching system.

---

## 1. Project Overview & Key Architecture

- **O(1) Hash-Table Lookup & Storage**: Instant stock lookup by ticker symbol using custom hash table with chained collision resolution.
- **LRU Eviction Policy**: Configurable constant capacity (`CACHE_CAPACITY = 100`). The least-recently-used node (`lruTail`) is automatically evicted and freed upon stock insertion when capacity is exceeded.
- **Thread Safety & Fine-Grained Synchronization**:
  - Independent POSIX mutexes for cache state (`cacheMutex`), persistence signaling (`persistenceMutex`), statistics tracking (`statsMutex`), user authentication (`userMutex`), and log queue (`logMutex`).
  - Lock-free interactive I/O: User input (`scanf`) and heavy file I/O operations are strictly performed outside critical sections.
  - 100% thread lifecycle compliance: Single creation, single join, zero detached thread leaks.
- **Asynchronous Persistence & Logging Subsystem**:
  - Background logging thread flushes formatted log messages (including high-resolution timestamp and thread ID) to `logs/application.log`.
  - Background persistence thread executes disk cache saves asynchronously without blocking worker threads.
- **Strict Verification & Concurrency Stress Testing**:
  - Multi-threaded stress simulation binary (`stress_test`) running 32 concurrent threads executing 96,000+ operations under ASan, UBSan, and Helgrind.
  - 12-suite CUnit unit and integration test framework (`make test`).
  - **100.0% Function Coverage** and **85.0% Line Coverage** (`make coverage`).
  - Multi-level assembly and code optimization benchmark analysis (`make codeoptdata`).

---

## 2. Complete Project Directory & File Tree Structure

```text
RTSMDC_Dev/
├── Makefile                                # Master build automation file
├── README.md                               # Project documentation & reference manual
├── include/                                # Header files for core modules
│   ├── analytics/
│   │   └── analytics.h                     # Cache performance statistics API
│   ├── authentication/
│   │   └── auth.h                          # User registration & login authentication API
│   ├── cache_manager/
│   │   └── cache_manager.h                 # High-level stock CRUD operations API
│   ├── hash_table/
│   │   └── hash_table.h                    # Symbol hashing & bucket chain API
│   ├── logging/
│   │   ├── logger.h                        # Asynchronous logging API
│   │   └── timestamp.h                     # High-resolution timestamp generator API
│   ├── lru_cache/
│   │   └── lru_cache.h                     # Doubly linked list LRU cache ordering API
│   ├── memory/
│   │   └── memory_manager.h                # Node memory allocation & release API
│   ├── model/
│   │   ├── statistics.h                    # Statistics domain model struct
│   │   ├── stock.h                         # Stock domain model struct
│   │   └── user.h                          # User domain model struct
│   ├── persistence/
│   │   └── storage.h                       # Disk cache save/load/backup API
│   ├── thread_manager/
│   │   └── thread_manager.h                # POSIX thread lifecycle & signaling API
│   └── validation/
│       └── validator.h                     # Input validation API (symbol, price, volume)
├── src/                                    # Source code implementations
│   ├── analytics/
│   │   └── analytics.c                     # Cache statistics tracking implementation
│   ├── authentication/
│   │   └── auth.c                          # User registration & login implementation
│   ├── cache_manager/
│   │   └── cache_manager.c                 # High-level stock CRUD operations implementation
│   ├── hash_table/
│   │   └── hash_table.c                    # Hash table lookup & collision handling implementation
│   ├── logging/
│   │   ├── logger.c                        # Asynchronous log message queueing implementation
│   │   └── timestamp.c                     # High-resolution POSIX timestamp implementation
│   ├── lru_cache/
│   │   └── lru_cache.c                     # Doubly linked list LRU node management
│   ├── main.c                              # Main interactive CLI application entry point
│   ├── memory/
│   │   └── memory_manager.c                # Dynamic node allocation/deallocation implementation
│   ├── persistence/
│   │   └── storage.c                       # Disk file serialization (save/load/backup) implementation
│   ├── simulation/
│   │   └── stress_test.c                   # Parameterized multi-threaded stress test runner
│   ├── thread_manager/
│   │   └── thread_manager.c                # POSIX thread manager & queue signaling implementation
│   └── validation/
│       └── validator.c                     # Data input validation functions implementation
├── tests/                                  # CUnit unit and integration test framework
│   ├── compile_tests.sh                    # Test compilation script (supports COVERAGE=1)
│   ├── run_tests.sh                        # Test suite execution runner script
│   ├── test_authentication.c               # CUnit test suite for user authentication
│   ├── test_cache_manager.c                # CUnit test suite for cache manager operations
│   ├── test_hash_table.c                   # CUnit test suite for hash table lookups
│   ├── test_integration.c                  # CUnit end-to-end integration test suite
│   ├── test_logging.c                      # CUnit test suite for logger module
│   ├── test_lru_cache.c                    # CUnit test suite for LRU cache ordering
│   ├── test_main.c                         # CUnit test suite for main initialization
│   ├── test_memory_manager.c               # CUnit test suite for memory manager
│   ├── test_statistics.c                   # CUnit test suite for performance analytics
│   ├── test_storage.c                      # CUnit test suite for disk persistence
│   ├── test_thread_manager.c               # CUnit test suite for thread manager lifecycle
│   └── test_validator.c                    # CUnit test suite for input validator
├── data/                                   # Persistent binary/text storage files
│   ├── backup.dat                          # Cache backup data file
│   ├── cache_data.dat                      # Persistent cache data storage file
│   ├── statistics.dat                      # Recorded cache statistics file
│   └── users.dat                           # Encrypted user credentials data file
└── logs/                                   # Log file output directory
    └── application.log                     # High-resolution application log file
```

---

## 3. Comprehensive Command Reference

### Build Commands

| Command | Description |
| :--- | :--- |
| **`make`** or **`make all`** | Compiles the main application (`app`) and stress test binary (`stress_test`). |
| **`make app`** | Compiles only the primary CLI application binary (`app`). |
| **`make stress`** | Compiles only the multi-threaded stress simulation binary (`stress_test`). |
| **`make DEBUG=1`** | Compiles binaries instrumented with AddressSanitizer (`-fsanitize=address`) and UndefinedBehaviorSanitizer (`-fsanitize=undefined`). |
| **`make clean`** | Thoroughly removes all compiled object files (`.o`), executables, assembly files (`.s`), coverage reports, and temp test files without touching source code files. |

---

### Testing & Verification Commands

| Command | Description |
| :--- | :--- |
| **`make test`** | Compiles and executes the complete 12-suite CUnit unit and integration test framework. |
| **`make coverage`** | Instruments binaries with GCC `--coverage`, runs all test suites, captures `lcov` data, generates an interactive visual HTML report (`coverage_html/index.html`), and displays line/function coverage statistics. |
| **`make valgrind`** | Runs the stress test binary under Valgrind to verify zero memory leaks. |
| **`make helgrind`** | Runs the stress test binary under Valgrind's Helgrind tool to verify 100% thread race-free execution. |
| **`make cppcheck`** | Runs static analysis warning, style, performance, and portability checks. |
| **`make misra`** | Runs static analysis rule checking aligned with MISRA-C:2012 guidelines. |

---

### Code Optimization Analysis Commands

| Command | Description |
| :--- | :--- |
| **`make codeoptfile`** | Compiles combined assembly files (`app_O*.s`) and executables (`app_O*`, `stress_O*`) for all optimization levels (`-O0`, `-O1`, `-O2`, `-O3`, `-Os`). |
| **`make codeoptdata`** | Executes multi-threaded benchmarks across all pre-compiled optimization levels and displays a formatted 7-parameter analysis table directly in the terminal. |

---

## 4. Execution Examples

### 1. Running the Interactive CLI Application
```bash
make clean && make app
./app
```

### 2. Running the Multi-Threaded Stress Test
Run 32 concurrent threads executing 96,000 operations (10 reader threads, 10 updater threads, 5 persistence requesters, 7 logger/stats workers):
```bash
make clean && make stress
./stress_test 32 3000
```

### 3. Generating Code Coverage Report
```bash
make coverage
```
View the generated visual HTML report in your browser:
[coverage_html/index.html](file:///home/gowtham/Documents/cpoc/RTSMDC_Dev/coverage_html/index.html)

### 4. Running Code Optimization Analysis
```bash
make codeoptdata
```

---

## 5. Code Coverage Benchmark Results

```text
========================================================================
 RTSMDC_Dev Code Coverage Report
========================================================================
 Summary Coverage Rate:
   Lines......: 85.0% (601 of 707 lines)
   Functions..: 100.0% (55 of 55 functions)
========================================================================
```

| Source Module | Line Coverage | Function Coverage | Status |
| :--- | :---: | :---: | :---: |
| **`validation/validator.c`** | **100.0%** (15/15) | **100.0%** (3/3) | Passed |
| **`logging/timestamp.c`** | **100.0%** (10/10) | **100.0%** (1/1) | Passed |
| **`lru_cache/lru_cache.c`** | **98.1%** (51/52) | **100.0%** (6/6) | Passed |
| **`analytics/analytics.c`** | **97.8%** (90/92) | **100.0%** (11/11) | Passed |
| **`hash_table/hash_table.c`** | **95.7%** (44/46) | **100.0%** (5/5) | Passed |
| **`cache_manager/cache_manager.c`** | **93.4%** (128/137) | **100.0%** (7/7) | Passed |
| **`logging/logger.c`** | **88.9%** (16/18) | **100.0%** (4/4) | Passed |
| **`memory/memory_manager.c`** | **84.6%** (11/13) | **100.0%** (2/2) | Passed |
| **`authentication/auth.c`** | **83.1%** (54/65) | **100.0%** (3/3) | Passed |
| **`thread_manager/thread_manager.c`** | **72.2%** (117/162) | **100.0%** (10/10) | Passed |
| **`persistence/storage.c`** | **67.7%** (65/96) | **100.0%** (3/3) | Passed |
| **TOTAL PROJECT (`src/`)** | **85.0% (601/707)** | **100.0% (55/55)** | **100% Function Coverage** |
