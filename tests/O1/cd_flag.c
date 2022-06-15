/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** cd_flag
*/

#include "my.h"

int check_nb_space(char *str)
{
    int nb = 0;

    for (int i = 0; str[i]; i++)
        if (str[i] == ' ')
            nb++;
    if (nb > 1) {
        my_printf("cd: Too many arguments.\n");
        return 1;
    }
    return 0;
}

void cd_flag2(my_sh_t *my_sh, env_t *envi)
{
    char *str = NULL;

    if (opendir(my_sh->cmd) != NULL) {
        my_sh->old_pwd = getcwd(my_sh->old_pwd, 1024);
        chdir(my_sh->cmd);
        return;
    }
    if (!my_strcmp(my_sh->cmd, "-")) {
        if (my_sh->old_pwd[0] == '\0') {
            my_printf(": No such file or directory.\n");
            return;
        }
        str = my_strdup(getcwd(str, 1024));
        chdir(my_sh->old_pwd);
        my_sh->old_pwd = my_strdup(str);
        return;
    }
    my_printf("%e%e%e%e", my_sh->cmd, ": ", strerror(errno), ".\n");
}

void cd_flag(my_sh_t *my_sh, env_t *envi)
{
    int a = 0;

    if (check_nb_space(my_sh->cmd))
        return;
    if (!my_strcmp(my_sh->cmd, "cd") || !my_strcmp(my_sh->cmd, "cd ~")) {
        my_sh->old_pwd = getcwd(my_sh->old_pwd, 1024);
        chdir(my_sh->home);
        return;
    }
    for (; *my_sh->cmd != ' '; my_sh->cmd++);
    my_sh->cmd++;
    cd_flag2(my_sh, envi);
}
