/*
 * RTSMDC_Dev
 * Thread manager (thread_manager.h)
 *
 * Background logging and persistence threads with synchronized signaling.
 *
 * Thread ownership / synchronization:
 *   - Thread ownership: log thread owns log file writes; persistence thread owns cache save requests; public APIs are thread-safe.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef THREAD_MANAGER_H
#define THREAD_MANAGER_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

int initializeThreadManager(void);
int shutdownThreadManager(void);
int enqueueLogEntry(const char *entry);
int signalCacheSave(void);
int requestCacheSaveAndWait(void);

int cacheLock(void);
int cacheUnlock(void);

#ifdef __cplusplus
}
#endif

#endif
