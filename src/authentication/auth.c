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

static void hashPassword(const char *password, const char *salt, char *outputHash)
{
    unsigned long hash = 5381;
    int c;
    const char *p;

    for (p = salt; *p; p++)
    {
        c = (unsigned char)*p;
        hash = ((hash << 5) + hash) + (unsigned long)c;
    }
    for (p = password; *p; p++)
    {
        c = (unsigned char)*p;
        hash = ((hash << 5) + hash) + (unsigned long)c;
    }

    (void)snprintf(outputHash, HASH_LENGTH, "%016lx%016lx", hash, (unsigned long)(hash ^ 0xA5A5A5A55A5A5A5AUL));
}

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

    while (fscanf(fp, "%49s %15s %64s %d", user.username, user.salt, user.password_hash, &user.role) == 4)
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
    char rawPassword[PASSWORD_LENGTH];
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
    if (scanf("%49s", rawPassword) != 1)
    {
        return 0;
    }

    printf("Select Role (1: Admin, 2: Operator, 3: Viewer) : ");
    if (scanf("%d", &user.role) != 1 || user.role < 1 || user.role > 3)
    {
        user.role = ROLE_VIEWER;
    }

    (void)snprintf(user.salt, sizeof(user.salt), "s%08x", (unsigned int)strlen(user.username) + 12345);
    hashPassword(rawPassword, user.salt, user.password_hash);

    (void)pthread_mutex_lock(&userMutex);
    fp = fopen(USER_FILE, "a");
    if (fp == NULL)
    {
        (void)pthread_mutex_unlock(&userMutex);
        printf("Unable To Open User File\n");
        return 0;
    }

    if (fprintf(fp, "%s %s %s %d\n", user.username, user.salt, user.password_hash, user.role) >= 0)
    {
        printf("Registration Successful (Role: %s)\n",
               user.role == ROLE_ADMIN ? "Admin" : (user.role == ROLE_OPERATOR ? "Operator" : "Viewer"));
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
    char computedHash[HASH_LENGTH];
    int authenticatedRole = 0;

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

    while (fscanf(fp, "%49s %15s %64s %d", user.username, user.salt, user.password_hash, &user.role) == 4)
    {
        if (strcmp(username, user.username) == 0)
        {
            hashPassword(password, user.salt, computedHash);
            if (strcmp(computedHash, user.password_hash) == 0)
            {
                authenticatedRole = user.role;
                break;
            }
        }
    }

    (void)fclose(fp);
    (void)pthread_mutex_unlock(&userMutex);

    if (authenticatedRole != 0)
    {
        printf("Login Successful (Role: %s)\n",
               authenticatedRole == ROLE_ADMIN ? "Admin" : (authenticatedRole == ROLE_OPERATOR ? "Operator" : "Viewer"));
    }
    else
    {
        printf("Invalid Username Or Password\n");
    }

    return authenticatedRole;
}