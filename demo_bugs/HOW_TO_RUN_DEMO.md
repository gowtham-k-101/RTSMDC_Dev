# How to Run the Valgrind and GDB Live Demo

This folder (`demo_bugs/`) contains isolated **buggy versions** and **clean original copies** of source files for your live demonstration of **Valgrind** (memory leak detection) and **GDB** (segmentation fault debugging).

All original files in `src/` are currently 100% clean and passing all test suites.

---

## Folder Contents
- `valgrind_leak_bug_hash_table.c` $\rightarrow$ Buggy hash table implementation (un-freed memory leak)
- `gdb_segfault_bug_cache_manager.c` $\rightarrow$ Buggy cache manager implementation (NULL pointer dereference crash)
- `original_hash_table.c` $\rightarrow$ Original clean `hash_table.c`
- `original_cache_manager.c` $\rightarrow$ Original clean `cache_manager.c`

---

## Demo 1: Valgrind Memory Leak Demo

### Step 1: Swap in Buggy Hash Table File
```bash
cp demo_bugs/valgrind_leak_bug_hash_table.c src/hash_table/hash_table.c
```

### Step 2: Compile and Run Valgrind
```bash
make clean && make stress
make valgrind
```

### Step 3: Explain the Valgrind Output
Valgrind will flag `definitely lost: X bytes in Y blocks` and trace the allocation call stack (`allocateNode` -> `insertNode` -> `writerThread`).

### Step 4: Restore Original Clean Code
```bash
cp demo_bugs/original_hash_table.c src/hash_table/hash_table.c
```

---

## Demo 2: GDB Segmentation Fault Demo

### Step 1: Swap in Buggy Cache Manager File
```bash
cp demo_bugs/gdb_segfault_bug_cache_manager.c src/cache_manager/cache_manager.c
```

### Step 2: Compile App and Launch GDB
```bash
make clean && make app
gdb ./app
```

### Step 3: Run Interactive Debugging inside GDB prompt `(gdb)`
1. Type `run` to start the program.
2. Log in: Choose `2. Login` (Username: `admin`, Password: `pass1234`).
3. Search for a missing stock: Choose `2. Search Stock` and type `NONEXISTENT`.
4. GDB catches the crash:
   ```text
   Program received signal SIGSEGV, Segmentation fault.
   0x00005555555562d4 in searchStock () at src/cache_manager/cache_manager.c:205
   205        printf("Symbol   : %s\n", node->stock.symbol);
   ```
5. Demonstrate debugging commands:
   - `print node` (shows `node = 0x0`, proving NULL pointer dereference)
   - `backtrace` (shows full call stack)
   - `list` (shows source code context)
   - `quit`

### Step 4: Restore Original Clean Code
```bash
cp demo_bugs/original_cache_manager.c src/cache_manager/cache_manager.c
```
