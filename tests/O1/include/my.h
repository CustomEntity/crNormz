/*
** EPITECH PROJECT, 2022
** Makedossier
** File description:
** my
*/

#ifndef MY_H_
    #define MY_H_

    #include <stdarg.h>
    #include <stdio.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <unistd.h>
    #include <assert.h>
    #include <string.h>
    #include <dirent.h>
    #include <stdlib.h>
    #include <pwd.h>
    #include <time.h>
    #include <errno.h>
    #include <ncurses.h>
    #include <fcntl.h>
    #include <signal.h>
    #include <wait.h>

typedef struct my_sh_s {
    char *pwd;
    int status;
    int exit_value;
    char **path;
    char *home;
    char *cmd;
    char **cmd_parse;
    char **env;
    char *old_pwd;
    int fd_to_write;
    int fd_to_read;
} my_sh_t;

typedef struct env_s {
    char *key;
    char *value;
    struct env_s *next;
} env_t;

typedef struct error_pipe_s {
    char *before;
    char *after;
} error_pipe;

void my_putstr_error(char *str);

void my_printf(char *str, ...);

void my_putchar(char c);

void my_putstr(char *str);

void my_put_nbr(int nb);

int my_getnbr(char const *str);

int my_strlen(char const *str);

int my_strcmp(char const *s1, char const *s2);

int my_strncmp(char const *s1, char const *s2, int n);

char *my_strcpy(char *dest, char const *src);

char *my_strncpy(char *dest , char const *src, int n);

char *my_strcat(char *dest, char const *str);

char *my_strncat(char *dest , char const *src , int nb);

char *fill_in(int size);

char *destroy_string(char *str);

char *my_strdup(char const *src);

env_t *init_env(char **env);

my_sh_t *init_struct(env_t *envi, char **env);

void free_all(my_sh_t *my_sh, env_t *envi);

char **alloc2d_array(char *str);

void parse_cmd(my_sh_t *my_sh);

void my_getline(my_sh_t *my_sh);

char **set_env(env_t *envi);

char *copie_cmd(char *cmd);

void parse_n(my_sh_t *my_sh);

void exec(char *cmd, char **args, char **env);

void cd_flag(my_sh_t *my_sh, env_t *envi);

void push_node_at_end_of_list(env_t **list, char *value, char *key);

int env_flag(my_sh_t *my_sh, env_t **envi);

void move_pointer(char **str, char caractere_to_stop);

int is_valid(char c);

char *parse_string(char **str);

int get_setenv(my_sh_t *my_sh, env_t *envi);

char *parse_home(env_t *envi);

char **parse_cmd_in_2d(char *str);

int executor_file(my_sh_t *my_sh, env_t *envi);

int test_pointeur(my_sh_t *my_sh);

int exit_flag(my_sh_t *my_sh, env_t *envi);

void check_flag(my_sh_t *my_sh, env_t **envi);

void execute_separateur(my_sh_t *my_sh, env_t **envi);

int check_separateur(char *str);

int check_cmd(char *cmd, my_sh_t *mysh, int nb);

bool is_valid_cmd(my_sh_t *my_sh);

int print_env(env_t *envi);

int check_cmd(char *cmd, my_sh_t *mysh, int nb);

void redirect_in_file(char *str, int nb_redirect, char *file, my_sh_t *my_sh);

int redirection_flag(my_sh_t *my_sh, env_t *envi);

int check_redirection(char *cmd);

bool is_valid_pipe(my_sh_t *my_sh);

void before_after_pipe(char *cmd, int index, error_pipe *error);

int pipe_flag(my_sh_t *my_sh, env_t **envie);

#endif /* !MY_H_ */
