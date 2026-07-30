#include <stdio.h>
#include <string.h>

#include "../model/user.h"
#include "auth.h"

#define USER_FILE "data/users.dat"

static int userExists(const char *username)
{
    FILE *fp;

    User user;

    fp = fopen(USER_FILE, "r");

    if(fp == NULL)
    {
        return 0;
    }

    while(fscanf(fp,
                 "%49s %49s",
                 user.username,
                 user.password) == 2)
    {
        if(strcmp(user.username,
                  username) == 0)
        {
            fclose(fp);
            return 1;
        }
    }

    fclose(fp);

    return 0;
}

int registerUser(void)
{
    FILE *fp;

    User user;

    printf("\n========== USER REGISTRATION ==========\n");

    printf("Enter Username : ");
    scanf("%49s", user.username);

    if(userExists(user.username))
    {
        printf("Username Already Exists\n");
        return 0;
    }

    printf("Enter Password : ");
    scanf("%49s", user.password);

    fp = fopen(USER_FILE, "a");

    if(fp == NULL)
    {
        printf("Unable To Open User File\n");
        return 0;
    }

    fprintf(fp,
            "%s %s\n",
            user.username,
            user.password);

    fclose(fp);

    printf("Registration Successful\n");

    return 1;
}

int loginUser(void)
{
    FILE *fp;

    User user;

    char username[USERNAME_LENGTH];

    char password[PASSWORD_LENGTH];

    printf("\n========== USER LOGIN ==========\n");

    printf("Enter Username : ");
    scanf("%49s", username);

    printf("Enter Password : ");
    scanf("%49s", password);

    fp = fopen(USER_FILE, "r");

    if(fp == NULL)
    {
        printf("No Registered Users Found\n");
        return 0;
    }

    while(fscanf(fp,
                 "%49s %49s",
                 user.username,
                 user.password) == 2)
    {
        if(strcmp(username,
                  user.username) == 0 &&
           strcmp(password,
                  user.password) == 0)
        {
            fclose(fp);

            printf("Login Successful\n");

            return 1;
        }
    }

    fclose(fp);

    printf("Invalid Username Or Password\n");

    return 0;
}