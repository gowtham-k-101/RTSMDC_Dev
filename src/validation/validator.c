/*
 * RTSMDC_Dev
 * Validation helper (validator.c)
 *
 * Input validation functions for symbol, price, and volume.
 *
 * Thread ownership / synchronization:
 *   - Stateless and thread-safe.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

#include "model/stock.h"
#include "validation/validator.h"

bool validateSymbol(const char *symbol)
{
    int i;

    if (symbol == NULL)
    {
        return false;
    }

    if (strlen(symbol) == 0)
    {
        return false;
    }

    if (strlen(symbol) >= SYMBOL_LENGTH)
    {
        return false;
    }

    for (i = 0; symbol[i] != '\0'; i++)
    {
        if (!isalnum((unsigned char)symbol[i]))
        {
            return false;
        }
    }

    return true;
}

bool validatePrice(float price)
{
    return (price > 0.0f);
}

bool validateVolume(int32_t volume)
{
    return (volume >= 0);
}