#ifndef ANALYTICS_H
#define ANALYTICS_H

#include "../model/statistics.h"

extern Statistics stats;

void initializeStatistics(void);

void recordHit(void);

void recordMiss(void);

void recordInsert(void);

void recordUpdate(void);

void recordDelete(void);

void recordEviction(void);

float getHitRatio(void);

void displayStatistics(void);

void saveStatistics(void);

void loadStatistics(void);

#endif