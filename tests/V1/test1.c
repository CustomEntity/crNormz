/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test1
*/

enum arch {
    I386 = 0,
    X86_64,
    ARM,
    ARM64,
    SPARC,
    POWERPc,
};

typedef struct stat {
    enum arch arch;
    char *name;
    char *version;
    char *date;
    char *author;
    char *comment;
} stat_s;

int main(void)
{
    return 0;
}
