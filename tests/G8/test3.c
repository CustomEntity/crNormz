/*
** EPITECH PROJECT, 2021
** main
** File description:
** Solo Stumper Makefile
*/

#include <unistd.h> 
#include <stdio.h> 
#include <stdlib.h>  
#include <stdbool.h>   

void algo(char *str)
{
    int cpt_up = 0;
    int cpt_down = 0;

    for (int i = 0; str[i]; i++) {
        if (str[i] >= 'A' && str[i] <= 'Z') {
            cpt_up++;
            cpt_down = 0;
        }
        if (str[i] >= 'a' && str[i] <= 'z') {
            cpt_up = 0;
            cpt_down++;
        }
        if (cpt_up == 4 || cpt_down == 4) {
            write(1, "Invalid\n", 8);
            return;
        }
    }
    write(1, "OK\n", 3);
}

int main(int argc, char **argv)
{
    if (argc != 2)   
        return 84; 
    algo(argv[1]); 
    return 0; 
}
