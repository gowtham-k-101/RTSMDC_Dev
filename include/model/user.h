/*
 * RTSMDC_Dev
 * Data model definitions (user.h)
 *
 * Domain objects for stock, user, and statistics state.
 *
 * Thread ownership / synchronization:
 *   - Pure data representations; no thread ownership.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef USER_H
#define USER_H

enum
{
    USERNAME_LENGTH = 50,
    PASSWORD_LENGTH = 50,
    SALT_LENGTH = 16,
    HASH_LENGTH = 65,
    ROLE_ADMIN = 1,
    ROLE_OPERATOR = 2,
    ROLE_VIEWER = 3
};

typedef struct
{
    char username[USERNAME_LENGTH];
    char salt[SALT_LENGTH];
    char password_hash[HASH_LENGTH];
    int role;
} User;

#endif