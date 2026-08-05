/*
 * RTSMDC_Dev
 * RTSMDC_Dev module (main.c)
 *
 * Project source file.
 *
 * Thread ownership / synchronization:
 *   - No special synchronization.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <stdio.h>
#include <stdlib.h>

#include "authentication/auth.h"

#include "cache_manager/cache_manager.h"

#include "analytics/analytics.h"

#include "persistence/storage.h"

#include "lru_cache/lru_cache.h"

#include "thread_manager/thread_manager.h"

static void displayLoginMenu(void);
static void displayMainMenu(void);

void displayLoginMenu(void)
{
    printf("\n");
    printf("=====================================\n");
    printf(" REAL-TIME STOCK MARKET DATA CACHE\n");
    printf("=====================================\n");
    printf("1. Register User\n");
    printf("2. Login\n");
    printf("3. Exit\n");
    printf("=====================================\n");
    printf("Enter Choice : ");
}

void displayMainMenu(void)
{
    printf("\n");
    printf("=====================================\n");
    printf(" STOCK MARKET CACHE SYSTEM\n");
    printf("=====================================\n");
    printf("1. Add Stock\n");
    printf("2. Search Stock\n");
    printf("3. Update Stock\n");
    printf("4. Delete Stock\n");
    printf("5. Display Stocks\n");
    printf("6. View Statistics\n");
    printf("7. Save Cache\n");
    printf("8. Load Cache\n");
    printf("9. Backup Cache\n");
    printf("10. View LRU Order\n");
    printf("11. Exit\n");
    printf("=====================================\n");
    printf("Enter Choice : ");
}

#ifndef TEST_MAIN
int main(void)
{
    int choice;
    int loggedIn = 0;

    if (initializeThreadManager() != 0)
    {
        printf("Failed to initialize thread manager\n");
        return 1;
    }

    loadStatistics();

    loadCache();

    while (1)
    {
        displayLoginMenu();

        scanf("%d", &choice);

        switch (choice)
        {
            case 1:

                registerUser();

                break;

            case 2:

                loggedIn = loginUser();

                if (loggedIn)
                {
                    goto APPLICATION_MENU;
                }

                break;

            case 3:

                if (requestCacheSaveAndWait() == 0)
                {
                    printf("Cache saved successfully\n");
                }
                else
                {
                    printf("Unable to complete cache save\n");
                }

                saveStatistics();

                (void)shutdownThreadManager();
                return 0;

            default:

                printf("Invalid Choice\n");
        }
    }

APPLICATION_MENU:

    while (1)
    {
        displayMainMenu();

        scanf("%d", &choice);

        switch (choice)
        {
            case 1:

                addStock();

                break;

            case 2:

                searchStock();

                break;

            case 3:

                updateStock();

                break;

            case 4:

                deleteStock();

                break;

            case 5:

                displayStocks();

                break;

            case 6:

                displayStatistics();

                break;

            case 7:

                if (signalCacheSave() == 0)
                {
                    printf("Cache save requested\n");
                }
                else
                {
                    printf("Unable to request cache save\n");
                }

                saveStatistics();

                break;

            case 8:

                loadCache();

                break;

            case 9:
                if (backupCache() != 0)
                {
                    printf("Unable to create cache backup\n");
                }
                break;

            case 10:

                displayLRU();

                break;

            case 11:

                if (requestCacheSaveAndWait() == 0)
                {
                    printf("Cache saved successfully\n");
                }
                else
                {
                    printf("Unable to complete cache save\n");
                }

                saveStatistics();

                printf("Application Closed Successfully\n");

                (void)shutdownThreadManager();
                return 0;

            default:

                printf("Invalid Choice\n");
        }
    }

    return 0;
}
#endif
