# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gmalpart <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/03 19:55:57 by gmalpart          #+#    #+#              #
#    Updated: 2018/03/03 20:22:10 by gmalpart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = hydra_server
MAKE = make -C
LIB = libft/
CFLAGS = -Wall -Wextra -Werror
CC = gcc
CFILES =	libft/libft.a \
			hydra.c

LIBM = $(MAKE) $(LIB) re
LIBC = $(MAKE) $(LIB) clean
LIBF = $(MAKE) $(LIB) fclean
OBJECTS = $(CFILES:.c=.o)

all : $(NAME)

$(NAME):
	$(LIBM)
	$(CC) $(CFLAGS) -Ilibft -o $(NAME) $(CFILES)

clean:
	$(LIBC)
	@/bin/rm -f $(OBJECTS)

fclean:
	@$(LIBF)
	@/bin/rm -f $(OBJECTS) $(NAME)

re: fclean all

test:
	@echo "In order to test this shit you don't really need a client\n"
	@echo "--------- MAGIC ----------\n"
	@echo "nc localhost port < pinginamessage.txt"
	@echo "       |\n"
	@echo "       ^ Also 127.0.0.1\n"
	@echo "or echo ping  | nc localhost port\n"

.PHONY: all, clean, fclean, re
