/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test7
*/

typedef struct my_struct_for_normz_s {
    char *str;
    int ******i;
} my_struct_for_normz_t;

void change_all(my_struct_for_normz_t mistroulou, int *a)
{
    (*a) = 84;
    mistroulou.i = (int *****[4]){{{{{44, 9, 9, 9}}}}};
}

int main(void)
{
    int a = 0;
    my_struct_for_normz_t mistrou;

    mistrou.i = (int *****[4]){{{{0, 4, 5, 6}}}};
    mistrou.str = "yo les boyssssss";
    return mistrou.i[0][0][0][0][0][1];
}
