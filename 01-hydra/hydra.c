/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hydra.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: regien <gmalpart@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/01 16:30:19 by regien            #+#    #+#             */
/*   Updated: 2018/03/01 18:44:19 by regien           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>


void	print_error(char *str)
{
	write(2, str, strlen(str));
	exit(-1);
}

int main(int ac, char **av)
{
	int	socketfd;
	int	newsocketfd;
	int	portnbr;
	int	clilen;
	int	i;
	struct	sockaddr_in	serv_addr;
	struct	sockaddr_in	cli_addr;

	char	buff[250];
	if (ac < 2)
	{
		printf("Invalid port, please select one from 1025 to 5000\n");
		return (0);
	}

	socketfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockerfd < 0)
		print_error("ERROR, creating the socket\n");
	else
		printf("Socket sucessfully created\n");


	// keep writing
	bzero((char *) &serv_addr, )
}
