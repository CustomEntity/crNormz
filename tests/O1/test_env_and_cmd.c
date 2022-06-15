/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** parse_string_for_env
*/

#include "my.h"

int check_error_file_redirection(char *file, struct stat sb, int i)
{
    if (file[0] == '\0') {
        my_printf("Missing name for redirect.\n");
        return 1;
    }
    if (sb.st_mode & S_IFDIR) {
        my_printf("%s: Is a directory.\n", file);
        return 1;
    }
    if (access(file, W_OK) && i >= 0) {
        my_printf("%s: Permission denied.\n", file);
        return 1;
    }
    return 0;
}

int check_cmd(char *cmd, my_sh_t *mysh, int nb)
{
    char *file = fill_in(my_strlen(cmd));
    char *copie = NULL;
    int i = 0;
    struct stat sb = { 0 };

    for (; nb != 0; i++)
        if (cmd[i] == '>')
            nb--;
    if (cmd[i])
        i++;
    for (int a = 0; cmd[i]; i++)
        if (cmd[i] != ' ')
            file[a++] = cmd[i];
    i = stat(file, &sb);
    return check_error_file_redirection(file, sb, i);
}

bool is_valid_cmd2(int i, my_sh_t *my_sh, int **all, char **copie)
{
    if (my_sh->cmd[i] == '>') {
        for (int a = i; my_sh->cmd[a] && my_sh->cmd[a] != ';';)
            (*copie)[(*all[0])++] = my_sh->cmd[a++];
        *all[0] = 0;
        *all[1] = 1;
        if (my_sh->cmd[i + 1] == '>')
            *all[1] = 2;
        if (check_cmd((*copie), my_sh, *all[1]))
            return false;
        (*copie) = destroy_string((*copie));
        return true;
    }
    return true;
}

bool is_valid_cmd(my_sh_t *my_sh)
{
    char *copie = fill_in(my_strlen(my_sh->cmd));
    int e = 0;
    int r = 0;

    if (!check_separateur(my_sh->cmd))
        return true;
    for (int i = 0; my_sh->cmd[i]; i++) {
        if (!is_valid_cmd2(i, my_sh, (int *[2]){&e, &r}, &copie))
            return false;
        if (my_sh->cmd[i] != '>')
            copie[e++] = my_sh->cmd[i];
    }
    return true;
}

char *parse_string(char **str)
{
    char *key = fill_in(my_strlen((*str)));

    for (; (*str)[0] == ' '; (*str)++);
    for (int i = 0; (*str)[0] && (*str)[0] != ' '; i++, (*str)++)
        key[i] = (*str)[0];
    if ((*str)[0] == ' ')
        (*str)++;
    return key;
}
