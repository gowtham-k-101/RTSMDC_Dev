#ifndef LOGGER_H
#define LOGGER_H

void logInfo(const char *message);

void logError(const char *message);

void logStockOperation(
    const char *operation,
    const char *symbol
);

#endif