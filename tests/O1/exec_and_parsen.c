/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** exec_and_parsen
*/

#include "my.h"

void move_pointer(char **str, char caractere_to_stop)
{
    for (int i = 0; (*str)[0] && (*str)[0] != caractere_to_stop; (*str)++);
    if ((*str)[0] == caractere_to_stop)
        (*str)++;
}

void exec(char *cmd, char **args, char **env)
{
    pid_t action = { 0 };
    int status = 0;

    action = fork();
    if (action == 0)
        execve(cmd, args, env);
    waitpid(action, &status, 0);
}

void parse_n(my_sh_t *my_sh)
{
    int i = 0;
    char *stock = fill_in(my_strlen(my_sh->cmd));
    char *new_cmd = fill_in(my_strlen(my_sh->cmd) + my_strlen(my_sh->cmd));

    stock = strtok(my_sh->cmd, " |\t\n");
    while (stock != NULL) {
        my_strcat(my_strcat(new_cmd, stock), " ");
        stock = strtok(NULL, " \t\n");
    }
    for (; new_cmd[i + 1]; i++);
    new_cmd[i] = '\0';
    my_sh->cmd = my_strdup(new_cmd);
}
