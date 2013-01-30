/*
 * =====================================================================================
 *
 *       Filename:  syscall.c
 *    Description:  System Call Overhead
 *
 * =====================================================================================
 */


#include	<stdio.h> 
#include	<stdlib.h>
#include	<math.h>
#include	<time.h>
#include	"tick.h"

#define	LOOP_SIZE_INNER 1e6
#define LOOP_SIZE_OUTER 100

int main ( int argc, char *argv[] )
{
	tick_init();
	uint64 tick1, tick2, diff;
	
	int i;
	for (i = 0; i < 100; i++)
	{
		tick(tick1);
		time(NULL);
		tick(tick2);

		printf("%llu\n", tick_diff(tick1, tick2));
	}

	/*int i, j;
	double sum = 0, sqSum = 0;
	
	for (i = 0; i < LOOP_SIZE_OUTER; i++)
	{
		tick(tick1);
		for (j = 0; j < LOOP_SIZE_INNER; j++)
		{
			time(NULL);	
		}
		tick(tick2);
		diff = tick_diff_loop(tick1, tick2, LOOP_SIZE_INNER);
		sum += diff;
		sqSum += diff * diff;
	}

	sum /= LOOP_SIZE_INNER;
	sqSum = sqSum / LOOP_SIZE_INNER / LOOP_SIZE_INNER;
	print_stat(sum, sqSum, LOOP_SIZE_OUTER);	
	*/

	return 0;
}		

