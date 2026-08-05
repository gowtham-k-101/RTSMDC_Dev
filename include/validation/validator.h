/*
 * RTSMDC_Dev
 * Validation helper (validator.h)
 *
 * Input validation functions for symbol, price, and volume.
 *
 * Thread ownership / synchronization:
 *   - Stateless and thread-safe.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef VALIDATOR_H
#define VALIDATOR_H

#include <stdbool.h>
#include <stdint.h>

bool validateSymbol(const char *symbol);

bool validatePrice(float price);

bool validateVolume(int32_t volume);

#endif