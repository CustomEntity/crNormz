/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test4
*/

int main(void)
{
    for (int i = 0; i < 100; i++) {
        for (int a = 0; a < i; a++) {
            a = i++;
            i++;
            a++;
            ++i;
            ++a;
            a = a + 1;
            a += 1;
            i = i + 1;
            i += 1;
            i--;
            --i;
            i = i - 1;
            i -= 1;
            a = a;
            i = i;
            i == i ? i : i;
            ++i == i++ ? i++ : i++;
        }
    }
}
