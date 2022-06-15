/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test1
*/

#include <unistd.h>

int hidden_string(char *str1, char *str2)
{
     int k = 0;

for (int i = 0; str2[i] != '\0'; i++) {
        if (str1[k] == str2[i]) {
                    k++;
        }
        if (str1[k] == '\0') {
                return (1);
         }
    }
    return (0);
}

int main(int ac, char **av)
{
int win = 0;

    if (ac != 3) {
    write(2, "Usage: ./hidenp needle haystack\n", 33);
        return (84);
    }
win = hidden_string(av[1], av[2]);
    if (win == 0) {
    write(1, "0\n", 2);
    } else if (win == 1) {
    write(1, "1\n", 2);
    }
    return (0);
}
