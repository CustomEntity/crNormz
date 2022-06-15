/*
** EPITECH PROJECT, 2021
** B-CPE-110-MPL-1-1-pushswap-nathan.catalan
** File description:
** pushswap
*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

void swap_elem(int *array, int index1, int index2)
{
    int cpt = array[index1];

    array[index1] = array[index2];
    array[index2] = cpt;
}

void bubble_sort_array(int *array, int size)
{
    int i = 0;

    while (i < size)
    {
        if (array[i] > array[i + 1])
        {
            swap_elem(array, i, i + 1);
            i = 0;
        } else
            i += 1;
    }
}

void my_amazing_sorter(int *array, int size) {
    int i = 0;

    while (i < size) {
        if (array[i] > array[i + 1])
        {
            swap_elem(array, i, i + 1);
            printf("| swap %d => %d | new_list ", array[i], array[i + 1]);
            i = 0;
        }
    }
}

int main (void)
{
    int array[6] = {
        6, 5, 4, 3, 2, 1
    };
    int *toto = malloc(sizeof(int) * 6);

    memcpy(toto, array, sizeof(int) * 6);
    my_amazing_sorter(toto, 6);
    return 0;
}
