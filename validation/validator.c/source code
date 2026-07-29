#include <string.h>
#include <ctype.h>

#include "../model/stock.h"
#include "validator.h"

int validateSymbol(const char *symbol)
{
    int i;

    if(symbol == NULL)
    {
        return 0;
    }

    if(strlen(symbol) == 0)
    {
        return 0;
    }

    if(strlen(symbol) >= SYMBOL_LENGTH)
    {
        return 0;
    }

    for(i = 0; symbol[i] != '\0'; i++)
    {
        if(!isalnum((unsigned char)symbol[i]))
        {
            return 0;
        }
    }

    return 1;
}

int validatePrice(float price)
{
    return (price > 0);
}

int validateVolume(long volume)
{
    return (volume >= 0);
}