/*
 * RTSMDC_Dev
 * Logging subsystem (timestamp.h)
 *
 * Log entry formatting and enqueueing for asynchronous log writer.
 *
 * Thread ownership / synchronization:
 *   - Thread ownership: main/worker threads enqueue entries; log thread performs file writes via thread_manager.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef TIMESTAMP_H
#define TIMESTAMP_H

#include <stddef.h>

int getCurrentTimestamp(char *buffer, size_t bufferSize);

#endif