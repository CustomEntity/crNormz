/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test1
*/

#include <stdarg.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <dirent.h>
#include <stdlib.h>
#include <pwd.h>
#include <time.h>
#include <errno.h>
#include <ncurses.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/ioctl.h>

void loop_game(void)
{
    struct winsize w;
    int random_char = 0;
    int random_pos = 0;

    srand(time(NULL));
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    initscr();
    keypad(stdscr, TRUE);
    noecho();
    cbreak();
    while(1) {
        clear();
        printw("hello");
    }
    erase();
    endwin();
}

int main(int argc, char **argv)
{
    if (argc != 2 || argv == NULL) {
        return 84;
    }
    loop_game();
}
