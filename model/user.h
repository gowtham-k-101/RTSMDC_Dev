#ifndef USER_H
#define USER_H

#define USERNAME_LENGTH 50
#define PASSWORD_LENGTH 50

typedef struct
{
    char username[USERNAME_LENGTH];

    char password[PASSWORD_LENGTH];

} User;

#endif