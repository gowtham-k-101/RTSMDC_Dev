/*
 * RTSMDC_Dev
 * Logging subsystem (timestamp.c)
 *
 * Log entry formatting and enqueueing for asynchronous log writer.
 *
 * Thread ownership / synchronization:
 *   - Thread ownership: main/worker threads enqueue entries; log thread performs file writes via thread_manager.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stddef.h>
#include <stdio.h>
#include <time.h>

#include "logging/timestamp.h"

int getCurrentTimestamp(char *buffer, size_t bufferSize)
{
    const char format[] = "%Y-%m-%d %H:%M:%S";
    time_t currentTime;
    struct tm timeInfo;

    if ((buffer == NULL) || (bufferSize == 0U))
    {
        return -1;
    }

    currentTime = time(NULL);
    if (currentTime == (time_t)(-1))
    {
        return -1;
    }

    if (localtime_r(&currentTime, &timeInfo) == NULL)
    {
        return -1;
    }

    if (strftime(buffer, bufferSize, format, &timeInfo) == 0U)
    {
        return -1;
    }

    return 0;
}