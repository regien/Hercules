NAME = test
CFLAGS = -Wall -Wextra -Werror
CC = gcc
INCLUDES = -Iincludes/

CFILES = main.c
OBJECTS = $(CFILES:.c=.o)

all: $(NAME)

$(NAME):
	@$(CC) $(CFLAGS) $(INCLUDES) -o $(NAME) $(CFILES)

clean:
	@/bin/rm -f $(OBJECTS)

fclean:
	@/bin/rm -f $(OBJECTS) $(NAME)

re: fclean all

.PHONY: all, clean, fclean, re
