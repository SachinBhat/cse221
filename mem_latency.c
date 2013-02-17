/*
 * =====================================================================================
 *
 *       Filename:  mem_latency.c
 *    Description:  Measure memory read latency
 *
 * =====================================================================================
 */

#include	<stdio.h> 
#include	<stdlib.h>
#include	<math.h>
#include	<memory.h>
#include	"tick.h"

#define LOOP_SIZE_INNER 2000000
#define LOOP_SIZE_OUTER 100
#define DEFAULT_SIZE 256
#define DEFAULT_STRIDE 96

//size, stride in bytes; assuming: size % 8 == 0, stride % 8 == 0
uint64* genPtrList(int size, int stride)
{
	int arrCount = size / 8;
	int arrStep = stride / 8;	
	uint64* res = (uint64*)malloc(size);
	memset(res, 0, size);
	
	int pos = 0, nextPos = 0;
	while(res[pos] == 0) //when res[pos] != 0, all possible positions are filled.
	{
		nextPos = (pos + arrStep) % arrCount;
		res[pos] = (uint64)(res + nextPos);
		pos = nextPos;
	}

	return res;
}

int main ( int argc, char *argv[] )
{
	tick_init();
	uint64 tick1, tick2, diff;
	double sum=0, sqSum=0;

	register uint64* p;
	
	int size, stride;
	if (argc == 3)
	{
		sscanf(argv[1], "%d", &size);
		sscanf(argv[2], "%d", &stride);
	}
	else
	{
		size = DEFAULT_SIZE;
		stride = DEFAULT_STRIDE;
	}
	//printf("%d %d\n", size, stride);

	uint64* data = genPtrList(size, stride);
	int i, j;

	for (i = 0; i < LOOP_SIZE_OUTER; i++)
	{
		p = data;

		tick(tick1);	
		for (j = 0; j < LOOP_SIZE_INNER; j++)
		{
			//check list correctness
			//printf("j=%d, offset=%llu\n", j, (uint64)(p - data));
			p = (uint64*)(*p);
		}	
		tick(tick2);

		diff = tick_diff_loop(tick1, tick2, LOOP_SIZE_INNER);
		sum += diff;
		sqSum += diff * diff;
	}

	sum /= LOOP_SIZE_INNER;
	sqSum = sqSum / LOOP_SIZE_INNER / LOOP_SIZE_INNER;

	printf("%d,%d,", size, stride);
	print_stat_csv(sum, sqSum, LOOP_SIZE_OUTER);

	free(data);
	return 0;
}		

