#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <atomic.h>
#include <semaphore.h>
#include <time.h>

int * mas = new int[100];
int *A = new int[100];
int *a = new int;
int count, N,M, step;
pthread_rwlock_t rwblock;

void *first_pthread(void *p) {
  pthread_rwlock_wrlock(&rwblock);
  printf("\n FIRST THREAD");
  srand(time(NULL));
  step = rand() %10;
  printf("\n%d Left: ", step);
  for ( count =0; count<N; count++)
    A[count]=mas[count];
  M=N;
  while(step!=0){
    N=M;
    *a=A[0];
    for(count =0; count<N-1; count++)
      A[count]=A[count+1];
    A[N-1]=*a;
    step--;
  }
  printf("Massiv : [");

  for (count = 0; count<M; count++)
    printf("%d ", A[count]);
  printf("[");
  pthread_rwlock_unlock(&rwblock);
  return 0;
}

void *second_pthread(void *p){
  pthread_rwlock_wrlock(&rwblock);
  printf("\nSECOND THREAD");
  srand(time(NULL));
  step = rand() %15-1;
  printf("\n%d Right: ", step);
  for ( count =0; count<N; count++)
    A[count]=mas[count];
  M=N;
  while(step!=0){
  N=M;
  *a=A[N-1];
  for(count =0;count<=N;N--)
    A[N-1]=A[N-2];
  A[0]=*a;
  step--;
}
printf("Massiv : [");
for (count = 0; count<M; count++)
  printf("%d ",A[count]);
printf("]");
pthread_rwlock_unlock(&rwblock);
return 0;
}

int main(int arge, char *argv[]){
  printf("Hello user!!!\nSize of massiv : ");
  scanf(" %d",&N);
  for (count = 0; count<N; count++)
    scanf(" %d",&mas[count]);
  printf("C Massiv : [");
  for (count = 0; count<N; count++)
    printf(" %d ",mas[count]);
  printf("]");
  int i=0;
  pthread_create(NULL, NULL, &first_pthread, (void*)i);
  pthread_create(NULL, NULL, &second_pthread, (void*)i);
  delay(1);
  pthread_rwlock_destroy(&rwblock);
  printf("\n");
  return 0;
}
