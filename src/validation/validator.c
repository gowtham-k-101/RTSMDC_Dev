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

bool validatePrice(uint32_t price_cents)
{
    return (price_cents > 0);
}

bool validateVolume(int32_t volume)
{
    return (volume >= 0);
}

bool validateExchange(const char *exchange)
{
    if (exchange == NULL)
    {
        return false;
    }
    if (strlen(exchange) == 0 || strlen(exchange) >= 8)
    {
        return false;
    }
    if (strcmp(exchange, "NASDAQ") == 0 || strcmp(exchange, "NYSE") == 0 ||
        strcmp(exchange, "AMEX") == 0 || strcmp(exchange, "CBOE") == 0)
    {
        return true;
    }
    return false;
}