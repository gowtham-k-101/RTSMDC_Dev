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
    PASSWORD_LENGTH = 50
};

typedef struct
{
    char username[USERNAME_LENGTH];

    char password[PASSWORD_LENGTH];

} User;

#endif