#include"shmem.h"                   //описание структуры семафоров и памяти

FILE *fd;                                    //дескриптор файла результатов
int i;                                                            //счетчик
float sum=0;                                                  //сумма чисел
mem_sh *memptr;                 //указатель на структуру разделяемой памяти
key_t key;                                        //ключ доступа к семафору
int shmid;                                  //дескриптор разделяемой памяти
int semid;                                            //дескриптор семафора

int main(void)
{
  printf("\n\t\t.:SERVER:.\n");
  key=ftok("sem",'A');                          //получаем ключ для сервера
  shmid=shmget(key,100,IPC_CREAT|PERM); //получаем деск. разделяемой памяти
  memptr=(mem_sh*) shmat (shmid,0,0);//присоединяем память к памяти сервера
  semid=semget(key,1,IPC_CREAT|PERM);    //получаем деск. семафоров сервера
  semop(semid,&mem_trylock[0],1);        //пытаемся опустить семафор памяти
                                 //(пытаемся заблокировать доступ к памяти)
  if ((fd=fopen("result.txt","w"))==NULL)        //создаём файл результатов
  {perror("\n\tError (server - fopen)\n");return 0;}
  printf("\n\tOpen(Create) result file\n");
  for(i=0;i<6;i++) sum=sum+memptr->cord[i];    //читаем содержимое памяти и
  printf("\tResult = %f\n",sum);                        //накапливаем сумму
  if ((fprintf(fd,"Sum=%f \n",sum))<=0)           //записываем сумму в файл
  {perror("\n\tError (server - fprintf)\n");return 0;}
  printf("\tResult has writen to file\n");
  fclose(fd);                      //закрываем дескриптор файла результатов
  shmdt(memptr);                //отсоединяем разделяемую память от сервера
  shmctl(shmid,IPC_RMID,0);                     //удаляем дескриптор памяти
  semctl(semid,0,IPC_RMID);          //удаляем дескриптор семафоров сервера
  return 0;
}
