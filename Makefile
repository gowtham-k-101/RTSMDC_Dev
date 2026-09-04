CC = gcc
STRICT_CFLAGS = -Wall -Wextra -Wpedantic -Wconversion -Wshadow -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Werror -D_POSIX_C_SOURCE=200809L -pthread -Iinclude -Isrc

ifeq ($(DEBUG),1)
    CFLAGS = $(STRICT_CFLAGS) -g -fsanitize=address -fsanitize=undefined
else
    CFLAGS = $(STRICT_CFLAGS) -g
endif

CORE_SOURCES = src/authentication/auth.c \
    src/cache_manager/cache_manager.c \
    src/hash_table/hash_table.c \
    src/logging/logger.c \
    src/logging/timestamp.c \
    src/lru_cache/lru_cache.c \
    src/memory/memory_manager.c \
    src/persistence/storage.c \
    src/thread_manager/thread_manager.c \
    src/validation/validator.c \
    src/analytics/analytics.c

APP_SOURCES = src/main.c $(CORE_SOURCES)
APP_OBJECTS = $(APP_SOURCES:.c=.o)

STRESS_SOURCES = src/simulation/stress_test.c $(CORE_SOURCES)
STRESS_OBJECTS = $(STRESS_SOURCES:.c=.o)
APP = app
STRESS_APP = stress_test

TEST_BINARIES = tests/test_validator \
    tests/test_hash_table \
    tests/test_lru_cache \
    tests/test_statistics \
    tests/test_authentication \
    tests/test_cache_manager \
    tests/test_storage \
    tests/test_logging \
    tests/test_timestamp \
    tests/test_thread_manager \
    tests/test_memory_manager \
    tests/test_main \
    tests/test_integration


.PHONY: all app stress test valgrind helgrind cppcheck misra clean codeoptfile codeoptdata coverage gcov
all: app stress

app: $(APP_OBJECTS)
	$(CC) $(CFLAGS) -o $(APP) $(APP_OBJECTS)

stress: $(STRESS_OBJECTS)
	$(CC) $(CFLAGS) -o $(STRESS_APP) $(STRESS_OBJECTS)

test:
	cd tests && ./compile_tests.sh && ./run_tests.sh

valgrind: stress
	valgrind --leak-check=full --show-leak-kinds=all --error-exitcode=1 ./stress_test 16 500

helgrind: stress
	valgrind --tool=helgrind --error-exitcode=1 ./stress_test 16 500

cppcheck:
	cppcheck --language=c --enable=warning,style,performance,portability,unusedFunction --error-exitcode=1 --suppress=missingIncludeSystem -Iinclude -Isrc src/

misra:
	cppcheck --language=c --addon=misra --error-exitcode=1 --suppress=missingIncludeSystem -Iinclude -Isrc src/

coverage:
	@rm -rf coverage_html coverage.info coverage_src.info src/*.gcda src/*.gcno tests/*.gcda tests/*.gcno tests/*.o
	@cd tests && COVERAGE=1 ./compile_tests.sh && ./run_tests.sh
	@lcov --capture --directory tests --output-file coverage.info --ignore-errors mismatch,gcov,unused > /dev/null 2>&1
	@lcov --extract coverage.info "*/src/*" --output-file coverage_src.info --ignore-errors unused,empty,mismatch > /dev/null 2>&1
	@genhtml coverage_src.info --output-directory coverage_html --ignore-errors mismatch,unused,source > /dev/null 2>&1
	@echo ""
	@echo "========================================================================"
	@echo " RTSMDC_Dev Code Coverage Report Generated Successfully!"
	@echo "========================================================================"
	@echo " Visual HTML Report: file://$(CURDIR)/coverage_html/index.html"
	@echo "------------------------------------------------------------------------"
	@lcov --summary coverage_src.info
	@echo "========================================================================"
	@echo ""

gcov:
	@rm -rf coverage_html coverage.info coverage_src.info *.gcda *.gcno *.gcov src/*.gcda src/*.gcno src/*/*.gcda src/*/*.gcno tests/*.gcda tests/*.gcno tests/*.gcov tests/*.o
	@cd tests && COVERAGE=1 ./compile_tests.sh > /dev/null 2>&1 && ./run_tests.sh > /dev/null 2>&1 && gcov -b -o . ../src/analytics/analytics.c ../src/authentication/auth.c ../src/cache_manager/cache_manager.c ../src/hash_table/hash_table.c ../src/logging/logger.c ../src/logging/timestamp.c ../src/lru_cache/lru_cache.c ../src/memory/memory_manager.c ../src/persistence/storage.c ../src/thread_manager/thread_manager.c ../src/validation/validator.c | python3 ../tests/parse_gcov.py

codeoptfile:
	@for opt in O0 O1 O2 O3 Os; do \
		echo "Compiling assembly (.s) and binaries for -$$opt..."; \
		$(CC) $(STRICT_CFLAGS) -$$opt -S $(APP_SOURCES); \
		cat main.s auth.s cache_manager.s hash_table.s logger.s timestamp.s lru_cache.s memory_manager.s storage.s thread_manager.s validator.s analytics.s > app_$$opt.s; \
		rm -f main.s auth.s cache_manager.s hash_table.s logger.s timestamp.s lru_cache.s memory_manager.s storage.s thread_manager.s validator.s analytics.s; \
		$(CC) $(STRICT_CFLAGS) -$$opt $(APP_SOURCES) -o app_$$opt; \
		$(CC) $(STRICT_CFLAGS) -$$opt $(STRESS_SOURCES) -o stress_$$opt; \
	done
	@echo "All assembly files (app_O*.s) and executables (app_O*, stress_O*) created successfully."

codeoptdata:
	@if [ ! -f app_O0.s ]; then $(MAKE) codeoptfile; fi
	@echo ""
	@echo "========================================================================================================"
	@echo "                          RTSMDC_Dev Code Optimization & Assembly Analysis                              "
	@echo "========================================================================================================"
	@printf "%-10s | %-16s | %-16s | %-15s | %-13s | %-12s | %-12s\n" "Opt Level" "Assembly Lines" ".text Segment" "Binary Size (B)" "Real Time (s)" "User CPU (s)" "Sys CPU (s)"
	@echo "--------------------------------------------------------------------------------------------------------"
	@for opt in O0 O1 O2 O3 Os; do \
		s_lines=$$(wc -l < app_$$opt.s | tr -d ' '); \
		text_size=$$(size app_$$opt | awk 'NR==2 {print $$1}'); \
		bin_size=$$(stat -c%s app_$$opt); \
		times=$$( { /usr/bin/time -f "%e %U %S" ./stress_$$opt 32 3000 > /dev/null; } 2>&1 ); \
		real_t=$$(echo $$times | awk '{print $$1}'); \
		usr_t=$$(echo $$times | awk '{print $$2}'); \
		sys_t=$$(echo $$times | awk '{print $$3}'); \
		printf "%-10s | %-16s | %-16s | %-15s | %-13s | %-12s | %-12s\n" "-$$opt" "$$s_lines" "$$text_size" "$$bin_size" "$${real_t}s" "$${usr_t}s" "$${sys_t}s"; \
	done
	@echo "========================================================================================================"
	@echo ""

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(APP_OBJECTS) $(STRESS_OBJECTS) $(APP) $(STRESS_APP) $(TEST_BINARIES) tests/*.o app_O*.s app_O0 app_O1 app_O2 app_O3 app_Os stress_O0 stress_O1 stress_O2 stress_O3 stress_Os coverage_html coverage.info coverage_src.info *.gcda *.gcno *.gcov src/*.gcda src/*.gcno src/*/*.gcda src/*/*.gcno tests/*.gcda tests/*.gcno tests/*.gcov tests_*.txt



