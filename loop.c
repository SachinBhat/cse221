/*
 * =====================================================================================
 *
 *       Filename:  loop.c
 *    Description:  Find the loop overhead
 *
 * =====================================================================================
 */


#include	<stdio.h> 
#include	<stdlib.h>
#include	"tick.h"

void testLoop(unsigned int* tests, int testCount)
{
	FILE* fp = fopen("loop.out", "w");
	fprintf(fp, "loop_size,tick,time\n");

	int i,j;
	for (i = 0; i < testCount; i++)
	{
		tick_init();
		uint64 tick1, tick2;
		
		tick(tick1);
		for (j = 0; j < tests[i]; j++);
		tick(tick2);

		fprintf(fp, "%d,%llu,%f\n", tests[i], tick_diff(tick1, tick2), tick_time(tick1, tick2));
	}

	fclose(fp);
}

int main ( int argc, char *argv[] )
{
	//Experiment about context switch
	unsigned int tests1[] = {1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9, 2e9};
	const int testCount1 = 10;

	unsigned int tests2[] = {1e6, 2e6, 3e6, 4e6, 5e6, 6e6, 7e6, 8e6, 9e6, 10e6};
	const int testCount2 = 10;

	const int testCount3 = 1000;
	unsigned int tests3[testCount3];
	int i;
	for (i = 0; i < testCount3; i++)
	{
		tests3[i] = (int)(rand() / (double)RAND_MAX * 4.0e6) + 1e6;
	}
	
	testLoop(tests3, testCount3);
	
	return 0;
}		

