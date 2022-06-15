/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test1
*/

int try_to_catch_me(void)
{
    int a = 0;
    int b = 0;

    for (int i = 0; i < 100; i++) {
        a += i;
        b += i;
        for (;;)
            a > b ? a-- : b--;
    }
    return 0;
}

int main(void)
{
    for (int i = 0; i < 10; i++)
        printf("%d\n", i);
    while (1)
        for (;;)
            if (try_to_catch_me() == 0)
                return (0);
    printf("%d\n", 18);
}
