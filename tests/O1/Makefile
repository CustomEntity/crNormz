##
## EPITECH PROJECT, 2021
## Makefile A NATHAN CATALAN ! V : 24-01-22
## File description:
## Makefile for make so fast
##

CC = gcc

AR = ar src

DOSSIER = compil_des_o

CFLAGS  = -W -Wall -Wextra -Werror -Wno-unused -g3

CPPFLAGS = -Iinclude/

LDFLAGS = -lcsfml-graphics -lcsfml-window -lcsfml-system -lcsfml-audio

SRC	= $(wildcard *.c) \
	  $(wildcard lib/*.c) \

OBJ =  $(SRC:.c=.o) \

TARGET = mysh

LAUNCH = # commande à faire

.SILENT: $(OBJ)

all: $(TARGET)

$(TARGET) : $(OBJ)
	@$(CC) -o $(@) $(OBJ) $(LDFLAGS)
	@echo "\033[3;99mCréation du binaire... [$(@)] : ✅\033[0m\n"
	@mkdir  -p $(DOSSIER)
	@echo "\033[1;96mCréation du dossier $(DOSSIER) : ✅\033[0m\n"
	@mv -f $(OBJ) $(DOSSIER)
	@echo "\033[1;94mMooving dans $(DOSSIER): ✅\033[0m\n"

fclean :
	clear
	@$(RM) $(TARGET)
	@rm -rf $(DOSSIER)

re: fclean all

see: $(OBJ) fclean
	clear
	@$(CC) -o $(TARGET) $(OBJ) $(LDFLAGS)
	@echo "\033[6;92mCompilations de :\n\033[1;91m---------------\033[0m"
	@echo "\033[6;93m$(SRC)\033[1;91m---------------\033[0m" | tr ' ' '\n'
	@echo "\033[4;96m$(words $(SRC)) fichiers compilées\033[0m"
	@echo "\033[34m"
	@echo "\033[5;99mCréation du binaire [$(TARGET)] :\033[0m\n"
	@echo "\033[34m"
	@mkdir -p $(DOSSIER)
	@echo "\033[6;95mCréations du dossier [$(DOSSIER)] :\033[0m\n"
	@echo "\033[34m"
	@mv -f $(OBJ) $(DOSSIER)
	@echo "\033[11;94mMooving dans [$(DOSSIER)] : ✅\033[0m\n"

bug:
	clear
	@echo "\033[3;94mCorrection en cours.\033[0m\n"
	@echo "\033[34m"
	@$(RM) $(OBJ)
	@$(RM) $(TARGET)
	@rm -rf $(DOSSIER)
	@echo "\033[4;91mBug corrigé\033[0m\n"

launch: re
	@echo "\033[3;94mLancement de $(TARGE\033[0m\n"
	@./$(LAUNCH)

h:
	clear
	@echo "\033[4;94m\t\t\t\t\t\tCommandes disponible\033[0m"
