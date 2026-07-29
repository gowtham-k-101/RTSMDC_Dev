#include <stdio.h>
#include <time.h>

#include "timestamp.h"

void getCurrentTimestamp(char *buffer)
{
    time_t currentTime;
    struct tm *timeInfo;

    currentTime = time(NULL);

    timeInfo = localtime(&currentTime);

    sprintf(buffer,
            "%04d-%02d-%02d %02d:%02d:%02d",
            timeInfo->tm_year + 1900,
            timeInfo->tm_mon + 1,
            timeInfo->tm_mday,
            timeInfo->tm_hour,
            timeInfo->tm_min,
            timeInfo->tm_sec);
}