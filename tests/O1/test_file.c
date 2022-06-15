/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** test_file
*/

#include "my.h"

char **parse_2d_other(char **array, char *str)
{
    int a = 0;
    int e = 0;

    for (int i = 0; str[i]; i++) {
        if (str[i] == ' ') {
            array[a][e] = '\0';
            a++;
            e = 0;
        } else {
            array[a][e] = str[i];
            e++;
        }
    }
    array[++a] = NULL;
    return array;
}

char **parse_cmd_in_2d_executor(char **array, char *str)
{
    int i = 0;

    for (; str[i]; i++);
    for (; str[i] != '/'; i--);
    i++;
    for (int a = 0; str[i]; i++, a++)
        array[0][a] = str[i];
    array[1] = (void *)'\0';
    return array;
}

char **parse_cmd_in_2d(char *str)
{
    char **array = alloc2d_array(str);

    if (str[0] == '/')
        array = parse_cmd_in_2d_executor(array, str);
    else
        array = parse_2d_other(array, str);
    return array;
}

void test_file(my_sh_t *my_sh, char **cmd_2d, char *cmd)
{
    pid_t action;
    int status = 0;

    action = fork();
    if (action == 0) {
        if (execve(cmd, cmd_2d, my_sh->env) == -1) {
            my_printf("%e%e", cmd, ": Exec format error. "
            "Wrong Architecture.\n");
        }
    } else {
        wait(&status);
        if (WIFSIGNALED(status))
            my_printf("%e%e", "Segmentation fault",
            WCOREDUMP(status) ? " (core dumped)\n" : "\n");
    }
    waitpid(action, &status, 0);
}

int executor_file(my_sh_t *my_sh, env_t *envi)
{
    struct stat sb = { 0 };
    char *copie = copie_cmd(my_sh->cmd);
    char **parse_cmd_2d = parse_cmd_in_2d(my_sh->cmd);

    if (stat(copie, &sb) < 0)
        return 0;
    if (opendir(copie) != NULL) {
        my_printf("%e%e", copie, ": Permission denied.\n");
        return 1;
    }
    if ((sb.st_mode & S_IXUSR))
        test_file(my_sh, parse_cmd_2d, copie);
    else
        my_printf("%e%e", copie, ": Permission denied.\n");
    return 1;
}
