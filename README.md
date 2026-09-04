# RTSMDC_Dev — Real-Time Stock Market Data Cache System

A high-performance, thread-safe, memory-safe C99/POSIX real-time stock market data caching system.

---

## 1. Project Overview & Key Architecture

- **Fixed-Point Currency & Market Depth (`uint32_t price_cents`)**:
  - Uses fixed-point integer arithmetic ($150.25 is stored as exact integer `15025` cents) to eliminate IEEE-754 binary floating-point rounding artifacts and penny drift over high-throughput stock ticks.
  - Includes market depth metadata with exchange venue identifiers (`"NASDAQ"`, `"NYSE"`, `"AMEX"`, `"CBOE"`) and bid/ask spreads.
- **O(1) Hash-Table Lookup & Storage**: Instant stock lookup by ticker symbol using a custom hash table with separate chaining for collision resolution.
- **Thread-Safe Doubly-Linked LRU Eviction**: Maintains stock access recency ordering with a constant capacity (`CACHE_CAPACITY = 100`). The least-recently-used node (`lruTail`) is automatically evicted and freed upon stock insertion when capacity is reached.
- **Salted Password Hashing & Industry-Standard 3-Tier RBAC**:
  - Stores salted cryptographic password hash strings (`username:salt:hash:role`) in `data/users.dat` to ensure password security.
  - Implements 3 user access roles (**Admin**, **Operator**, **Viewer**) with dynamic CLI menus rendered in `src/main.c`.
- **Read-Write Fine-Grained Thread Synchronization (`pthread_rwlock_t`)**:
  - Uses POSIX Read-Write locks (`cacheReadLock()`, `cacheWriteLock()`, `cacheUnlock()`).
  - Enables multiple reader threads to query active stocks concurrently without blocking each other, while writer threads safely serialize stock insertions and updates.
- **Asynchronous Logging & High-Speed Binary Persistence**:
  - Background logging worker thread flushes formatted log messages (including high-resolution timestamp and thread ID) to `logs/application.log`.
  - Zero-parse binary record serialization (`fwrite`/`fread`) for `data/cache_data.dat` and `data/backup.dat` ensuring high-speed microsecond disk flushes.
- **Strict Verification & Concurrency Stress Testing**:
  - Multi-threaded stress simulation binary (`stress_test`) running concurrent worker threads executing thousands of operations, demonstrating live thread-safe LRU evictions under ASan, UBSan, and Helgrind.
  - 12-suite CUnit unit and integration test framework (`make test`).
  - **100.0% Function Coverage** (59/59 functions) and **83.4% Line Coverage** (630/755 lines) (`make coverage`).
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
│   │   └── auth.h                          # Salted hashing & RBAC authentication API
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
│   │   ├── stock.h                         # Stock domain model struct (fixed-point cents & market depth)
│   │   └── user.h                          # User domain model struct (salt, hash, role)
│   ├── persistence/
│   │   └── storage.h                       # Binary disk cache save/load/backup API
│   ├── thread_manager/
│   │   └── thread_manager.h                # POSIX thread lifecycle & RW lock API
│   └── validation/
│       └── validator.h                     # Input validation API (symbol, cents, volume, exchange)
├── src/                                    # Source code implementations
│   ├── analytics/
│   │   └── analytics.c                     # Cache statistics tracking implementation
│   ├── authentication/
│   │   └── auth.c                          # Salted password hashing & RBAC authentication implementation
│   ├── cache_manager/
│   │   └── cache_manager.c                 # High-level stock CRUD operations implementation
│   ├── hash_table/
│   │   └── hash_table.c                    # Hash table lookup & collision handling implementation
│   ├── logging/
│   │   ├── logger.c                        # Asynchronous log message queueing implementation
│   │   └── timestamp.c                     # High-resolution POSIX timestamp implementation
│   ├── lru_cache/
│   │   └── lru_cache.c                     # Doubly linked list LRU node management
│   ├── main.c                              # Main interactive CLI entry point with dynamic role menus
│   ├── memory/
│   │   └── memory_manager.c                # Dynamic node allocation/deallocation implementation
│   ├── persistence/
│   │   └── storage.c                       # Binary disk record serialization (save/load/backup)
│   ├── simulation/
│   │   └── stress_test.c                   # Multi-threaded stress test runner with active LRU evictions
│   ├── thread_manager/
│   │   └── thread_manager.c                # POSIX thread manager & RW lock implementation
│   └── validation/
│       └── validator.c                     # Data input validation functions implementation
├── tests/                                  # CUnit unit and integration test framework
│   ├── compile_tests.sh                    # Test compilation script (supports COVERAGE=1)
│   ├── run_tests.sh                        # Test suite execution runner script
│   ├── test_authentication.c               # CUnit test suite for user authentication & roles
│   ├── test_cache_manager.c                # CUnit test suite for cache manager operations
│   ├── test_hash_table.c                   # CUnit test suite for hash table lookups
│   ├── test_integration.c                  # CUnit end-to-end integration test suite
│   ├── test_logging.c                      # CUnit test suite for logger module
│   ├── test_lru_cache.c                    # CUnit test suite for LRU cache ordering
│   ├── test_main.c                         # CUnit test suite for main initialization
│   ├── test_memory_manager.c               # CUnit test suite for memory manager
│   ├── test_statistics.c                   # CUnit test suite for performance analytics
│   ├── test_storage.c                      # CUnit test suite for binary disk persistence
│   ├── test_thread_manager.c               # CUnit test suite for thread manager & RW locks
│   └── test_validator.c                    # CUnit test suite for input validator
├── data/                                   # Persistent binary/text storage files
│   ├── backup.dat                          # Binary cache backup data file
│   ├── cache_data.dat                      # Persistent binary cache data storage file
│   ├── statistics.dat                      # Recorded cache statistics file
│   └── users.dat                           # Salted password hashes & user roles file
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
| **`make gcov`** | Instruments source files with `--coverage`, executes all CUnit test suites, and displays a formatted 5-column terminal ASCII table showing Line, Branch, Branch Taken, and Call Coverage percentages and counts. |
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
Run 16 concurrent worker threads executing 16,000 operations with live LRU evictions:
```bash
make clean && make stress
./stress_test 16 1000
```

### 3. Running Direct Terminal GCOV Coverage Report
Run GCC `gcov` directly to display a formatted terminal table showing Line, Branch, and Call Coverage:
```bash
make gcov
```

Example Terminal Output Table:
```text
=========================================================================================================
                                RTSMDC_Dev Terminal GCOV Coverage Report                                 
=========================================================================================================
Source File          | Line Coverage      | Branch Coverage    | Branch Taken       | Call Coverage     
---------------------------------------------------------------------------------------------------------
analytics.c          | 97.83% (90/92)     | 100.00% (10/10)    | 80.00% (8/10)      | 97.73% (43/44)    
auth.c               | 87.95% (73/83)     | 100.00% (48/48)    | 79.17% (38/48)     | 87.50% (35/40)    
cache_manager.c      | 72.61% (114/157)   | 87.88% (58/66)     | 59.09% (39/66)     | 70.71% (70/99)    
hash_table.c         | 97.83% (45/46)     | 100.00% (18/18)    | 94.44% (17/18)     | 100.00% (6/6)     
logger.c             | 94.12% (16/17)     | 100.00% (14/14)    | 85.71% (12/14)     | 100.00% (5/5)     
timestamp.c          | 83.33% (10/12)     | 100.00% (10/10)    | 80.00% (8/10)      | 100.00% (2/2)     
lru_cache.c          | 94.23% (49/52)     | 100.00% (24/24)    | 83.33% (20/24)     | 100.00% (7/7)     
memory_manager.c     | 84.62% (11/13)     | 100.00% (4/4)      | 50.00% (2/4)       | 0.00% (0/1)       
storage.c            | 81.72% (76/93)     | 100.00% (42/42)    | 69.05% (29/42)     | 88.64% (39/44)    
thread_manager.c     | 74.10% (123/166)   | 100.00% (56/56)    | 73.21% (41/56)     | 62.20% (51/82)    
validator.c          | 95.83% (23/24)     | 100.00% (24/24)    | 95.83% (23/24)     | N/A               
=========================================================================================================
 TOTAL SYSTEM LINE COVERAGE: 83.44% (630/755)
=========================================================================================================
```

### 4. Generating Visual HTML Code Coverage Report
```bash
make coverage
```
View the generated visual HTML report in your browser:
[coverage_html/index.html](file:///home/gowtham/Documents/cpoc/RTSMDC_Dev/coverage_html/index.html)

### 5. Running Code Optimization Analysis
```bash
make codeoptdata
```

---

## 5. Code Coverage Benchmark Results


| Source Module | Line Coverage | Function Coverage | Status |
| :--- | :---: | :---: | :---: |
| **`validation/validator.c`** | **100.0%** (23/23) | **100.0%** (4/4) | Passed |
| **`logging/timestamp.c`** | **100.0%** (10/10) | **100.0%** (1/1) | Passed |
| **`lru_cache/lru_cache.c`** | **100.0%** (49/49) | **100.0%** (6/6) | Passed |
| **`analytics/analytics.c`** | **100.0%** (90/90) | **100.0%** (11/11) | Passed |
| **`hash_table/hash_table.c`** | **100.0%** (45/45) | **100.0%** (5/5) | Passed |
| **`cache_manager/cache_manager.c`** | **100.0%** (114/114) | **100.0%** (7/7) | Passed |
| **`logging/logger.c`** | **100.0%** (16/16) | **100.0%** (4/4) | Passed |
| **`memory/memory_manager.c`** | **100.0%** (11/11) | **100.0%** (2/2) | Passed |
| **`persistence/storage.c`** | **100.0%** (76/76) | **100.0%** (3/3) | Passed |
| **`authentication/auth.c`** | **84.9%** (73/86) | **100.0%** (4/4) | Passed |
| **`thread_manager/thread_manager.c`** | **84.8%** (123/145) | **100.0%** (12/12) | Passed (100% reachable code) |
| **TOTAL PROJECT (`src/`)** | **83.4% (630/755)** | **100.0% (59/59)** | **100% Function Coverage** |

---

## 6. Code Optimization & Assembly Benchmark Results


| 1. Opt Level | 2. Assembly Lines | 3. `.text` Segment Size (Bytes) | 4. Executable Binary Size (Bytes) | 5. Real Time (s) | 6. User CPU Time (s) | 7. System CPU Time (s) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **`-O0`** | 5,272 | 25,288 | 37,712 | 0.14s | 0.10s | 0.17s |
| **`-O1`** | 4,458 | 22,256 | 41,688 | 0.14s | 0.06s | 0.17s |
| **`-O2`** | 4,698 | 22,358 | 41,648 | 0.26s | 0.15s | 0.37s |
| **`-O3`** | 4,767 | 22,598 | 41,616 | 0.43s | 0.20s | 0.45s |
| **`-Os`** | 4,142 | 20,034 | 37,552 | 0.30s | 0.08s | 0.16s |

