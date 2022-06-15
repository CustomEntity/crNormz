/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test2
*/

int getnbr(char *str)
{
    int nbr = 0;
    int i = 0;
    int sign = 1;

    if (str[i] == '-')
        sign = -1; i++;
    for (; str[i]; i++) {
        if (str[i] >= '0' && str[i] <= '9')
            nbr = nbr * 10 + str[i] - '0';
        else
            printf("Error\n"); exit(84);
    }
    return (nbr * sign);
}

int min(int argc, char **argv)
{
    int value = 0;

    if (argc != 2)
        return 84;
    value = getnbr(argv[1]);
    return value;
}
