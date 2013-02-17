/*
 * =====================================================================================
 *
 *       Filename:  create_task.c
 *    Description:  Task creation time
 *
 * =====================================================================================
 */


#include	<stdio.h> 
#include	<stdlib.h>
#include	<math.h>
#include	<unistd.h>
#include	<string.h>
#include	<pthread.h>
#include	"tick.h"

#define FILE_NUM 800000
#define MEM_SIZE 0x7FFFFFFF //2GB
#define LOOP_SIZE 100

FILE* fp[FILE_NUM];
void* mem;

void open_files()
{
	char path[255];
	int i;
	for (i = 0; i < FILE_NUM; i++)
	{
		sprintf(path, "./dummy_files/dummy_%d", i);
		fp[i] = fopen(path, "r");	
		//printf("open %s\n", path);
	}
}

void allocate_mem()
{
	mem = malloc(MEM_SIZE);
}

//Creating process by fork
int main_proc ( int argc, char *argv[] )
{
	int i;
	
	//open_files();
	allocate_mem();

	tick_init();
	uint64 tick1, tick2, diff;
	double sum=0, sqSum=0;

	for (i = 0; i < LOOP_SIZE; i++)
	{
		tick(tick1);
		int pid = fork();
		if (pid == 0) //child
		{
			//printf("Hello from child.\n");
			exit(0);
		}
		else //parent
		{
			//printf("Hello from parent. Child pid = %d\n", pid);
			//pid = wait();
			//printf("Child %d exit.\n", pid);
			tick(tick2);
			diff = tick_diff(tick1, tick2);
			printf("%llu\n", diff);

			sum += diff;
			sqSum += diff * diff;
		}
	}

	//must be parent here
	print_stat(sum, sqSum, LOOP_SIZE);

	return 0;
}		

void* thread_worker(void* arg)
{
	//printf("Hello from thread.\n");
	pthread_exit(0);
}

//Creating kernel-supported thread by pthread lib
int main ( int argc, char *argv[] )
{
	int i;
	pthread_t thread;
	
	//open_files();
	allocate_mem();

	tick_init();
	uint64 tick1, tick2, diff;
	double sum, sqSum;

	//Eliminate the first result
	pthread_create(&thread, NULL, thread_worker, NULL);

	for (i = 0; i < LOOP_SIZE; i++)
	{
		tick(tick1);
		pthread_create(&thread, NULL, thread_worker, NULL);
		tick(tick2);
		diff = tick_diff(tick1, tick2);
		//printf("%llu\n", tick_diff(tick1, tick2));
		
		sum += diff;
		sqSum += diff * diff;

		pthread_join(thread, NULL);
	}

	print_stat(sum, sqSum, LOOP_SIZE);


	return 0;

}
