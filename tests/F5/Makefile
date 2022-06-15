##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## My makefile
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
	@echo "void my_putchar()"

re: fclean all
