/*
 * RTSMDC_Dev
 * Logging subsystem (logger.c)
 *
 * Log entry formatting and enqueueing for asynchronous log writer.
 *
 * Thread ownership / synchronization:
 *   - Thread ownership: main/worker threads enqueue entries; log thread performs file writes via thread_manager.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <pthread.h>
#include <stdio.h>
#include <string.h>

#include "logging/logger.h"
#include "logging/timestamp.h"
#include "thread_manager/thread_manager.h"

static int writeLog(const char *module,
                    const char *severity,
                    const char *message)
{
    char timestamp[30];
    char entry[512];
    unsigned long threadId;

    if ((module == NULL) || (severity == NULL) || (message == NULL))
    {
        return -1;
    }

    if (getCurrentTimestamp(timestamp, sizeof(timestamp)) != 0)
    {
        return -1;
    }

    threadId = (unsigned long)pthread_self();

    (void)snprintf(entry,
                   sizeof(entry),
                   "%s | [Thread %lu] | [%s] | [%s] | %s",
                   timestamp,
                   threadId,
                   severity,
                   module,
                   message);

    return enqueueLogEntry(entry);
}

int logInfo(const char *module, const char *message)
{
    return writeLog(module, "INFO", message);
}

int logError(const char *module, const char *message)
{
    return writeLog(module, "ERROR", message);
}

int logStockOperation(
    const char *module,
    const char *operation,
    const char *symbol)
{
    char content[256];

    if ((module == NULL) || (operation == NULL) || (symbol == NULL))
    {
        return -1;
    }

    (void)snprintf(content,
                   sizeof(content),
                   "%s | %s",
                   operation,
                   symbol);

    return writeLog(module, "OPERATION", content);
}
