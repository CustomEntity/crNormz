/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** getline_and_parsecmd
*/

#include "my.h"

char *copie_cmd(char *cmd)
{
    char *copy = fill_in(my_strlen(cmd));

    for (int i = 0; cmd[i]; i++) {
        if (cmd[i] == ' ')
            break;
        copy[i] = cmd[i];
    }
    return copy;
}

void my_getline(my_sh_t *my_sh)
{
    size_t status = 0;

    if (isatty(0))
        my_printf("%s: ", my_sh->pwd);
    if (getline(&my_sh->cmd, &status, stdin) <= 0)
        exit(0);
}

void parse_cmd(my_sh_t *my_sh)
{
    int a = 0;
    int e = 0;
    my_sh->cmd_parse = alloc2d_array(my_sh->cmd);
    for (int i = 0; my_sh->cmd[i]; i++) {
        if (my_sh->cmd[i] == ' ') {
            e++;
            a = 0;
        } else {
            my_sh->cmd_parse[e][a] = my_sh->cmd[i];
            a++;
        }
    }
    e++;
    my_sh->cmd_parse[e] = NULL;
}
