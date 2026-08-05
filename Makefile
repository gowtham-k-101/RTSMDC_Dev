CC = gcc
CFLAGS = -Wall -Wextra -g -D_POSIX_C_SOURCE=200809L -Iinclude -Isrc
TEST_CFLAGS = $(shell pkg-config --cflags CUnit 2>/dev/null)
TEST_LIBS = $(shell pkg-config --libs CUnit 2>/dev/null)

SOURCES = src/main.c \
    src/authentication/auth.c \
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

OBJECTS = $(SOURCES:.c=.o)
APP = app
TEST_SCRIPT = tests/compile_tests.sh
TEST_RUNNER = tests/run_tests.sh

.PHONY: all app test clean
all: app

app: $(OBJECTS)
	$(CC) $(CFLAGS) -o $(APP) $(OBJECTS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TEST_SCRIPT)
	cd tests && ./compile_tests.sh && ./run_tests.sh

clean:
	rm -f $(OBJECTS) $(APP) tests/test_*
