/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** my_strdup
*/

#include "my.h"

void my_putstr_error(char *str)
{
    write(2, str, my_strlen(str));
}

char *my_strdup(char const *src)
{
    char *temp = malloc(sizeof(char) * (my_strlen(src) + 1));
    char *result = temp;

    while (*src)
        *temp++ = *src++;
    *temp = '\0';
    return result;
}
