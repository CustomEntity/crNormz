/*
** EPITECH PROJECT, 2022
** B-PSU-210-MPL-2-1-minishell2-nathan.catalan
** File description:
** pipe_flag
*/

#include "my.h"

void normes_pipe(int fd[2], my_sh_t *my_sh, env_t **envi, error_pipe error)
{
    pid_t pid = fork();

    if (pid == 0) {
        dup2(fd[1], 1);
        my_sh->cmd = my_strdup(error.before);
        parse_cmd(my_sh);
        close(fd[0]);
        check_flag(my_sh, envi);
        exit(0);
    } else {
        dup2(fd[0], 0);
        close(fd[1]);
        my_sh->cmd = my_strdup(error.after);
        parse_cmd(my_sh);
        check_flag(my_sh, envi);
    }
}

void exec_pipe(my_sh_t *my_sh, env_t **envi, error_pipe error)
{
    int fd[2] = { 0 };

    my_sh->fd_to_write = dup(0);
    my_sh->fd_to_read = dup(1);
    pipe(fd);
    normes_pipe(fd, my_sh, envi, error);
    dup2(my_sh->fd_to_read, 1);
    dup2(my_sh->fd_to_write, 0);
}

int pipe_flag(my_sh_t *my_sh, env_t **envie)
{
    error_pipe error;

    for (int i = 0; my_sh->cmd[i]; i++) {
        if (my_sh->cmd[i] == '|') {
            before_after_pipe(my_sh->cmd, i, &error);
            exec_pipe(my_sh, envie, error);
            return (int)(true);
        }
    }
    return (int)(false);
}
