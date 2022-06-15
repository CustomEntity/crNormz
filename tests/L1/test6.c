/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test6
*/

void my_function(int a, int b)
{
    int c;

    a > b ? (c = a = ++b) : (c = b = ++a);
    return (c = a + b);
}

int main(void)
{
    int a = 8, b = 0;

    my_function(a, b);
}
