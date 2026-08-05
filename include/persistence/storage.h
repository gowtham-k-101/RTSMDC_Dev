/*
 * RTSMDC_Dev
 * Persistence layer (storage.h)
 *
 * Cache save/load/backup functions for disk storage.
 *
 * Thread ownership / synchronization:
 *   - Acquires cacheLock()/cacheUnlock() to serialize cache file operations.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef STORAGE_H
#define STORAGE_H

int saveCache(void);

int loadCache(void);

int backupCache(void);

#endif