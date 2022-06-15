/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** my_fill_in_and_destroy
*/

#include "../include/my.h"

char *fill_in(int size)
{
    char *str = malloc(size + 1);

    for (int i = 0; i < size; i++)
        str[i] = '\0';
    str[size] = '\0';
    return str;
}

char *destroy_string(char *str)
{
    for (int i = 0; str[i]; i++)
        str[i] = '\0';
    return str;
}
