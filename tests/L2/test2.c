/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test2
*/

#include <unistd.h>

int get_name(char *str1, char *str2)
{
int i = 0;

    if ( !strcmp(str1, "nathan")  && !strcmp(str1, str2) )
         return (1);
    if ( !strcmp(str1, "flabio") && !strcmp(str1, str2) )
         return (1);
    if ( !strcmp(str1, "flavio") && !strcmp(str1, str2) )
    return (1);
    if ( !strcmp(str1, "playmobile") && !strcmp(str1, str2) )
         return (1);
}

int main(int argc, char **argv)
{
    if (argc != 3)
    return 84;
    return get_name(argv[1], argv[2]);
}
