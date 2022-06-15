/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** my_printf
*/

#include "../include/my.h"

void my_putchar(char c)
{
    write(1, &c, 1);
}

void my_putstr(char *str)
{
    for (int i = 0; str[i]; i++)
        my_putchar(str[i]);
}

void my_put_nbr(int nb)
{
    if (nb < 0) {
        my_putchar('-');
        nb = nb * -1;
    }
    if (nb > 9) {
        my_put_nbr(nb / 10);
        my_put_nbr(nb % 10);
    } else
        my_putchar(nb + '0');
}

void check_flags(char *str, va_list list, int *i)
{
    (*i)++;
    if (str[*i] == 's')
        my_putstr(va_arg(list, char *));
    if (str[*i] == 'd')
        my_put_nbr(va_arg(list, int));
    if (str[*i] == 'c')
        my_putchar(va_arg(list, int));
    if (str[*i] == 'e')
        my_putstr_error(va_arg(list, char *));
}

void my_printf(char *str, ...)
{
    va_list list = {0};
    va_start(list, str);

    for (int i = 0; str[i]; i++) {
        if (str[i] == '%')
            check_flags(str, list, &i);
        else
            my_putchar(str[i]);
    }
}
