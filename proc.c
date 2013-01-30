/*
 * =====================================================================================
 *
 *       Filename:  proc.c
 *    Description:  Procedure call overhead
 *
 * =====================================================================================
 */


#include	<stdio.h> 
#include	<stdlib.h>
#include	<math.h>
#include	"tick.h"

#define LOOP_SIZE_INNER 5e6
#define LOOP_SIZE_OUTER 100

void foo0() { }
void foo1(int a) { }
void foo2(int a, int b) { }
void foo3(int a, int b, int c) { }
void foo4(int a, int b, int c, int d) { }
void foo5(int a, int b, int c, int d, int e) { }
void foo6(int a, int b, int c, int d, int e, int f) { }
void foo7(int a, int b, int c, int d, int e, int f, int g) { }

#define TEST_GEN(id, func) sum = 0; sqSum = 0; \
for (i = 0; i < LOOP_SIZE_OUTER; i++) \
{ \
	tick(tick1); \
	for (j = 0; j < LOOP_SIZE_INNER; j++) 	\
	{ 					\
		func;				\
	}					\
	tick(tick2);				\
	\
	diff = tick_diff_loop(tick1, tick2, LOOP_SIZE_INNER); \
	sum += diff; \
	sqSum += diff * diff; \
} \
sum /= LOOP_SIZE_INNER; \
sqSum = sqSum / LOOP_SIZE_INNER / LOOP_SIZE_INNER; \
printf("%d args: ", id); \
print_stat(sum, sqSum, LOOP_SIZE_OUTER);

#define TEST_GEN_SINGLE(id, func) sum = 0; sqSum = 0; \
for (i = 0; i < LOOP_SIZE_OUTER; i++) \
{ \
	tick(tick1); \
	func;	     \
	tick(tick2); \
	\
	diff = tick_diff(tick1, tick2); \
	sum += diff; \
	sqSum += diff * diff; \
} \
printf("%d args: ", id); \
print_stat(sum, sqSum, LOOP_SIZE_OUTER);



int main ( int argc, char *argv[] )
{
	tick_init();
	
	uint64 tick1, tick2, diff;
	double sum, sqSum;
	int i, j;
	
	printf("Pass 1\n");
	TEST_GEN(0, foo0());
	TEST_GEN(1, foo1(1));
	TEST_GEN(2, foo2(1,2));
	TEST_GEN(3, foo3(1,2,3));
	TEST_GEN(4, foo4(1,2,3,4));
	TEST_GEN(5, foo5(1,2,3,4,5));
	TEST_GEN(6, foo6(1,2,3,4,5,6));
	TEST_GEN(7, foo7(1,2,3,4,5,6,7));
	
	printf("Pass 2\n");
	TEST_GEN(0, foo0());
	TEST_GEN(1, foo1(1));
	TEST_GEN(2, foo2(1,2));
	TEST_GEN(3, foo3(1,2,3));
	TEST_GEN(4, foo4(1,2,3,4));
	TEST_GEN(5, foo5(1,2,3,4,5));
	TEST_GEN(6, foo6(1,2,3,4,5,6));
	TEST_GEN(7, foo7(1,2,3,4,5,6,7));
	

	return 0;
}		

