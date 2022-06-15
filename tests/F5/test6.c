/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test6
*/

typedef struct i_want_coffee_s {
    char *str;
    char *str2;
} i_want_coffee_t;

void change_discussion(i_want_coffee_t i)
{
    i.str2 = "Oww I have a copy....";
    i.str = "If a change anything, nothings will be change...";
}

int main(void)
{
    i_want_coffee_t coffee;

    coffee.str = "Can i have coffee ?";
    coffee.str2 = "No we haven't coffee sry";
    change_discussion(coffee);
}
