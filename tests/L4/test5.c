/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test5
*/

#include <SFML/Graphics.h>
#include <stdlib.h>

int main(void)
{
    sfVideoMode mode = {1200, 600, 32};
    sfRenderWindow *window = sfRenderWindow_create
        (mode, "Windows", sfResize | sfClose, NULL);
    sfTexture *texture = sfTexture_createFromFile("image.png", NULL);
    sfSprite *sprite = sfSprite_create();
    sfEvent event;

    sfSprite_setTexture(sprite, texture, sfTrue);
    while (sfRenderWindow_isOpen(window))
    {
        while(sfRenderWindow_pollEvent(window, &event)) {
        }
        sfRenderWindow_clear(window, sfBlack);
        sfRenderWindow_drawSprite(window, sprite, NULL);
        sfRenderWindow_display(window);
    }
    sfSprite_destroy(sprite);
    sfTexture_destroy(texture);
    sfRenderWindow_destroy(window);
}
