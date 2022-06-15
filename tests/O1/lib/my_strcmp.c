/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** my_strcmp_and_strncmp
*/

#include "../include/my.h"

int my_strcmp(char const *s1, char const *s2)
{
    for (; (*s1 == *s2) && *s1 != '\0'; s1++, s2++);
    return (*s1 - *s2);
}

int my_strncmp(char const *s1, char const *s2, int n)
{
    for (; (*s1 == *s2) && *s1 != '\0' && n != 0; s1++, s2++, n--);
    return (*s1 - *s2);
}
