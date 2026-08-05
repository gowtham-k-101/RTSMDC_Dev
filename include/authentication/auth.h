/*
 * RTSMDC_Dev
 * User authentication module (auth.h)
 *
 * User registration and login support.
 *
 * Thread ownership / synchronization:
 *   - Stateless functions; no internal synchronization.
 *
 * Public APIs:
 *   - Exposed declarations for module use.
 */
#ifndef AUTH_H
#define AUTH_H

int registerUser(void);

int loginUser(void);

#endif