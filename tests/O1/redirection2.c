/*
** EPITECH PROJECT, 2022
** B-PSU-210-MPL-2-1-minishell2-nathan.catalan
** File description:
** redirection2
*/

#include "my.h"

void double_right(char *str, char *file, my_sh_t *my_sh)
{
    int fd = open(file, O_WRONLY | O_APPEND);
    int init = dup(1);
    char *copie = copie_cmd(str);

    dup2(fd, 1);
    for (int i = 0; my_sh->path[i] != NULL; i++)
        if (!access(my_strcat(my_sh->path[i], copie), F_OK)) {
            exec(my_sh->path[i], parse_cmd_in_2d(str), my_sh->env);
            break;
        }
    dup2(init, 1);
    close(fd);
}

void simple_right(char *str, char *file, my_sh_t *my_sh)
{
    int fd = open(file, O_CREAT | O_WRONLY | O_TRUNC, 0644);
    int init = dup(1);
    char *copie = copie_cmd(str);

    dup2(fd, 1);
    for (int i = 0; my_sh->path[i] != NULL; i++)
        if (!access(my_strcat(my_sh->path[i], copie), F_OK)) {
            exec(my_sh->path[i], parse_cmd_in_2d(str), my_sh->env);
            break;
        }
    dup2(init, 1);
    close(fd);
}

void redirect_in_file(char *str, int nb_redirect, char *file, my_sh_t *my_sh)
{
    if (nb_redirect == 1)
        return simple_right(str, file, my_sh);
    if (nb_redirect == 2)
        return double_right(str, file, my_sh);
}
