##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## My makefielmeeeleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
##

SRC = $(wildcard *.c)

OBJ = $(SRC:.c=.o)

CPPFLAGS = -I./include

CFLAGS = -W -Wall -Wextra -Werror

TARGET = name

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(TARGET)
	@echo "Salut les gens je suis trop content de faire des tests fonctionnels mais bon est-ce que j'ai le choix ?"

re: fclean all
