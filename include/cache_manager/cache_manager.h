/*
 * RTSMDC_Dev
 * Cache manager (cache_manager.h)
 *
 * Public cache operations and user-facing stock commands.
 *
 * Thread ownership / synchronization:
 *   - Calls cacheLock()/cacheUnlock() to protect shared cache state.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef CACHE_MANAGER_H
#define CACHE_MANAGER_H

void addStock(void);

void searchStock(void);

void updateStock(void);

void deleteStock(void);

void displayStocks(void);

void clearCache(void);

#endif