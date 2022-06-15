/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <time.h>
#include <ctype.h>

typedef struct node_s {
    char *value;
    struct node_s *next;
} node_t;

typedef struct fake_s {
    char *str2;
    char *str3;
    char *str4;
    char *str5;
    char *str6;
    char *str7;
    char *str8;
    char *str9;
    char *str10;
    char *str11;
    char *str12;
    char *str13;
    char *str14;
    char *str15;
    char *str16;
    char *str17;
    char *str18;
    char *str19;
    char *str20;
    int *value;
    struct fake_s *next;
} fake_t;

void push_node_at_back(node_t **head, char *value)
{
    node_t *new_node = malloc(sizeof(node_t));
    node_t *tmp = (*head);

    new_node->value = strdup(value);
    new_node->next = NULL;
    if (tmp == NULL) {
        (*head) = new_node;
        return;
    }
    for (; tmp->next != NULL; tmp = tmp->next);
    tmp->next = new_node;
}

int main(int argc, char **argv, char **env)
{
    node_t *envi = NULL;
    node_t *tmp_after = NULL;
    node_t *tmp2 = NULL;

    for (int i = 0; env[i] != NULL; i++)
        push_node_at_back(&envi, env[i]);
    printf("in good order:\n");
    for (node_t *tmp = envi; tmp != NULL; tmp = tmp->next)
        printf("%s\n", tmp->value);
    printf("in bad order:\n");
    tmp_after = envi;
    while (tmp_after != NULL) {
        node_t *tmp3 = tmp_after->next;
        tmp_after->next = tmp2;
        tmp2 = tmp_after;
        tmp_after = tmp3;
    }
    for (node_t *tmp = tmp2; tmp != NULL; tmp = tmp->next)
        printf("%s\n", tmp->value);
    for (node_t *tmp = envi; tmp != NULL; tmp = tmp->next)
        free(tmp->value);
}
