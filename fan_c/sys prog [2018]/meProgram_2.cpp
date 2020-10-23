#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <sys/netmgr.h>
#include <sys/neutrino.h>
#include <unistd.h>
#define MY_PULSE_CODE  _PULSE_CODE_MINAVAIL
typedef union
{
	struct _pulse pulse;
}
	my_message_t;
	
void f(sigval) {
	printf("The timer worked"); 
};

int main()
{
	struct 			sigevent event;
	struct 			itimerspec itime;
	timer_t 		timer_id;
	int			chid;
	int			rcvid;
	my_message_t	msg;
	chid = ChannelCreate(0);
	event.sigev_notify = SIGEV_PULSE;
	event.sigev_coid = ConnectAttach(ND_LOCAL_NODE,0,chid,_NTO_SIDE_CHANNEL,0);
	event.sigev_priority = getprio(0);
	event.sigev_code = MY_PULSE_CODE;
	timer_create(CLOCK_REALTIME,&event,&timer_id);
	itime.it_value.tv_sec = 1525219560;
	itime.it_value.tv_nsec = 0;
	timer_settime(timer_id,TIMER_ABSTIME,&itime,NULL);
	
	while (true) { 
		rcvid = MsgReceive(chid,&msg,sizeof(msg),NULL);
		
		if (0 == rcvid) {
			if (MY_PULSE_CODE == msg.pulse.code) { 
				cout<<"The timer worked 2"<<endl;
				return 0;
			}
		}
	}
	
	
	//sleep(30);
return 0;
}

#/** PhEDIT attribute block
#-11:16777215
#0:1029:default:-3:-3:0
#1029:1030:TextFont9a:-3:-3:0
#1030:1078:default:-3:-3:0
#**  PhEDIT attribute block ends (-0000170)**/
