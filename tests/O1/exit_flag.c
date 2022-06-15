/*
** EPITECH PROJECT, 2022
** B-PSU-210-MPL-2-1-minishell2-nathan.catalan
** File description:
** exit_flag
*/

#include "my.h"

int exit_flag(my_sh_t *my_sh, env_t *envi)
{
    char *copie = my_strdup(my_sh->cmd);

    if (!my_strcmp(my_sh->cmd, "exit")) {
        my_sh->exit_value = 0;
        return 1;
    }
    move_pointer(&copie, ' ');
    return 0;
}

int test_pointeur(my_sh_t *my_sh)
{
    if (my_sh->path == NULL)
        return 1;
    if (my_sh->env == NULL)
        return 1;
    return 0;
}
