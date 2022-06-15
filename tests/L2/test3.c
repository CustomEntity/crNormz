/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test3
*/

int search_string(char *str1, char *str2)
{
    for (int i = 0; str1[i]; i++)
    str1[i] == str2[0] ? str2++ : 0;
    if (!*str2) {
    printf("Find !\n");
         return 1;
    }
     printf("Not find !\n");
      return 0;
}

int main(int argc, char **argv)
{
if (argc != 3)
        return 84;
return search_string(argv[1], argv[2]);
}
