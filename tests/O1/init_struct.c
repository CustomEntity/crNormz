/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** init_struct
*/

#include "my.h"

char **alloc2d_array(char *str)
{
    int size = my_strlen(str);
    char **dd_array = malloc(sizeof(char *) * (size + 1));

    for (int i = 0; i < size ; i++)
        dd_array[i] = fill_in(size);
    dd_array[size] = NULL;
    return dd_array;
}

void fill_2d_env(char ***path, int *a, int *e, char *str)
{
    for (int i = 0; str[i]; i++) {
        if (str[i] == ':') {
            (*path)[*a][*e] = '/';
            (*path)[*a][++(*e)] = '\0';
            (*a)++;
            (*e) = 0;
        } else {
            (*path)[*a][*e] = str[i];
            (*e)++;
        }
    }
}

char **set_env(env_t *envi)
{
    char **path = NULL;
    int a = 0;
    int e = 0;
    env_t *tmp = envi;

    for (;tmp != NULL && my_strcmp(tmp->key, "PATH") != 0; tmp = tmp->next);
    if (tmp == NULL)
        return NULL;
    path = alloc2d_array(tmp->value);
    fill_2d_env(&path, &a, &e, tmp->value);
    if (path[0] != NULL) {
        path[a][e] = '/';
        path[++a] = NULL;
    }
    return path;
}

char *parse_home(env_t *envi)
{
    char *home = NULL;
    env_t *tmp = envi;

    for (; tmp != NULL && my_strcmp(tmp->key, "HOME") != 0; tmp = tmp->next);
    if (tmp == NULL)
        return NULL;
    home = fill_in(my_strlen(tmp->value));
    for (int i = 0; tmp->value[i]; i++)
        home[i] = tmp->value[i];
    return home;
}

my_sh_t *init_struct(env_t *envi, char **env)
{
    my_sh_t *my_sh = malloc(sizeof(my_sh_t));

    my_sh->status = 0;
    my_sh->path = set_env(envi);
    my_sh->pwd = fill_in(1024);
    my_sh->home = parse_home(envi);
    my_sh->cmd = NULL;
    my_sh->cmd_parse = NULL;
    my_sh->env = env;
    my_sh->old_pwd = fill_in(1024);
    my_sh->exit_value = 999;
    return my_sh;
}
