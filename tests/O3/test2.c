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

void putchar(char c)
{
    write(1, &c, 1);
}

void tkt(char c);

void putstr(char *str)
{
    int i = 0;

    while (str[i] != '\0') {
        putchar(str[i]);
        i++;
    }
}

void putnbr(int nb)
{
    if (nb < 0) {
        putchar('-');
        nb = -nb;
    }
    if (nb >= 10)
        putnbr(nb / 10);
    putchar(nb % 10 + '0');
}

void putnbr_base(int nb, char *base)
{
    int i = 0;

    if (nb < 0) {
        putchar('-');
        nb = -nb;
    }
    if (nb >= strlen(base))
        putnbr_base(nb / strlen(base), base);
    putchar(base[nb % strlen(base)]);
}

void putnbr_unsigned(unsigned int nb)
{
    if (nb >= 10)
        putnbr_unsigned(nb / 10);
    putchar(nb % 10 + '0');
}

int main(void)
{
    return (0);
}
