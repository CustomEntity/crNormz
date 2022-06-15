/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test1
*/

int return_84(void)
{
    return 84;
}

int my_return_value(int a)
{
    int value = return_84();

    return a * value;
}

void move_pointer(char * str)
{
    * str++;
    *str--;
}

int main(int argc)
{
    char* str;

    if (argc != 3)
        return 84;
    move_pointer(str);
    return my_return_value(argc);
}
