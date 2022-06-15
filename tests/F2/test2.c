/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test4
*/

#include <stdio.h>

void precise_named(char *str, char *str2)
{
    int i = 0;

    while (str[i] != '\0') {
        if (str[i] == str2[0])
            printf("%d\n", i);
        i++;
    }
}

void pstr(char *str)
{
    int i = 0;

    while (str[i] != '\0') {
        printf("%c", str[i]);
        i++;
    }
    printf("\n");
}

void JeSuisUneFonction_en_camelCase(char *str)
{
    for (int i = 0; str[i]; i++)
        if (str[i] == ' ')
            pstr("il y a un espace je reconnais");
}

void flavioTest(char *str, char *str2)
{
    precise_named(str, str2);
    JeSuisUneFonction_en_camelCase(str2);
}

int main(void)
{
    flavioTest("je_suis_un_fake", "je_suis_un_fake");
    return 0;
}
