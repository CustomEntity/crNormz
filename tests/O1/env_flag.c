/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** env_flag
*/

#include "my.h"

int print_env(env_t *envi)
{
    env_t *tmp = envi;

    for (; tmp != NULL; tmp = tmp->next)
        my_printf("%s=%s\n", tmp->key, tmp->value);
    return 1;
}

void delete_node(env_t **envi, env_t *position, int i)
{
    env_t *tmp = (*envi);

    if (i == 0) {
        (*envi) = (*envi)->next;
        free(tmp);
        return;
    }
    if (position->next == NULL) {
        for (; tmp->next->next != NULL; tmp = tmp->next);
        free(tmp->next);
        tmp->next = NULL;
        return;
    }
    for (; tmp->next != position; tmp = tmp->next);
    tmp->next = tmp->next->next;
}

int get_unsetenv(my_sh_t *my_sh, env_t **envi)
{
    char *key = parse_string(&my_sh->cmd);
    env_t *tmp = *envi;

    for (int i = 0; tmp != NULL; tmp = tmp->next, i++)
        if (!my_strcmp(tmp->key, key)) {
            delete_node(envi, tmp, i);
            break;
        }
    return 1;
}

int env_flag(my_sh_t *my_sh, env_t **envi)
{
    char *cmd_parse = copie_cmd(my_sh->cmd);
    char *cmd_save_for_env = my_strdup(my_sh->cmd);

    if (!my_strcmp(my_sh->cmd, "/")) {
        my_printf("/: Permission denied.\n");
        return 1;
    }
    if (!my_strcmp(my_sh->cmd, "setenv") || !my_strcmp(my_sh->cmd, "env"))
        return print_env(*envi);
    move_pointer(&my_sh->cmd, ' ');
    if (!my_strcmp(cmd_parse, "setenv"))
        return get_setenv(my_sh, *envi);
    if (!my_strcmp(cmd_parse, "unsetenv"))
        return get_unsetenv(my_sh, envi);
    free(cmd_parse);
    my_sh->cmd = my_strdup(cmd_save_for_env);
    free(cmd_save_for_env);
    return 0;
}
