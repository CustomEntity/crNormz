/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** my_strcpy_and_strncpy
*/

#include "../include/my.h"

char *my_strcpy(char *dest, char const *src)
{
    int i = 0;

    for (; src[i]; i++)
        dest[i] = src[i];
    dest[i] = '\0';
    return (dest);
}

char *my_strncpy(char *dest , char const *src, int n)
{
    dest = fill_in(n);

    for (int i = 0; src[i] && i < n; i++)
        dest[i] = src[i];
    dest[n] = '\0';
    return dest;
}
