/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test4
*/

#include <stdio.h>

int suite(int nb)
{
    long long int result = 0; 
    long long int premier = 0;   
    long long int deuxieme = 1;   
    long long int tour = 0;    

    while (nb == 1) {
        printf("le résultat est 1");
        return 1;
    }
    while (tour < nb) {
        premier = deuxieme;            
        deuxieme = result;          
        result = premier + deuxieme;              
        tour += 1;                        
    }                     
    printf("le résultat est = %lld\n", result);
    return result;    
}

int main (void)
{ 
    suite(12);
    return 0;  
} 
