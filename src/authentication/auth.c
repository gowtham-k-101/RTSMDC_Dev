/*
 * RTSMDC_Dev
 * User authentication module (auth.c)
 *
 * User registration and login support.
 *
 * Thread ownership / synchronization:
 *   - Stateless functions; no internal synchronization.
 *
 * Public APIs:
 *   - Implementation of module services.
 */
#include <pthread.h>
#include <stdio.h>
#include <string.h>

#include "model/user.h"
#include "authentication/auth.h"

static const char USER_FILE[] = "data/users.dat";
static pthread_mutex_t userMutex = PTHREAD_MUTEX_INITIALIZER;

static int userExists(const char *username)
{
    FILE *fp;
    User user;
    int found = 0;

    fp = fopen(USER_FILE, "r");
    if (fp == NULL)
    {
        return 0;
    }

    while (fscanf(fp, "%49s %49s", user.username, user.password) == 2)
    {
        if (strcmp(user.username, username) == 0)
        {
            found = 1;
            break;
        }
    }

    (void)fclose(fp);
    return found;
}

int registerUser(void)
{
    FILE *fp;
    User user;
    int result = 0;

    printf("\n========== USER REGISTRATION ==========\n");

    printf("Enter Username : ");
    if (scanf("%49s", user.username) != 1)
    {
        return 0;
    }

    (void)pthread_mutex_lock(&userMutex);
    if (userExists(user.username) != 0)
    {
        (void)pthread_mutex_unlock(&userMutex);
        printf("Username Already Exists\n");
        return 0;
    }
    (void)pthread_mutex_unlock(&userMutex);

    printf("Enter Password : ");
    if (scanf("%49s", user.password) != 1)
    {
        return 0;
    }

    (void)pthread_mutex_lock(&userMutex);
    fp = fopen(USER_FILE, "a");
    if (fp == NULL)
    {
        (void)pthread_mutex_unlock(&userMutex);
        printf("Unable To Open User File\n");
        return 0;
    }

    if (fprintf(fp, "%s %s\n", user.username, user.password) >= 0)
    {
        printf("Registration Successful\n");
        result = 1;
    }
    else
    {
        printf("Failed to write user to file\n");
    }

    (void)fclose(fp);
    (void)pthread_mutex_unlock(&userMutex);

    return result;
}

int loginUser(void)
{
    FILE *fp;
    User user;
    char username[USERNAME_LENGTH];
    char password[PASSWORD_LENGTH];
    int success = 0;

    printf("\n========== USER LOGIN ==========\n");

    printf("Enter Username : ");
    if (scanf("%49s", username) != 1)
    {
        return 0;
    }

    printf("Enter Password : ");
    if (scanf("%49s", password) != 1)
    {
        return 0;
    }

    (void)pthread_mutex_lock(&userMutex);
    fp = fopen(USER_FILE, "r");

    if (fp == NULL)
    {
        (void)pthread_mutex_unlock(&userMutex);
        printf("No Registered Users Found\n");
        return 0;
    }

    while (fscanf(fp, "%49s %49s", user.username, user.password) == 2)
    {
        if ((strcmp(username, user.username) == 0) &&
            (strcmp(password, user.password) == 0))
        {
            success = 1;
            break;
        }
    }

    (void)fclose(fp);
    (void)pthread_mutex_unlock(&userMutex);

    if (success != 0)
    {
        printf("Login Successful\n");
    }
    else
    {
        printf("Invalid Username Or Password\n");
    }

    return success;
}