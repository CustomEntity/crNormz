/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** my_strcat_and_strncat
*/

#include "../include/my.h"

char *my_strcat(char *dest, char const *str)
{
    int cpt = 0;

    for (; dest[cpt]; cpt++);
    for (int i = 0; str[i]; i++, cpt++)
        dest[cpt] = str[i];
    return (dest);
}

char *my_strncat(char *dest , char const *src , int nb)
{
    int cpt = 0;

    for (; dest[cpt]; cpt++);
    for (int i = 0; src[i] && i < nb; i++, cpt++)
        dest[cpt] = src[i];
    return (dest);
}
