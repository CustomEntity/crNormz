/*
** EPITECH PROJECT, 2022
** B-PSU-101-MPL-1-1-minishell1-nathan.catalan
** File description:
** init_env
*/

#include "my.h"

env_t *create_node_at_end(char *key, char *value)
{
    env_t *list = malloc(sizeof(env_t));

    if (list == NULL)
        return 0;
    list->key = my_strdup(key);
    list->value = my_strdup(value);
    list->next = NULL;
    return list;
}

void push_node_at_end_of_list(env_t **list, char *value, char *key)
{
    env_t *first = *list;

    if ((*list) == NULL) {
        (*list) = create_node_at_end(key, value);
        return;
    }
    for (; first->next != NULL; first = first->next)
        if (!my_strcmp(key, first->key)) {
            first->value = my_strdup(value);
            return;
        }
    first->next = create_node_at_end(key, value);
}

char *first_parsing(char *envi)
{
    int i = 0;
    char *key = NULL;

    for (; envi[i] != '='; i++);
    key = malloc(i + 1);
    key[i] = '\0';
    for (int a = 0; envi[a] != '='; a++)
        key[a] = envi[a];
    return key;
}

char *second_parsing(char *envi)
{
    int i = 0;
    char *value = NULL;

    for (; envi[i] != '='; i++);
    i++;
    value = fill_in(my_strlen(envi));
    for (int a = 0; envi[i]; i++, a++)
        value[a] = envi[i];
    return value;
}

env_t *init_env(char **env)
{
    env_t *envi = NULL;
    char *key = NULL;
    char *value = NULL;

    for (int i = 0; env[i]; i++) {
        key = first_parsing(env[i]);
        value = second_parsing(env[i]);
        push_node_at_end_of_list(&envi, value, key);
    }
    return envi;
}
