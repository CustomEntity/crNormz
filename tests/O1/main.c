/*
** EPITECH PROJECT, 2022
** Make_fast
** File description:
** main
*/

#include "my.h"

void incrementation_mysh(my_sh_t *my_sh)
{
    my_printf("%e%e", my_sh->cmd, ": Command not found.\n");
    my_sh->status = 1;
}

void check_flag(my_sh_t *my_sh, env_t **envi)
{
    char *copy_cmd = copie_cmd(my_sh->cmd);

    if (pipe_flag(my_sh, envi))
        return;
    if (redirection_flag(my_sh, *envi))
        return;
    if (exit_flag(my_sh, *envi))
        return;
    if (env_flag(my_sh, envi))
        return;
    if (test_pointeur(my_sh))
        return my_printf("%e%e", my_sh->cmd, ": Command not found.\n");
    if (!my_strcmp(copy_cmd, "cd"))
        return cd_flag(my_sh, *envi);
    for (int i = 0; my_sh->path[i] != NULL; i++)
        if (!access(my_strcat(my_sh->path[i], copy_cmd), F_OK))
            return exec(my_sh->path[i], my_sh->cmd_parse, my_sh->env);
    if (executor_file(my_sh, *envi))
        return;
    incrementation_mysh(my_sh);
}

int loop(my_sh_t *my_sh, env_t *envi)
{
    while (my_sh->exit_value) {
        my_sh->path = set_env(envi);
        my_sh->pwd = getcwd(my_sh->pwd, 1024);
        my_sh->home = parse_home(envi);
        my_getline(my_sh);
        parse_n(my_sh);
        if (!is_valid_cmd(my_sh) || !is_valid_pipe(my_sh))
            continue;
        if (check_separateur(my_sh->cmd))
            execute_separateur(my_sh, &envi);
        else {
            parse_cmd(my_sh);
            check_flag(my_sh, &envi);
        }
    }
    if (isatty(0))
        my_putstr("exit\n");
    return 0;
}

int main(int argc, char **argv, char **env)
{
    env_t *envi = init_env(env);
    my_sh_t *my_sh = init_struct(envi, env);

    return loop(my_sh, envi);
}
