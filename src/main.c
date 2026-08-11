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

#include "model/user.h"
#include "authentication/auth.h"
#include "cache_manager/cache_manager.h"
#include "analytics/analytics.h"
#include "persistence/storage.h"
#include "lru_cache/lru_cache.h"
#include "thread_manager/thread_manager.h"

static void displayLoginMenu(void);
static void displayMainMenu(int userRole);

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

void displayMainMenu(int userRole)
{
    printf("\n");
    printf("=====================================\n");
    if (userRole == ROLE_ADMIN)
    {
        printf(" STOCK MARKET CACHE - ADMIN ROLE\n");
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
        printf("11. Logout / Exit\n");
    }
    else if (userRole == ROLE_OPERATOR)
    {
        printf(" STOCK MARKET CACHE - OPERATOR ROLE\n");
        printf("=====================================\n");
        printf("1. Add Stock\n");
        printf("2. Search Stock\n");
        printf("3. Update Stock\n");
        printf("4. Display Stocks\n");
        printf("5. View Statistics\n");
        printf("6. View LRU Order\n");
        printf("7. Logout / Exit\n");
    }
    else
    {
        printf(" STOCK MARKET CACHE - VIEWER ROLE\n");
        printf("=====================================\n");
        printf("1. Search Stock\n");
        printf("2. Display Stocks\n");
        printf("3. View Statistics\n");
        printf("4. View LRU Order\n");
        printf("5. Logout / Exit\n");
    }
    printf("=====================================\n");
    printf("Enter Choice : ");
}

#ifndef TEST_MAIN
int main(void)
{
    int choice;
    int userRole = 0;

    if (initializeThreadManager() != 0)
    {
        printf("Failed to initialize thread manager\n");
        return 1;
    }

    loadStatistics();
    (void)loadCache();

    while (1)
    {
        displayLoginMenu();

        if (scanf("%d", &choice) != 1)
        {
            break;
        }

        switch (choice)
        {
            case 1:
                (void)registerUser();
                break;

            case 2:
                userRole = loginUser();
                if (userRole != 0)
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
                clearCache();
                (void)shutdownThreadManager();
                return 0;

            default:
                printf("Invalid Choice\n");
                break;
        }
    }

APPLICATION_MENU:

    while (1)
    {
        displayMainMenu(userRole);

        if (scanf("%d", &choice) != 1)
        {
            break;
        }

        if (userRole == ROLE_ADMIN)
        {
            switch (choice)
            {
                case 1: addStock(); break;
                case 2: searchStock(); break;
                case 3: updateStock(); break;
                case 4: deleteStock(); break;
                case 5: displayStocks(); break;
                case 6: displayStatistics(); break;
                case 7:
                    if (signalCacheSave() == 0) { printf("Cache save requested\n"); }
                    else { printf("Unable to request cache save\n"); }
                    saveStatistics();
                    break;
                case 8: (void)loadCache(); break;
                case 9:
                    if (backupCache() != 0) { printf("Unable to create cache backup\n"); }
                    break;
                case 10: displayLRU(); break;
                case 11:
                    (void)requestCacheSaveAndWait();
                    saveStatistics();
                    clearCache();
                    printf("Application Closed Successfully\n");
                    (void)shutdownThreadManager();
                    return 0;
                default: printf("Invalid Choice\n"); break;
            }
        }
        else if (userRole == ROLE_OPERATOR)
        {
            switch (choice)
            {
                case 1: addStock(); break;
                case 2: searchStock(); break;
                case 3: updateStock(); break;
                case 4: displayStocks(); break;
                case 5: displayStatistics(); break;
                case 6: displayLRU(); break;
                case 7:
                    (void)requestCacheSaveAndWait();
                    saveStatistics();
                    clearCache();
                    printf("Application Closed Successfully\n");
                    (void)shutdownThreadManager();
                    return 0;
                default: printf("Invalid Choice\n"); break;
            }
        }
        else /* ROLE_VIEWER */
        {
            switch (choice)
            {
                case 1: searchStock(); break;
                case 2: displayStocks(); break;
                case 3: displayStatistics(); break;
                case 4: displayLRU(); break;
                case 5:
                    saveStatistics();
                    clearCache();
                    printf("Application Closed Successfully\n");
                    (void)shutdownThreadManager();
                    return 0;
                default: printf("Invalid Choice\n"); break;
            }
        }
    }

    clearCache();
    (void)shutdownThreadManager();
    return 0;
}
#endif

