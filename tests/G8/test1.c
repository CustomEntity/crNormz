/*
** EPITECH PROJECT, 2022
** oui_je_suis_le_bon
** File description:
** frenchname
*/

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

void my_putchar(char c)
{
    write(1, &c, 1); 
}

void follow_name(char const *str, int i)
{
    for (; str[i] != '\0'; i++) { 
        if ((str[i] >= 'a' && str[i] <= 'z') &&
            str[i] != ' ') { 
            my_putchar(str[i] - 32);
        } else {
            my_putchar(str[i]); 
        }
    }
}

int main(int argc, char **argv) 
{ 
    if (argc != 2 || argv == NULL) {
        if (write(2, "Usage: frenchNameFormatter string", 33) != 33) {
            return 84; 
        } else { 
            return 84;
        } 
    } else {
        make_french_name(argv[1]);
    }
    write(1, "\n", 1); 
    return 0;
}
