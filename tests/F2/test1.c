/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test1
*/

#include <stdio.h>

void my_len(char *str)
{
    int i = 0;

    while (str[i] != '\0')
        i++;
    printf("%d\n", i);
}

void nb_voyelles(char *str)
{
    int i = 0;
    int nb = 0;

    while (str[i] != '\0') {
        if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' ||
            str[i] == 'u' || str[i] == 'y')
            nb++;
        i++;
    }
    printf("%d\n", nb);
}

void a_nb(char *str)
{
    int i = 0;
    int nb = 0;

    while (str[i] != '\0') {
        if (str[i] == 'a')
            nb++;
        i++;
    }
    printf("%d\n", nb);
}

int main(void)
{
    my_len("Hello");
    nb_voyelles("Hello");
    return 0;
}
