/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stuff.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: regien <gmalpart@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/02/28 21:47:03 by regien            #+#    #+#             */
/*   Updated: 2018/02/28 21:47:04 by regien           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int				main(int ac, char **av)
{
	char				str[100];
	int					server_fd;
	int					client_fd;
	struct sockaddr_in	servaddr;
	int					port_no;

	if (ac != 2 || (ac == 2 && (atoi(av[1]) < 0 || atoi(av[1]) > 65535)))
	{
		fprintf(stderr, "Enter valid non-privileged port number (1024 - 65535.\n");
		return (-1);
	}
	port_no = atoi(av[1]);
	if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
		return (-1);
	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htons(INADDR_ANY);
	servaddr.sin_port = htons(port_no);
	bind(server_fd, (struct sockaddr *)&servaddr, sizeof(servaddr));
	listen(server_fd, 10);
	client_fd = accept(server_fd, (struct sockaddr*)NULL, NULL);
	while (1)
	{
		bzero(str, 100);
		read(client_fd, str, 100);
		if (!strncmp("ping", str, 4))
			write(client_fd, "pong pong\n", sizeof("pong pong\n"));
	}
	return (0);
}
