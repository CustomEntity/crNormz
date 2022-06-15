/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

int main(void)
{
    int tricky = 0;

    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            tricky = i;
            tricky == 5 ? tricky-- : i--;
            if (tricky == 5)
            tricky == 5 ? tricky-- : i--;
        }
    }
    return 0;
}
