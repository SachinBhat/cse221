/*
 * =====================================================================================
 *
 *       Filename:  rdtsc.c
 *    Description:  Test functionality of RDTSC instruction
 *
 * =====================================================================================
 */

#include	<stdio.h> 
#include	<stdlib.h>
#include	<unistd.h>
#include	<math.h>
#include	"tick.h"

#define LOOP_SIZE 1000

int main ( int argc, char *argv[] )
{
	uint64 tick1, tick2, tickDiff;

	tick_init();
	
	printf("Time Measurement Overhead: %llu\n", tick_overhead);

	double sum = 0, sqSum = 0;
	int i;
	for (i = 0; i < LOOP_SIZE; i++)
	{
		tick(tick1);

		//usleep(1000);
		//sleep(1);

		tick(tick2);

		tickDiff = tick2 - tick1;
		
		sum += tickDiff;
		sqSum += tickDiff * tickDiff;
	}
	
	//printf("tick: %llu\n", tick2 - tick1);
	//printf("time: %f\n", tick_time(tick1, tick2));
	
	//double avg = sum / (double)LOOP_SIZE;
	//printf("avg=%f, var=%f\n", avg, sqSum / (double)LOOP_SIZE - avg * avg);
	print_stat(sum, sqSum, LOOP_SIZE);	
		
	return 0;
}

