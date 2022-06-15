/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test5
*/

int my_increment(int *a, int *b, int *c, int *d, int *e)
{
    (*a) = 88;
    (*b) = 77;
    (*c) = 66;
    (*d) = 55;
    (*e) = 44;

    return 00;
}

int main(void)
{
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;

    my_increment(&a, &b, &c, d, &e);
}
