/*
 * =====================================================================================
 *
 *       Filename:  while1.c
 *    Description:  
 *
 * =====================================================================================
 */

#include	<stdio.h> 
#include	<stdlib.h>
#include	"tick.h"
#include	<pthread.h>

#define N_THREADS 4

void* while1(void* threadid)
{
	while(1);
}

int main ( int argc, char *argv[] )
{
	pthread_t threads[N_THREADS];
	int t;
	for (t = 0; t < N_THREADS; t++)
	{
		pthread_create(&threads[t], NULL, while1, (void*)&t);
	}

	for (t = 0; t < N_THREADS; t++)
	{
		pthread_join(threads[t], NULL);
	}

	return 0;
}		

	
