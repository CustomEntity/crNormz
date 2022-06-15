/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char *fill_in(int size)
{
    char *str = malloc(sizeof(char) * (size + 1));

    for (int i = 0; i <= size; i++)
        str[i] = '\0';
    return (str);
}

void parse_string(char *str)
{
    char *tmp = fill_in(strlen(str));
    char *str_parse = fill_in(strlen(str) * 2);

    tmp = strtok(str, " \t\n");
    while ((tmp = strtok(NULL, " \t\n")) != NULL)
        strcat(strcat(str_parse, tmp), " ");
    printf("%s\n", str_parse);
}

int main(int argc, char **argv)
{
    if (argc != 2)
        return 84;
    parse_string(argv[1]);
    return 0;
}
