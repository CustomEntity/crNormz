/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** my_strlen
*/

#include "../include/my.h"

int my_getnbr(char const *str)
{
    int i = 0;

    for (int a = 0; str[a]; a++)
        if (str[a] >= '0' && str[a] <= '9')
            i = i * 10 + str[a] - '0';
    return i;
}

int my_strlen(char const *str)
{
    int i = 0;

    for (; str[i]; i++);
    return i;
}
