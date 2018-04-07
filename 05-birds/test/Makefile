NAME = test
CFLAGS = -Wall -Wextra -Werror
CC = gcc
INCLUDES = includes/

CFILES = main.c
OBJECTS = $(CFILES:.c=.o)

all: $(NAME)

$(NAME):
	@$(CC) $(CFLAGS) -I$(INCLUDES) -o $(NAME) $(CFILES)

clean:
	@/bin/rm -f $(OBJECTS)

fclean:
	@/bin/rm -f $(OBJECTS) $(NAME)

re: fclean all

.PHONY: all, clean, fclean, re
