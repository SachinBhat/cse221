/*
 * =====================================================================================
 *
 *       Filename:  rrquant.c
 *    Description:  Get the quantum value for the Round Robin policy
 *
 * =====================================================================================
 */

#include	<stdio.h> 
#include	<stdlib.h>
#include	<sched.h>

int main ( int argc, char *argv[] )
{
	struct timespec res;
	sched_rr_get_interval(0, &res);
	printf("%lu, %lu\n", res.tv_sec, res.tv_nsec);
	return 0;
}		

