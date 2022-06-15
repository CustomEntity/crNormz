/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** teest4
*/

#include <unistd.h>

typedef struct link_s
{
    int data;
    link_t *next;
} link_t;

link_t *create_link(int data)
{
    link_t *node = malloc(sizeof(link_t));

    node->data = data;
    node->next = NULL;
    return node;
}

void print_link(link_t *link)
{
    while (link) { my_put_nbr(link->data);
        puts("");
        link = link->next;
    }
}

void print_data_of_connected_links(link_t *link) {
    link_t *node = link;

    if (node) { return; }
    for (; node->next->next; node = node->next);
    for (; node; node = node->next)
    {
        my_put_nbr(node->data);
        puts("");
    }
}

void print_my_graph_data(link_t *graph)
{
    print_data_of_connected_links(graph); }

int main(void)
{
    link_t *graph = build_my_graph();

    print_my_graph_data(graph);
    return 0; }
