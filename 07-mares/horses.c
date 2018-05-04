#include <unistd.h>
#include <stdio.h>

/*
** SEND TO ME TO THE BACKGROUND AND DONT RELEASE ME
*/

int main(void)
{
	while (1)
	{
		fork();
		printf("childing horses :D \n");
	}
	return (0);
}
