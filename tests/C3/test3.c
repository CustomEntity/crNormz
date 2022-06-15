/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

#include <stdio.h>

int main(void)
{
    int i = 0;

    for (; i < 10; i++ ) {
        printf("Outer loop executing. i = %d\n", i);
        if ( i == 5 )
            goto stop;
    }
    stop: printf( "Jumped to stop. i = %d\n", i);
}
