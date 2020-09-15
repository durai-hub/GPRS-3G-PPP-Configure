
#include <stdio.h>
#include <termios.h>
//include <file.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>

void main()
{


    struct termios options;
    int fd;
    char buff[16];
    int errno=0,ret=0;

	fd = open("/dev/ttyO1", O_RDWR | O_NOCTTY | O_NDELAY);

	if (fd < 0)
	{
    	printf("Error opening serial port\n");
   		 exit(1);
	}

	bzero(&options, sizeof(options));
	options.c_cflag = B115200 | CS8 | CLOCAL | CREAD | IGNPAR;
	tcflush(fd, TCIFLUSH);
	tcsetattr(fd, TCSANOW, &options);
	


        if (write(fd, "AT\r", strlen("AT\r")) < strlen("AT\r"))
	{
    	printf("Write error - %s \n", strerror(errno));
   		 exit (1);
	}



        ret=read(fd, &buff, sizeof(buff));
	buff[ret]='\0';
	printf("Bytes Read: %d Data : %s\n",ret, buff);
      


	if (ret!=2) {
	               	  printf("read error!\n");close(fd);
		          exit(1); 

	            }
     printf("%c",buff[0]);
     printf("%c",buff[1]);
     printf(" AT command successfully sent ...\n ");
     close(fd);

}
