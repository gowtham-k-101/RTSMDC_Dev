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


.PHONY: all app stress test valgrind helgrind cppcheck misra clean
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
	cppcheck --enable=warning,style,performance,portability,information,unusedFunction --error-exitcode=1 --suppress=missingIncludeSystem -Iinclude -Isrc src/

misra:
	cppcheck --addon=misra --error-exitcode=1 --suppress=missingIncludeSystem -Iinclude -Isrc src/

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(APP_OBJECTS) $(STRESS_OBJECTS) $(APP) $(STRESS_APP) $(TEST_BINARIES)



