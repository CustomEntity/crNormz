/*
** EPITECH PROJECT, 2022
** B-PSU-210-MPL-2-1-minishell2-nathan.catalan
** File description:
** error_pipe
*/

#include "my.h"

void before_after_pipe(char *cmd, int index, error_pipe *error)
{
    error->before = fill_in(my_strlen(cmd));
    error->after = fill_in(my_strlen(cmd));

    index--;
    for (; index > -1 && (cmd[index] != ';' && cmd[index] != '|'); index--);
    index++;
    for (int i = 0; cmd[index + 1] != '|'; index++)
            error->before[i++] = cmd[index];
    index += 3;
    for (int i = 0; cmd[index] && cmd[index] != ';' && cmd[index] != '|';)
            error->after[i++] = cmd[index++];
}

bool check_pipe_error(char *cmd, int i, error_pipe *error)
{
    before_after_pipe(cmd, i, error);
    if (error->before[0] == '\0' || error->after[0] == '\0')
        return true;
    return false;
}

bool is_valid_pipe(my_sh_t *my_sh)
{
    error_pipe error;
    int a = 0;

    for (int i = 0; my_sh->cmd[i]; i++)
        if (my_sh->cmd[i] == '|' && check_pipe_error(my_sh->cmd, i, &error)) {
            my_putstr("Invalid null command.\n");
            return false;
        }
    return true;
}
