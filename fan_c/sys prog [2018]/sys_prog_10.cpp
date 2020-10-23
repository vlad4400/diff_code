#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <sys/neutrino.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>

int chid;
void *server(void *) {
	printf(".:SERVER:.\n");
	int rcvd;
	char receive_buf[255];
	chid = ChannelCreate(0);
	rcvd=MsgReceive(chid, &receive_buf, sizeof(receive_buf), NULL);
	printf ("Server thread: message <%s> has received \n", receive_buf);
	unsigned int k=0, i =0;

	int z = 4;
	int sum = 0;
	for (i=0; receive_buf[i]!='\0'; i++)
	{
		if (receive_buf[i])
		{
			k++;

			if (receive_buf[i] == ' ')
			{
				k--;
				if (k <= z & k != 0)
				{
					sum++;
				}
				k = 0;
			}
		}
	}

	k--;
	if (k <= z & k > 0)
	{
		sum++;
	}

	k = sum;

	MsgReply(rcvd, 1500052, &k, sizeof(k));
	ChannelDestroy(chid);
	pthread_exit(NULL);
}

void *client(void *) {
	printf(".:CLIENT:.\n");
	int coid;
	int status;
	char send_buf[256];
	int k = 0;
	gets(send_buf);
	coid=ConnectAttach(0,getpid(),1,0,0);
	status=MsgSend(coid, &send_buf, sizeof(send_buf), &k, sizeof(k));
	printf ("Client thread: message < Count of words: %d> has received \n", k);
	ConnectDetach(0);
	pthread_exit(NULL);
}

int main(){
		pthread_t server_tid, client_tid;
		pthread_create(&server_tid, NULL, &server, NULL);
		pthread_create(&client_tid, NULL, &client, NULL);
		pthread_join(client_tid, NULL);
		return 0;
}
