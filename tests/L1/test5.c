/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test5
*/

int return_84(void)
{
    return 84;
}

int my_return_value(int a)
{
    int value = return_84(), a = value;

    return a + value;
}

int main(int argc)
{
    if (argc != 3)
        return 84;
    return my_return_value(argc);
}
