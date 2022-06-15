/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** the file don't containt the word : goto
*/

#include "include/goto.h"

int main(void)
{
    int i = 0;
    goto_t *goto_struct = malloc(sizeof(goto_t));

    goto_struct->value = &i;
    for (; i < 10; i++) {
        printf("coucou flavio ! le mot g.o.t.o n'est pas dans ce code\n");
    }
    goto_struct->str = "string";
    return 0;
}
