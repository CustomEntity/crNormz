/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

void my_function(int *value)
{
    (*value) = 42;
    for (int i = 0; i < value; i++) {
        for (int a = 0; a < i; a++) {
            if (a == i)
                break;
            else if (a == i)
                continue;
            else
                a++;
        }
    }
}

int main(void)
{
    int j = 0;

    my_function(&j);
    return 0;
}
