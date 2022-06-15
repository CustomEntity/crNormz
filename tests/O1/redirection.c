/*
** EPITECH PROJECT, 2022
** B-PSU-210-MPL-2-1-minishell2-nathan.catalan
** File description:
** redirection
*/

#include "my.h"

int check_redirection(char *cmd)
{
    for (int i = 0; cmd[i]; i++)
        if (cmd[i] == '>' || cmd[i] == '<')
            return true;
    return false;
}

int cpt_redirection(char *cmd)
{
    for (int i = 0; cmd[i]; i++) {
        if (cmd[i] == '>' && cmd[i + 1] == '>')
            return (2);
        if (cmd[i] == '>')
            return (1);
        if (cmd[i] == '<' && cmd[i + 1] == '<')
            return (4);
        if (cmd[i] == '<')
            return (3);
    }
    return 123456789;
}

char *cmd_before_redirect(char *cmd)
{
    char *before = fill_in(my_strlen(cmd));
    int i = 0;

    for (; cmd[i]; i++) {
        if (cmd[i] != '>' && cmd[i] != '<')
            before[i] = cmd[i];
        else
            break;
    }
    if (before[--i] == ' ')
        before[i] = '\0';
    return before;
}

char *file_for_redicretion(char *cmd)
{
    int i = 0;
    char *str = fill_in(my_strlen(cmd));

    for (; cmd[i]; i++)
        if (cmd[i] == '>')
            break;
    i++;
    if (cmd[++i] == '>')
        i++;
    cmd[i + 1] == ' ' ? i++ : i;
    for (int a = 0; cmd[i]; i++, a++)
        str[a] = cmd[i];
    return str;
}

int redirection_flag(my_sh_t *my_sh, env_t *envi)
{
    char *cmd_before = NULL;
    int nb_redirect = 0;
    char *file = NULL;

    if (!check_redirection(my_sh->cmd))
        return false;
    cmd_before = cmd_before_redirect(my_sh->cmd);
    nb_redirect = cpt_redirection(my_sh->cmd);
    file = file_for_redicretion(my_sh->cmd);
    redirect_in_file(cmd_before, nb_redirect, file, my_sh);
    return true;
}
