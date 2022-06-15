/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** setenv
*/

#include "my.h"

int error_setenv2(char *str, int *nb_space, int valid)
{
    if (str[0] != ' ' && !is_valid(str[0])) {
        my_printf("%e", "setenv: Variable name must begin with a letter.\n");
        return 1;
    }
    for (int i = 0; str[i]; i++) {
        if (str[i] == ' ' && valid == 1) {
            (*nb_space)++;
            valid = 0;
            continue;
        }
        if (str[i] != ' ' && str[i] != '/' && str[i] != '_'
            && !is_valid(str[i])) {
            my_printf("%e", "setenv: Variable name must");
            my_printf("%e", " contain alphanumeric characters.\n");
            return 1;
        }
        valid = 1;
    }
    return 0;
}

int error_setenv(char *str)
{
    int nb_space = 0;
    int valid = 0;

    if (error_setenv2(str, &nb_space, valid))
        return 1;
    if (nb_space > 1) {
        my_printf("%e", "setenv: Too many arguments.\n");
        return 1;
    }
    return 0;
}

int get_setenv(my_sh_t *my_sh, env_t *envi)
{
    char *key = NULL;
    char *value = NULL;

    if (error_setenv(my_sh->cmd)) {
        my_sh->status = 1;
        return 1;
    }
    key = parse_string(&my_sh->cmd);
    value = parse_string(&my_sh->cmd);
    push_node_at_end_of_list(&envi, value, key);
    free(key);
    free(value);
    return 1;
}
