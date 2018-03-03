/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hydra.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: regien <gmalpart@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/01 16:30:19 by regien            #+#    #+#             */
/*   Updated: 2018/03/02 16:35:13 by regien           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>


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
	int	n;
	struct	sockaddr_in	serv_addr;
	struct	sockaddr_in	cli_addr;

	char	buff[250];
	if (ac < 2)
	{
		printf("Invalid port, please select one from 1025 to 5000\n");
		return (0);
	}

	socketfd = socket(AF_INET, SOCK_STREAM, 0);
	if (socketfd < 0)
		print_error("ERROR, creating the socket\n");
	else
		printf("Socket sucessfully created\n");
	
	
	// keep writing
	bzero((char *) &serv_addr, sizeof(serv_addr));

	portnbr = atoi(av[1]);

	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	serv_addr.sin_port = htons(portnbr);

	if (bind(socketfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
	{
		print_error("ERROR on binding\n");
	}
	listen(socketfd, 5);
	clilen = sizeof(cli_addr);
	
	newsocketfd = accept(socketfd, (struct sockaddr *) &cli_addr, &clilen);

	if (newsocketfd < 0)
		print_error("ERROR on accept\n");

	bzero(buff, 250);

	n = read(newsocketfd, buff, 250);

	if (n < 0)
		print_error("ERROR reading from socket\n");
	
	printf("here's the message: %s\n", buff);
	
	n = write(newsocketfd, "i got your message", 18);
	
	if (n < 0)
		print_error("ERROR writing from socket");

//	asd

	return (0);
}
