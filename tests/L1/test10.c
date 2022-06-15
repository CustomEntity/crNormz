/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test10
*/

int main(void)
{
    char *str;

    if ((str = malloc(sizeof(char) * 5)) == (void *)'\0') return (84);
    return (0);
}
