/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test8
*/

#include <unistd.h>
#include <stdio.h>

int main(void)
{
    int a = 0;
    int c = 0;

    if ((a = malloc(sizeof(int) * (a = 84))) == NULL)
        return 84;
    else
        a = 84;
    return a ? sizeof(a) : (c = sizeof(a)++) ;
}
