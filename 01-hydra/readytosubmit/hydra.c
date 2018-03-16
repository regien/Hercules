/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hydra.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: regien <gmalpart@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/01 16:30:19 by regien            #+#    #+#             */
/*   Updated: 2018/03/03 20:24:03 by gmalpart         ###   ########.fr       */
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
#include <libft.h>

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
	unsigned int	clilen;
	int	n;
	struct	sockaddr_in	serv_addr;
	struct	sockaddr_in	cli_addr;
	char	buff[250];


	if (ac != 2)
		print_error("Invalid port, please select one from 1025 to 5000\n");
	if (ft_atoi(av[1]) > 1024 && ft_atoi(av[1]) < 5001)
		portnbr = ft_atoi(av[1]);
	else
		print_error("invalid port number\n");



	socketfd = socket(AF_INET, SOCK_STREAM, 0);
	if (socketfd < 0)
		print_error("ERROR, creating the socket\n");
	else
		ft_putstr("Socket sucessfully created\n");

	ft_bzero((char *) &serv_addr, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	serv_addr.sin_port = htons(portnbr);



	if (bind(socketfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
		print_error("ERROR on binding\n");
	listen(socketfd, 5);
	clilen = sizeof(cli_addr);

	newsocketfd = accept(socketfd, (struct sockaddr *) &cli_addr, &clilen);
	if (newsocketfd < 0)
		print_error("ERROR on accept\n");
	else
		ft_putstr("Connection ACCEPTED\n");

	ft_bzero(buff, 250);
	n = read(newsocketfd, buff, 250);
	if (n < 0)
		print_error("ERROR reading from socket\n");
	if (!(ft_strncmp(buff, "ping", 4)))
	{
		n = write(newsocketfd, "pong\npong\n", 11);
		if (n < 0)
			print_error("ERROR writing from socket");
	}

	return (0);
}
