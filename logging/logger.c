#include <stdio.h>

#include "logger.h"
#include "timestamp.h"

#define LOG_FILE "logs/application.log"

void logInfo(const char *message)
{
    FILE *fp;
    char timestamp[30];

    getCurrentTimestamp(timestamp);

    fp = fopen(LOG_FILE, "a");

    if(fp == NULL)
    {
        return;
    }

    fprintf(fp,
            "%s | INFO | %s\n",
            timestamp,
            message);

    fclose(fp);
}

void logError(const char *message)
{
    FILE *fp;
    char timestamp[30];

    getCurrentTimestamp(timestamp);

    fp = fopen(LOG_FILE, "a");

    if(fp == NULL)
    {
        return;
    }

    fprintf(fp,
            "%s | ERROR | %s\n",
            timestamp,
            message);

    fclose(fp);
}

void logStockOperation(
    const char *operation,
    const char *symbol)
{
    FILE *fp;
    char timestamp[30];

    getCurrentTimestamp(timestamp);

    fp = fopen(LOG_FILE, "a");

    if(fp == NULL)
    {
        return;
    }

    fprintf(fp,
            "%s | %s | %s\n",
            timestamp,
            operation,
            symbol);

    fclose(fp);
}