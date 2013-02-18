/*
 * =====================================================================================
 *
 *       Filename:  mem_bandwidth.c
 *    Description:  Measure memory bandwidth
 *
 * =====================================================================================
 */


#include	<stdio.h> 
#include	<stdlib.h>
#include	<math.h>
#include	<memory.h>
#include	"tick.h"

#include	"mem_bandwidth.h"

#define	LOOP_SIZE_OUTER 10

int main ( int argc, char *argv[] )
{
	tick_init();
	uint64 tick1, tick2, diff;
	double bandwidth = 0, sum = 0, sqSum = 0;

	uint64* src = (uint64*)malloc(DATA_SIZE);
	//uint64* dst = (uint64*)malloc(DATA_SIZE);
	
	memset(src, 1, DATA_SIZE);//seems that Linux won't allocate memory until they're written
	//memset(dst, 0, DATA_SIZE);
	
	char c;
	printf("Memory allocated. Check TOP and press any key.");	
	scanf("%c", &c);

	int i;
	for (i = 0; i < LOOP_SIZE_OUTER; i++)
	{
		tick(tick1);
		//memReadTest(src);
		memWriteTest(src);
		//memCopyTest(src, dst);
		//memcpy(dst, src, DATA_SIZE);
		tick(tick2);

		diff = tick_diff_loop(tick1, tick2, LOOP_SIZE_INNER);
		
		bandwidth = (double)DATA_SIZE / ((double)diff / (double)CPU_FREQUENCY * 1e-3) / (double)(1 << 30);
		sum += bandwidth;
		sqSum += bandwidth * bandwidth;

		//reset memory
		memset(src, 1, DATA_SIZE);
		//memset(dst, 0, DATA_SIZE);

		printf("%d\n", i);
	}
	
	
	printf("avg=%.2fGB/s, std=%.2e\n", sum / LOOP_SIZE_OUTER, sqrt(sqSum / LOOP_SIZE_OUTER - (sum / LOOP_SIZE_OUTER * sum / LOOP_SIZE_OUTER)));

	free(src);
	//free(dst);

	return 0;
}		

