/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

int re_(void)
{
    return 5;
}

int return___fonction(void)
{
    return (0);
}

void tester_en_Or(int *u)
{
    int i = 0;

    for (; i < 100; i++);
    (*u) == i ? re_() : i++;
}

int main(void)
{
    int i = return___fonction();

    if (i == 0)
        tester_en_Or(&i);
    puts("Gets le nombre de fautes PAWWWWWW !");
    return i;
}
