/*
 * RTSMDC_Dev
 * Logging subsystem (logger.h)
 *
 * Log entry formatting and enqueueing for asynchronous log writer.
 *
 * Thread ownership / synchronization:
 *   - Thread ownership: main/worker threads enqueue entries; log thread performs file writes via thread_manager.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef LOGGER_H
#define LOGGER_H

int logInfo(const char *module, const char *message);

int logError(const char *module, const char *message);

int logStockOperation(
    const char *module,
    const char *operation,
    const char *symbol
);

#endif