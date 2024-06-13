//
// Created by Dan Domnita on 27.02.2024.
//

#include "test_helper.h"
#include <stdio.h>

#if defined(SDA_WINDOWS)
#include <windows.h>
#endif

#if defined(SDA_LINUX)
#   include <unistd.h>
#   include <dlfcn.h>
#   include <sys/stat.h>
#endif

#if defined(SDA_LINUX)
//translations from Winglows colors
//order:                                black, blue, green, cyan, red, magenta, yellow, white, gray, lblue, lgreen, lcyan, lred, lmagenta, lyellow, bwhite
const unsigned char CONS_COLORS_FG[] = {   30,   34,    32,   36,  31,      35,     33,    37,   90,    94,     92,    94,   91,       95,      93,     97};
const unsigned char CONS_COLORS_BG[] = {   40,   44,    42,   46,  41,      45,     43,    47,  100,   104,    102,   106,  101,      105,     103,    107};
#endif

int set_text_color(unsigned char foreground, unsigned char  background){
    if (background >= 16 || foreground >= 16) {
        return -1;
    }
#if defined(SDA_WINDOWS)
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);

    if (hConsole == NULL) {
        return -2;
    }

    if (SetConsoleTextAttribute(hConsole, foreground+(background<<4)) == FALSE) {
        return -3;
    }
#elif defined(SDA_LINUX)
    if(!isatty(fileno(stdout))) return 0;
        printf("\033[%d;%dm", CONS_COLORS_FG[foreground], CONS_COLORS_BG[background]);
#endif
    return 0;
}

int reset_text_color(){
#if defined(SDA_WINDOWS)
    if (set_text_color(7,0) != 0) {
        return -1;
    }
#elif defined(SDA_LINUX)
    if(!isatty(fileno(stdout))) return 0;
        printf("\033[0m");
#endif
    return 0;
}
