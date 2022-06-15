/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** free_all
*/

#include "my.h"

void free_all(my_sh_t *my_sh, env_t *envi)
{
    if (my_sh->cmd != NULL)
        free(my_sh->cmd);
    if (my_sh->path != NULL) {
        for (int i = 0; my_sh->path[i]; i++)
            free(my_sh->path[i]);
        free(my_sh->path);
    }
    if (my_sh->home != NULL)
        free(my_sh->home);
    free(my_sh->pwd);
    for (; envi != NULL; envi = envi->next) {
        free(envi->key);
        free(envi->value);
    }
    free(envi);
}
