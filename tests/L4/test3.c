/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

#include <stdarg.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <dirent.h>
#include <stdlib.h>
#include <pwd.h>
#include <time.h>
#include <error.h>
#include <ncurses.h>
#include <fcntl.h>

int find_big_number(int *array, int size) {
    int cpt = 0;
    int pos = 0;

    for (int a = 0; a < size; a++)
    {
        if (array[a] > cpt && array[a] > 0) {
            cpt = array[a];
            pos = a;
        }
        else
            NULL;
    }
    printf("le plus grand nombre est à la position : %d\n", pos);
    return pos;
}

void rotate_left(int *array, int size) {
    int stock = array[0];
    int a = 0;

    while (a < size)
    {
        array[a - 1] = array[a];
        a += 1;
    } if (a == size)
        array[a - 1] = stock;
    array[size - 1] = stock;
}

void rotate_right(int *array, int size)
{
    int stock = array[size - 1];

    for (int i = size - 1; i; i--)
        array[i] = array[i - 1];
    array[0] = stock;
}

void pop(int *array1, int *array2, int size)
{
    if (array2[0] == -1)
        return;
    rotate_right(array1, size);
    array1[0] = array2[0];
    rotate_left(array2, size);
    array2[size - 1] = -1;
}

int main (void)
{
    int array1[10] = { 7, 15, 4, 300, 17, 1, 20, -1, -1, -1 };
    int array2[10] = { 3, 45, 4, -1, -1, -1, -1, -1, -1, -1 };
    int *toto = malloc(sizeof(int) * 10);
    int *tata = malloc(sizeof(int) * 10);

    memcpy(toto, array1, sizeof(int) * 10);
    memcpy(tata, array2, sizeof(int)* 10);
    pop(toto, tata, 10);
    return 0;
}
