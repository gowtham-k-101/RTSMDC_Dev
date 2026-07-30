CC = gcc
CFLAGS = -Wall -Wextra -g -I.
TEST_CFLAGS = $(shell pkg-config --cflags CUnit 2>/dev/null)
TEST_LIBS = $(shell pkg-config --libs CUnit 2>/dev/null)

SOURCES = main.c \
    authentication/auth.c \
    cache_manager/cache_manager.c \
    hash_table/hash_table.c \
    logging/logger.c \
    logging/timestamp.c \
    lru_cache/lru_cache.c \
    memory/memory_manager.c \
    persistence/storage.c \
    validation/validator.c \
    analytics/analytics.c

OBJECTS = $(SOURCES:.c=.o)
APP = app
TEST_BINARY = tests/test_hash_table

.PHONY: all app test clean
all: app

app: $(OBJECTS)
	$(CC) $(CFLAGS) -o $(APP) $(OBJECTS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TEST_BINARY): tests/test_hash_table.c hash_table/hash_table.c memory/memory_manager.c
	$(CC) $(CFLAGS) $(TEST_CFLAGS) -o $(TEST_BINARY) tests/test_hash_table.c hash_table/hash_table.c memory/memory_manager.c $(TEST_LIBS)

test: $(TEST_BINARY)
	./$(TEST_BINARY)

clean:
	rm -f $(OBJECTS) $(APP) $(TEST_BINARY)
