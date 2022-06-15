/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test2
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

char *reverse_string(char *str)
{
    char *tmp = str;

    for (; *str != '\0'; str++);
    str--;
    return (tmp);
}

void reverse_all(int argc, char **argv)
{
    srand(time(NULL));
    printf("reverse\n");
    for (int i = argc - 1; i >= 0; i--)
        printf("%s\n", reverse_string(argv[i]));
    printf("normal\n");
    for (int i = 0; i < argc; i++)
        printf("%s\n", argv[i]);
    printf("technique\n");
    for (int i = argc - 1; i >= 0; i--)
        printf("%s\n", argv[i]);
    printf("random\n");
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
    printf("%s\n", argv[rand() % argc]);
}

int main(int argc, char const **argv)
{
    if (argc < 2)
        return (84);
    else
        reverse_all(argc, argv);
    return (0);
}
