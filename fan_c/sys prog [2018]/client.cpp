#include"shmem.h"                   //описание структуры семафоров и памяти
FILE *fd;                                         //дескриптор файла данных
int i;                                                            //счётчик
float mas[6];                          //массив из шести вещественных чисел
mem_sh *memptr;                   //указатель на область разделяемой памяти
key_t key;                                                  //ключ семафора
int shmid;                                  //дескриптор разделяемой памяти
int semid;                                            //дескриптор семафора

int main(void)
{
  printf("\n\t\t.:CLIENT:.\n");
  key=ftok("sem",'A');                                      //получаем ключ
  shmid=shmget(key,100,PERM);      //получаем дескриптор разделяемой памяти
  memptr=(mem_sh*) shmat (shmid,0,0);//присоединяем память к памяти клиента
  semid=semget(key,1,PERM);   //получаем деск. набора семафоров для сервера
  if ((fd=fopen("data.txt","r+"))==NULL)        //открываем файл для чтения
  {perror("\n\tError (client - fopen)\n");return 0;}
  printf("\n\tOpen data file\n");
  while ((fscanf(fd,"%f %f %f %f %f %f ",&mas[0],&mas[1],    //читаем числа
  &mas[2],&mas[3],&mas[4],&mas[5]))!=EOF)             //пока не конец файла
  {
    printf("\tContent of data file:\n");
    printf("\t%f %f %f %f %f %f\n",mas[0],mas[1],mas[2],mas[3],mas[4],mas[5]);
    for (i=0;i<6;i++) memptr->cord[i]=mas[i];      //заносим числа в массив
  }                      //структуры которая находится в разделяемой памяти
  semop(semid,&mem_unlock[0],1);          //разблокируем память для сервера
  shmdt(memptr);         //отсоединяем разделяемую память от памяти клиента
  shmctl(shmid,IPC_RMID,0);       //закрываем дескриптор разделяемой памяти
  semctl(semid,0,IPC_RMID);                 //закрываем дескриптор семафора
  fclose(fd);                           //закрываем дескриптор файла данных
  return 0;
}
