/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test2
*/

int main(void)
{
    int y = 0;
    int res = 0;

    for (int i = 0; i < 10; i++)
        if (i == 5) {
            y = i;
            y == 5 ? y-- : i--;
        }
    while (res < 100) {
        for (int i = 0; i < 100; i++) {
            res += i;
            if (res == 100)
                return (0);
        }
    }
}
