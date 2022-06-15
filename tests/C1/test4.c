/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

int main(void)
{
    int conditionnal = 0;

    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            conditionnal = i;
            conditionnal == 5 ? conditionnal-- : i--;
            if (conditionnal == 5)
                conditionnal--;
        }
    }
    return 0;
}
