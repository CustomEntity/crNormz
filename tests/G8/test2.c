/*
** EPITECH PROJECT, 2022
** G8
** File description:
** fizzbuzz
*/

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
//                    
void fizzbuzz(int nb_min, int nb_max) 
{ 
    for (; nb_min <= nb_max; nb_min++) {
        if (nb_min % 3 == 0 && nb_min % 5 == 0) {  
            printf("FizzBuzz\n");    
        }
        if (nb_min % 3 == 0 && nb_min % 5 != 0) { 
            printf("Fizz\n"); 
        }        
        if (nb_min % 5 == 0 && nb_min % 3 != 0) {
            printf("Buzz\n");
        }           
        if (nb_min % 3 != 0 && nb_min % 5 != 0) {
            printf("%d\n", nb_min);
        }         
    }        
}         
            
int main(int argc, char **argv)       
{                         
    if (argc != 3) {            
        return 84;      
    }       
    if (atoi(argv[1]) > atoi(argv[2])) {
        write(2, "Error: the second parameter must be \
        greater thanthe first one.\n", 63);
            return 84;
    }                                            
    fizzbuzz(atoi(argv[1]), atoi(argv[2]));  
    return 0;   
}    
