//
// Created by Dan Domnita on 27.02.2024.
//

#ifndef TEST_HELPER_H
#define TEST_HELPER_H

#include <stdio.h>

//#define SDA_LINUX
#define SDA_WINDOWS

int set_text_color(unsigned char foreground, unsigned char  background);
int reset_text_color();

#define MAKE_TEST(name) set_text_color(2, 0); printf("===== Testing "#name" =====\n"); reset_text_color(); \
                        if(test_##name() == 0){ \
                            set_text_color(10, 0); printf("======= PASS =======\n\n"); reset_text_color(); \
                        }else{ \
                            set_text_color(12, 0); printf("======= FAIL =======\n\n"); reset_text_color(); \
                        }

// Checks the condition if TRUE, else it prints the condition and returns the value given
#define CHECK_RET(CONDITION, ret_value)  if (!(CONDITION)) { \
                                                printf("[EXCEPTION] %s line:%4d (%s) -> %s\n",__FILE__,__LINE__,#CONDITION,#ret_value); \
                                                return ret_value; }

// Checks the condition if TRUE, else it prints the condition and break
#define CHECK_BRK(CONDITION)  if (!(CONDITION)) { \
                                    printf("[EXCEPTION] %s line:%4d (%s)\n",__FILE__,__LINE__,#CONDITION); \
                                    break; }

#endif //TEST_HELPER_H
