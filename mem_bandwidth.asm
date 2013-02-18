
mem_bandwidth.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <tick_find_overhead>:
#define print_stat(sum, sqSum, n) printf("avg=%.2f, std=%.2e, avg_time=%.2ems, std_time=%.2e\n", sum / n, sqrt(sqSum / n - (sum / n * sum / n)), sum / n / CPU_FREQUENCY, sqrt(sqSum / n - (sum / n * sum / n)) / CPU_FREQUENCY)

#define print_stat_csv(sum, sqSum, n) printf("%.2f,%.2e,%.2e,%.2e\n", sum / n, sqrt(sqSum / n - (sum / n * sum / n)), sum / n / CPU_FREQUENCY, sqrt(sqSum / n - (sum / n * sum / n)) / CPU_FREQUENCY)

inline uint64 tick_find_overhead()
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	41 54                	push   %r12
       6:	53                   	push   %rbx
	unsigned tick_eax, tick_edx;
	uint64 tick1, tick2;
	tick(tick1);
       7:	0f 31                	rdtsc  
       9:	89 d3                	mov    %edx,%ebx
       b:	41 89 c4             	mov    %eax,%r12d
       e:	44 89 65 d8          	mov    %r12d,-0x28(%rbp)
      12:	89 5d dc             	mov    %ebx,-0x24(%rbp)
      15:	8b 45 d8             	mov    -0x28(%rbp),%eax
      18:	8b 55 dc             	mov    -0x24(%rbp),%edx
      1b:	48 c1 e2 20          	shl    $0x20,%rdx
      1f:	48 09 d0             	or     %rdx,%rax
      22:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
	tick(tick2);
      26:	0f 31                	rdtsc  
      28:	89 d3                	mov    %edx,%ebx
      2a:	41 89 c4             	mov    %eax,%r12d
      2d:	44 89 65 d8          	mov    %r12d,-0x28(%rbp)
      31:	89 5d dc             	mov    %ebx,-0x24(%rbp)
      34:	8b 45 d8             	mov    -0x28(%rbp),%eax
      37:	8b 55 dc             	mov    -0x24(%rbp),%edx
      3a:	48 c1 e2 20          	shl    $0x20,%rdx
      3e:	48 09 d0             	or     %rdx,%rax
      41:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	return tick2 - tick1;
      45:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      49:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
      4d:	48 89 d1             	mov    %rdx,%rcx
      50:	48 29 c1             	sub    %rax,%rcx
      53:	48 89 c8             	mov    %rcx,%rax
}
      56:	5b                   	pop    %rbx
      57:	41 5c                	pop    %r12
      59:	5d                   	pop    %rbp
      5a:	c3                   	retq   

000000000000005b <main>:
#include	"mem_bandwidth.h"

#define	LOOP_SIZE_OUTER 10

int main ( int argc, char *argv[] )
{
      5b:	55                   	push   %rbp
      5c:	48 89 e5             	mov    %rsp,%rbp
      5f:	41 54                	push   %r12
      61:	53                   	push   %rbx
      62:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
      69:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
      6f:	48 89 b5 70 ff ff ff 	mov    %rsi,-0x90(%rbp)
	tick_init();
      76:	0f 31                	rdtsc  
      78:	89 d3                	mov    %edx,%ebx
      7a:	41 89 c4             	mov    %eax,%r12d
      7d:	44 89 65 90          	mov    %r12d,-0x70(%rbp)
      81:	89 5d 94             	mov    %ebx,-0x6c(%rbp)
      84:	8b 45 90             	mov    -0x70(%rbp),%eax
      87:	8b 55 94             	mov    -0x6c(%rbp),%edx
      8a:	48 c1 e2 20          	shl    $0x20,%rdx
      8e:	48 09 d0             	or     %rdx,%rax
      91:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
      95:	0f 31                	rdtsc  
      97:	89 d3                	mov    %edx,%ebx
      99:	41 89 c4             	mov    %eax,%r12d
      9c:	44 89 65 90          	mov    %r12d,-0x70(%rbp)
      a0:	89 5d 94             	mov    %ebx,-0x6c(%rbp)
      a3:	8b 45 90             	mov    -0x70(%rbp),%eax
      a6:	8b 55 94             	mov    -0x6c(%rbp),%edx
      a9:	48 c1 e2 20          	shl    $0x20,%rdx
      ad:	48 09 d0             	or     %rdx,%rax
      b0:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
      b4:	0f 31                	rdtsc  
      b6:	89 d3                	mov    %edx,%ebx
      b8:	41 89 c4             	mov    %eax,%r12d
      bb:	44 89 65 90          	mov    %r12d,-0x70(%rbp)
      bf:	89 5d 94             	mov    %ebx,-0x6c(%rbp)
      c2:	8b 45 90             	mov    -0x70(%rbp),%eax
      c5:	8b 55 94             	mov    -0x6c(%rbp),%edx
      c8:	48 c1 e2 20          	shl    $0x20,%rdx
      cc:	48 09 d0             	or     %rdx,%rax
      cf:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
      d3:	0f 31                	rdtsc  
      d5:	89 d3                	mov    %edx,%ebx
      d7:	41 89 c4             	mov    %eax,%r12d
      da:	44 89 65 90          	mov    %r12d,-0x70(%rbp)
      de:	89 5d 94             	mov    %ebx,-0x6c(%rbp)
      e1:	8b 45 90             	mov    -0x70(%rbp),%eax
      e4:	8b 55 94             	mov    -0x6c(%rbp),%edx
      e7:	48 c1 e2 20          	shl    $0x20,%rdx
      eb:	48 09 d0             	or     %rdx,%rax
      ee:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
      f2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
      f6:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
      fa:	48 89 d1             	mov    %rdx,%rcx
      fd:	48 29 c1             	sub    %rax,%rcx
     100:	48 89 c8             	mov    %rcx,%rax
     103:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
	uint64 tick1, tick2, diff;
	double bandwidth = 0, sum = 0, sqSum = 0;
     107:	b8 00 00 00 00       	mov    $0x0,%eax
     10c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     110:	b8 00 00 00 00       	mov    $0x0,%eax
     115:	48 89 45 98          	mov    %rax,-0x68(%rbp)
     119:	b8 00 00 00 00       	mov    $0x0,%eax
     11e:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

	uint64* src = (uint64*)malloc(DATA_SIZE);
     122:	bf 00 00 00 c0       	mov    $0xc0000000,%edi
     127:	e8 00 00 00 00       	callq  12c <main+0xd1>
     12c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
	//uint64* dst = (uint64*)malloc(DATA_SIZE);
	
	memset(src, 1, DATA_SIZE);//seems that Linux won't allocate memory until they're written
     130:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     134:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
     139:	be 01 00 00 00       	mov    $0x1,%esi
     13e:	48 89 c7             	mov    %rax,%rdi
     141:	e8 00 00 00 00       	callq  146 <main+0xeb>
	//memset(dst, 0, DATA_SIZE);
	
	char c;
	printf("Memory allocated. Check TOP and press any key.");	
     146:	bf 00 00 00 00       	mov    $0x0,%edi
     14b:	b8 00 00 00 00       	mov    $0x0,%eax
     150:	e8 00 00 00 00       	callq  155 <main+0xfa>
	scanf("%c", &c);
     155:	48 8d 45 8b          	lea    -0x75(%rbp),%rax
     159:	48 89 c6             	mov    %rax,%rsi
     15c:	bf 00 00 00 00       	mov    $0x0,%edi
     161:	b8 00 00 00 00       	mov    $0x0,%eax
     166:	e8 00 00 00 00       	callq  16b <main+0x110>

	int i;
	for (i = 0; i < LOOP_SIZE_OUTER; i++)
     16b:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%rbp)
     172:	e9 0a 39 00 00       	jmpq   3a81 <main+0x3a26>
	{
		tick(tick1);
     177:	0f 31                	rdtsc  
     179:	89 d3                	mov    %edx,%ebx
     17b:	41 89 c4             	mov    %eax,%r12d
     17e:	44 89 65 90          	mov    %r12d,-0x70(%rbp)
     182:	89 5d 94             	mov    %ebx,-0x6c(%rbp)
     185:	8b 45 90             	mov    -0x70(%rbp),%eax
     188:	8b 55 94             	mov    -0x6c(%rbp),%edx
     18b:	48 c1 e2 20          	shl    $0x20,%rdx
     18f:	48 09 d0             	or     %rdx,%rax
     192:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
		//memReadTest(src);
		memWriteTest(src);
     196:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
     19a:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
     19f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     1a3:	48 01 d0             	add    %rdx,%rax
     1a6:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     1aa:	e9 d3 37 00 00       	jmpq   3982 <main+0x3927>
     1af:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
     1b6:	48 8d 43 08          	lea    0x8(%rbx),%rax
     1ba:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
     1c1:	48 8d 43 10          	lea    0x10(%rbx),%rax
     1c5:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
     1cc:	48 8d 43 18          	lea    0x18(%rbx),%rax
     1d0:	48 c7 00 03 00 00 00 	movq   $0x3,(%rax)
     1d7:	48 8d 43 20          	lea    0x20(%rbx),%rax
     1db:	48 c7 00 04 00 00 00 	movq   $0x4,(%rax)
     1e2:	48 8d 43 28          	lea    0x28(%rbx),%rax
     1e6:	48 c7 00 05 00 00 00 	movq   $0x5,(%rax)
     1ed:	48 8d 43 30          	lea    0x30(%rbx),%rax
     1f1:	48 c7 00 06 00 00 00 	movq   $0x6,(%rax)
     1f8:	48 8d 43 38          	lea    0x38(%rbx),%rax
     1fc:	48 c7 00 07 00 00 00 	movq   $0x7,(%rax)
     203:	48 8d 43 40          	lea    0x40(%rbx),%rax
     207:	48 c7 00 08 00 00 00 	movq   $0x8,(%rax)
     20e:	48 8d 43 48          	lea    0x48(%rbx),%rax
     212:	48 c7 00 09 00 00 00 	movq   $0x9,(%rax)
     219:	48 8d 43 50          	lea    0x50(%rbx),%rax
     21d:	48 c7 00 0a 00 00 00 	movq   $0xa,(%rax)
     224:	48 8d 43 58          	lea    0x58(%rbx),%rax
     228:	48 c7 00 0b 00 00 00 	movq   $0xb,(%rax)
     22f:	48 8d 43 60          	lea    0x60(%rbx),%rax
     233:	48 c7 00 0c 00 00 00 	movq   $0xc,(%rax)
     23a:	48 8d 43 68          	lea    0x68(%rbx),%rax
     23e:	48 c7 00 0d 00 00 00 	movq   $0xd,(%rax)
     245:	48 8d 43 70          	lea    0x70(%rbx),%rax
     249:	48 c7 00 0e 00 00 00 	movq   $0xe,(%rax)
     250:	48 8d 43 78          	lea    0x78(%rbx),%rax
     254:	48 c7 00 0f 00 00 00 	movq   $0xf,(%rax)
     25b:	48 8d 83 80 00 00 00 	lea    0x80(%rbx),%rax
     262:	48 c7 00 10 00 00 00 	movq   $0x10,(%rax)
     269:	48 8d 83 88 00 00 00 	lea    0x88(%rbx),%rax
     270:	48 c7 00 11 00 00 00 	movq   $0x11,(%rax)
     277:	48 8d 83 90 00 00 00 	lea    0x90(%rbx),%rax
     27e:	48 c7 00 12 00 00 00 	movq   $0x12,(%rax)
     285:	48 8d 83 98 00 00 00 	lea    0x98(%rbx),%rax
     28c:	48 c7 00 13 00 00 00 	movq   $0x13,(%rax)
     293:	48 8d 83 a0 00 00 00 	lea    0xa0(%rbx),%rax
     29a:	48 c7 00 14 00 00 00 	movq   $0x14,(%rax)
     2a1:	48 8d 83 a8 00 00 00 	lea    0xa8(%rbx),%rax
     2a8:	48 c7 00 15 00 00 00 	movq   $0x15,(%rax)
     2af:	48 8d 83 b0 00 00 00 	lea    0xb0(%rbx),%rax
     2b6:	48 c7 00 16 00 00 00 	movq   $0x16,(%rax)
     2bd:	48 8d 83 b8 00 00 00 	lea    0xb8(%rbx),%rax
     2c4:	48 c7 00 17 00 00 00 	movq   $0x17,(%rax)
     2cb:	48 8d 83 c0 00 00 00 	lea    0xc0(%rbx),%rax
     2d2:	48 c7 00 18 00 00 00 	movq   $0x18,(%rax)
     2d9:	48 8d 83 c8 00 00 00 	lea    0xc8(%rbx),%rax
     2e0:	48 c7 00 19 00 00 00 	movq   $0x19,(%rax)
     2e7:	48 8d 83 d0 00 00 00 	lea    0xd0(%rbx),%rax
     2ee:	48 c7 00 1a 00 00 00 	movq   $0x1a,(%rax)
     2f5:	48 8d 83 d8 00 00 00 	lea    0xd8(%rbx),%rax
     2fc:	48 c7 00 1b 00 00 00 	movq   $0x1b,(%rax)
     303:	48 8d 83 e0 00 00 00 	lea    0xe0(%rbx),%rax
     30a:	48 c7 00 1c 00 00 00 	movq   $0x1c,(%rax)
     311:	48 8d 83 e8 00 00 00 	lea    0xe8(%rbx),%rax
     318:	48 c7 00 1d 00 00 00 	movq   $0x1d,(%rax)
     31f:	48 8d 83 f0 00 00 00 	lea    0xf0(%rbx),%rax
     326:	48 c7 00 1e 00 00 00 	movq   $0x1e,(%rax)
     32d:	48 8d 83 f8 00 00 00 	lea    0xf8(%rbx),%rax
     334:	48 c7 00 1f 00 00 00 	movq   $0x1f,(%rax)
     33b:	48 8d 83 00 01 00 00 	lea    0x100(%rbx),%rax
     342:	48 c7 00 20 00 00 00 	movq   $0x20,(%rax)
     349:	48 8d 83 08 01 00 00 	lea    0x108(%rbx),%rax
     350:	48 c7 00 21 00 00 00 	movq   $0x21,(%rax)
     357:	48 8d 83 10 01 00 00 	lea    0x110(%rbx),%rax
     35e:	48 c7 00 22 00 00 00 	movq   $0x22,(%rax)
     365:	48 8d 83 18 01 00 00 	lea    0x118(%rbx),%rax
     36c:	48 c7 00 23 00 00 00 	movq   $0x23,(%rax)
     373:	48 8d 83 20 01 00 00 	lea    0x120(%rbx),%rax
     37a:	48 c7 00 24 00 00 00 	movq   $0x24,(%rax)
     381:	48 8d 83 28 01 00 00 	lea    0x128(%rbx),%rax
     388:	48 c7 00 25 00 00 00 	movq   $0x25,(%rax)
     38f:	48 8d 83 30 01 00 00 	lea    0x130(%rbx),%rax
     396:	48 c7 00 26 00 00 00 	movq   $0x26,(%rax)
     39d:	48 8d 83 38 01 00 00 	lea    0x138(%rbx),%rax
     3a4:	48 c7 00 27 00 00 00 	movq   $0x27,(%rax)
     3ab:	48 8d 83 40 01 00 00 	lea    0x140(%rbx),%rax
     3b2:	48 c7 00 28 00 00 00 	movq   $0x28,(%rax)
     3b9:	48 8d 83 48 01 00 00 	lea    0x148(%rbx),%rax
     3c0:	48 c7 00 29 00 00 00 	movq   $0x29,(%rax)
     3c7:	48 8d 83 50 01 00 00 	lea    0x150(%rbx),%rax
     3ce:	48 c7 00 2a 00 00 00 	movq   $0x2a,(%rax)
     3d5:	48 8d 83 58 01 00 00 	lea    0x158(%rbx),%rax
     3dc:	48 c7 00 2b 00 00 00 	movq   $0x2b,(%rax)
     3e3:	48 8d 83 60 01 00 00 	lea    0x160(%rbx),%rax
     3ea:	48 c7 00 2c 00 00 00 	movq   $0x2c,(%rax)
     3f1:	48 8d 83 68 01 00 00 	lea    0x168(%rbx),%rax
     3f8:	48 c7 00 2d 00 00 00 	movq   $0x2d,(%rax)
     3ff:	48 8d 83 70 01 00 00 	lea    0x170(%rbx),%rax
     406:	48 c7 00 2e 00 00 00 	movq   $0x2e,(%rax)
     40d:	48 8d 83 78 01 00 00 	lea    0x178(%rbx),%rax
     414:	48 c7 00 2f 00 00 00 	movq   $0x2f,(%rax)
     41b:	48 8d 83 80 01 00 00 	lea    0x180(%rbx),%rax
     422:	48 c7 00 30 00 00 00 	movq   $0x30,(%rax)
     429:	48 8d 83 88 01 00 00 	lea    0x188(%rbx),%rax
     430:	48 c7 00 31 00 00 00 	movq   $0x31,(%rax)
     437:	48 8d 83 90 01 00 00 	lea    0x190(%rbx),%rax
     43e:	48 c7 00 32 00 00 00 	movq   $0x32,(%rax)
     445:	48 8d 83 98 01 00 00 	lea    0x198(%rbx),%rax
     44c:	48 c7 00 33 00 00 00 	movq   $0x33,(%rax)
     453:	48 8d 83 a0 01 00 00 	lea    0x1a0(%rbx),%rax
     45a:	48 c7 00 34 00 00 00 	movq   $0x34,(%rax)
     461:	48 8d 83 a8 01 00 00 	lea    0x1a8(%rbx),%rax
     468:	48 c7 00 35 00 00 00 	movq   $0x35,(%rax)
     46f:	48 8d 83 b0 01 00 00 	lea    0x1b0(%rbx),%rax
     476:	48 c7 00 36 00 00 00 	movq   $0x36,(%rax)
     47d:	48 8d 83 b8 01 00 00 	lea    0x1b8(%rbx),%rax
     484:	48 c7 00 37 00 00 00 	movq   $0x37,(%rax)
     48b:	48 8d 83 c0 01 00 00 	lea    0x1c0(%rbx),%rax
     492:	48 c7 00 38 00 00 00 	movq   $0x38,(%rax)
     499:	48 8d 83 c8 01 00 00 	lea    0x1c8(%rbx),%rax
     4a0:	48 c7 00 39 00 00 00 	movq   $0x39,(%rax)
     4a7:	48 8d 83 d0 01 00 00 	lea    0x1d0(%rbx),%rax
     4ae:	48 c7 00 3a 00 00 00 	movq   $0x3a,(%rax)
     4b5:	48 8d 83 d8 01 00 00 	lea    0x1d8(%rbx),%rax
     4bc:	48 c7 00 3b 00 00 00 	movq   $0x3b,(%rax)
     4c3:	48 8d 83 e0 01 00 00 	lea    0x1e0(%rbx),%rax
     4ca:	48 c7 00 3c 00 00 00 	movq   $0x3c,(%rax)
     4d1:	48 8d 83 e8 01 00 00 	lea    0x1e8(%rbx),%rax
     4d8:	48 c7 00 3d 00 00 00 	movq   $0x3d,(%rax)
     4df:	48 8d 83 f0 01 00 00 	lea    0x1f0(%rbx),%rax
     4e6:	48 c7 00 3e 00 00 00 	movq   $0x3e,(%rax)
     4ed:	48 8d 83 f8 01 00 00 	lea    0x1f8(%rbx),%rax
     4f4:	48 c7 00 3f 00 00 00 	movq   $0x3f,(%rax)
     4fb:	48 8d 83 00 02 00 00 	lea    0x200(%rbx),%rax
     502:	48 c7 00 40 00 00 00 	movq   $0x40,(%rax)
     509:	48 8d 83 08 02 00 00 	lea    0x208(%rbx),%rax
     510:	48 c7 00 41 00 00 00 	movq   $0x41,(%rax)
     517:	48 8d 83 10 02 00 00 	lea    0x210(%rbx),%rax
     51e:	48 c7 00 42 00 00 00 	movq   $0x42,(%rax)
     525:	48 8d 83 18 02 00 00 	lea    0x218(%rbx),%rax
     52c:	48 c7 00 43 00 00 00 	movq   $0x43,(%rax)
     533:	48 8d 83 20 02 00 00 	lea    0x220(%rbx),%rax
     53a:	48 c7 00 44 00 00 00 	movq   $0x44,(%rax)
     541:	48 8d 83 28 02 00 00 	lea    0x228(%rbx),%rax
     548:	48 c7 00 45 00 00 00 	movq   $0x45,(%rax)
     54f:	48 8d 83 30 02 00 00 	lea    0x230(%rbx),%rax
     556:	48 c7 00 46 00 00 00 	movq   $0x46,(%rax)
     55d:	48 8d 83 38 02 00 00 	lea    0x238(%rbx),%rax
     564:	48 c7 00 47 00 00 00 	movq   $0x47,(%rax)
     56b:	48 8d 83 40 02 00 00 	lea    0x240(%rbx),%rax
     572:	48 c7 00 48 00 00 00 	movq   $0x48,(%rax)
     579:	48 8d 83 48 02 00 00 	lea    0x248(%rbx),%rax
     580:	48 c7 00 49 00 00 00 	movq   $0x49,(%rax)
     587:	48 8d 83 50 02 00 00 	lea    0x250(%rbx),%rax
     58e:	48 c7 00 4a 00 00 00 	movq   $0x4a,(%rax)
     595:	48 8d 83 58 02 00 00 	lea    0x258(%rbx),%rax
     59c:	48 c7 00 4b 00 00 00 	movq   $0x4b,(%rax)
     5a3:	48 8d 83 60 02 00 00 	lea    0x260(%rbx),%rax
     5aa:	48 c7 00 4c 00 00 00 	movq   $0x4c,(%rax)
     5b1:	48 8d 83 68 02 00 00 	lea    0x268(%rbx),%rax
     5b8:	48 c7 00 4d 00 00 00 	movq   $0x4d,(%rax)
     5bf:	48 8d 83 70 02 00 00 	lea    0x270(%rbx),%rax
     5c6:	48 c7 00 4e 00 00 00 	movq   $0x4e,(%rax)
     5cd:	48 8d 83 78 02 00 00 	lea    0x278(%rbx),%rax
     5d4:	48 c7 00 4f 00 00 00 	movq   $0x4f,(%rax)
     5db:	48 8d 83 80 02 00 00 	lea    0x280(%rbx),%rax
     5e2:	48 c7 00 50 00 00 00 	movq   $0x50,(%rax)
     5e9:	48 8d 83 88 02 00 00 	lea    0x288(%rbx),%rax
     5f0:	48 c7 00 51 00 00 00 	movq   $0x51,(%rax)
     5f7:	48 8d 83 90 02 00 00 	lea    0x290(%rbx),%rax
     5fe:	48 c7 00 52 00 00 00 	movq   $0x52,(%rax)
     605:	48 8d 83 98 02 00 00 	lea    0x298(%rbx),%rax
     60c:	48 c7 00 53 00 00 00 	movq   $0x53,(%rax)
     613:	48 8d 83 a0 02 00 00 	lea    0x2a0(%rbx),%rax
     61a:	48 c7 00 54 00 00 00 	movq   $0x54,(%rax)
     621:	48 8d 83 a8 02 00 00 	lea    0x2a8(%rbx),%rax
     628:	48 c7 00 55 00 00 00 	movq   $0x55,(%rax)
     62f:	48 8d 83 b0 02 00 00 	lea    0x2b0(%rbx),%rax
     636:	48 c7 00 56 00 00 00 	movq   $0x56,(%rax)
     63d:	48 8d 83 b8 02 00 00 	lea    0x2b8(%rbx),%rax
     644:	48 c7 00 57 00 00 00 	movq   $0x57,(%rax)
     64b:	48 8d 83 c0 02 00 00 	lea    0x2c0(%rbx),%rax
     652:	48 c7 00 58 00 00 00 	movq   $0x58,(%rax)
     659:	48 8d 83 c8 02 00 00 	lea    0x2c8(%rbx),%rax
     660:	48 c7 00 59 00 00 00 	movq   $0x59,(%rax)
     667:	48 8d 83 d0 02 00 00 	lea    0x2d0(%rbx),%rax
     66e:	48 c7 00 5a 00 00 00 	movq   $0x5a,(%rax)
     675:	48 8d 83 d8 02 00 00 	lea    0x2d8(%rbx),%rax
     67c:	48 c7 00 5b 00 00 00 	movq   $0x5b,(%rax)
     683:	48 8d 83 e0 02 00 00 	lea    0x2e0(%rbx),%rax
     68a:	48 c7 00 5c 00 00 00 	movq   $0x5c,(%rax)
     691:	48 8d 83 e8 02 00 00 	lea    0x2e8(%rbx),%rax
     698:	48 c7 00 5d 00 00 00 	movq   $0x5d,(%rax)
     69f:	48 8d 83 f0 02 00 00 	lea    0x2f0(%rbx),%rax
     6a6:	48 c7 00 5e 00 00 00 	movq   $0x5e,(%rax)
     6ad:	48 8d 83 f8 02 00 00 	lea    0x2f8(%rbx),%rax
     6b4:	48 c7 00 5f 00 00 00 	movq   $0x5f,(%rax)
     6bb:	48 8d 83 00 03 00 00 	lea    0x300(%rbx),%rax
     6c2:	48 c7 00 60 00 00 00 	movq   $0x60,(%rax)
     6c9:	48 8d 83 08 03 00 00 	lea    0x308(%rbx),%rax
     6d0:	48 c7 00 61 00 00 00 	movq   $0x61,(%rax)
     6d7:	48 8d 83 10 03 00 00 	lea    0x310(%rbx),%rax
     6de:	48 c7 00 62 00 00 00 	movq   $0x62,(%rax)
     6e5:	48 8d 83 18 03 00 00 	lea    0x318(%rbx),%rax
     6ec:	48 c7 00 63 00 00 00 	movq   $0x63,(%rax)
     6f3:	48 8d 83 20 03 00 00 	lea    0x320(%rbx),%rax
     6fa:	48 c7 00 64 00 00 00 	movq   $0x64,(%rax)
     701:	48 8d 83 28 03 00 00 	lea    0x328(%rbx),%rax
     708:	48 c7 00 65 00 00 00 	movq   $0x65,(%rax)
     70f:	48 8d 83 30 03 00 00 	lea    0x330(%rbx),%rax
     716:	48 c7 00 66 00 00 00 	movq   $0x66,(%rax)
     71d:	48 8d 83 38 03 00 00 	lea    0x338(%rbx),%rax
     724:	48 c7 00 67 00 00 00 	movq   $0x67,(%rax)
     72b:	48 8d 83 40 03 00 00 	lea    0x340(%rbx),%rax
     732:	48 c7 00 68 00 00 00 	movq   $0x68,(%rax)
     739:	48 8d 83 48 03 00 00 	lea    0x348(%rbx),%rax
     740:	48 c7 00 69 00 00 00 	movq   $0x69,(%rax)
     747:	48 8d 83 50 03 00 00 	lea    0x350(%rbx),%rax
     74e:	48 c7 00 6a 00 00 00 	movq   $0x6a,(%rax)
     755:	48 8d 83 58 03 00 00 	lea    0x358(%rbx),%rax
     75c:	48 c7 00 6b 00 00 00 	movq   $0x6b,(%rax)
     763:	48 8d 83 60 03 00 00 	lea    0x360(%rbx),%rax
     76a:	48 c7 00 6c 00 00 00 	movq   $0x6c,(%rax)
     771:	48 8d 83 68 03 00 00 	lea    0x368(%rbx),%rax
     778:	48 c7 00 6d 00 00 00 	movq   $0x6d,(%rax)
     77f:	48 8d 83 70 03 00 00 	lea    0x370(%rbx),%rax
     786:	48 c7 00 6e 00 00 00 	movq   $0x6e,(%rax)
     78d:	48 8d 83 78 03 00 00 	lea    0x378(%rbx),%rax
     794:	48 c7 00 6f 00 00 00 	movq   $0x6f,(%rax)
     79b:	48 8d 83 80 03 00 00 	lea    0x380(%rbx),%rax
     7a2:	48 c7 00 70 00 00 00 	movq   $0x70,(%rax)
     7a9:	48 8d 83 88 03 00 00 	lea    0x388(%rbx),%rax
     7b0:	48 c7 00 71 00 00 00 	movq   $0x71,(%rax)
     7b7:	48 8d 83 90 03 00 00 	lea    0x390(%rbx),%rax
     7be:	48 c7 00 72 00 00 00 	movq   $0x72,(%rax)
     7c5:	48 8d 83 98 03 00 00 	lea    0x398(%rbx),%rax
     7cc:	48 c7 00 73 00 00 00 	movq   $0x73,(%rax)
     7d3:	48 8d 83 a0 03 00 00 	lea    0x3a0(%rbx),%rax
     7da:	48 c7 00 74 00 00 00 	movq   $0x74,(%rax)
     7e1:	48 8d 83 a8 03 00 00 	lea    0x3a8(%rbx),%rax
     7e8:	48 c7 00 75 00 00 00 	movq   $0x75,(%rax)
     7ef:	48 8d 83 b0 03 00 00 	lea    0x3b0(%rbx),%rax
     7f6:	48 c7 00 76 00 00 00 	movq   $0x76,(%rax)
     7fd:	48 8d 83 b8 03 00 00 	lea    0x3b8(%rbx),%rax
     804:	48 c7 00 77 00 00 00 	movq   $0x77,(%rax)
     80b:	48 8d 83 c0 03 00 00 	lea    0x3c0(%rbx),%rax
     812:	48 c7 00 78 00 00 00 	movq   $0x78,(%rax)
     819:	48 8d 83 c8 03 00 00 	lea    0x3c8(%rbx),%rax
     820:	48 c7 00 79 00 00 00 	movq   $0x79,(%rax)
     827:	48 8d 83 d0 03 00 00 	lea    0x3d0(%rbx),%rax
     82e:	48 c7 00 7a 00 00 00 	movq   $0x7a,(%rax)
     835:	48 8d 83 d8 03 00 00 	lea    0x3d8(%rbx),%rax
     83c:	48 c7 00 7b 00 00 00 	movq   $0x7b,(%rax)
     843:	48 8d 83 e0 03 00 00 	lea    0x3e0(%rbx),%rax
     84a:	48 c7 00 7c 00 00 00 	movq   $0x7c,(%rax)
     851:	48 8d 83 e8 03 00 00 	lea    0x3e8(%rbx),%rax
     858:	48 c7 00 7d 00 00 00 	movq   $0x7d,(%rax)
     85f:	48 8d 83 f0 03 00 00 	lea    0x3f0(%rbx),%rax
     866:	48 c7 00 7e 00 00 00 	movq   $0x7e,(%rax)
     86d:	48 8d 83 f8 03 00 00 	lea    0x3f8(%rbx),%rax
     874:	48 c7 00 7f 00 00 00 	movq   $0x7f,(%rax)
     87b:	48 8d 83 00 04 00 00 	lea    0x400(%rbx),%rax
     882:	48 c7 00 80 00 00 00 	movq   $0x80,(%rax)
     889:	48 8d 83 08 04 00 00 	lea    0x408(%rbx),%rax
     890:	48 c7 00 81 00 00 00 	movq   $0x81,(%rax)
     897:	48 8d 83 10 04 00 00 	lea    0x410(%rbx),%rax
     89e:	48 c7 00 82 00 00 00 	movq   $0x82,(%rax)
     8a5:	48 8d 83 18 04 00 00 	lea    0x418(%rbx),%rax
     8ac:	48 c7 00 83 00 00 00 	movq   $0x83,(%rax)
     8b3:	48 8d 83 20 04 00 00 	lea    0x420(%rbx),%rax
     8ba:	48 c7 00 84 00 00 00 	movq   $0x84,(%rax)
     8c1:	48 8d 83 28 04 00 00 	lea    0x428(%rbx),%rax
     8c8:	48 c7 00 85 00 00 00 	movq   $0x85,(%rax)
     8cf:	48 8d 83 30 04 00 00 	lea    0x430(%rbx),%rax
     8d6:	48 c7 00 86 00 00 00 	movq   $0x86,(%rax)
     8dd:	48 8d 83 38 04 00 00 	lea    0x438(%rbx),%rax
     8e4:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
     8eb:	48 8d 83 40 04 00 00 	lea    0x440(%rbx),%rax
     8f2:	48 c7 00 88 00 00 00 	movq   $0x88,(%rax)
     8f9:	48 8d 83 48 04 00 00 	lea    0x448(%rbx),%rax
     900:	48 c7 00 89 00 00 00 	movq   $0x89,(%rax)
     907:	48 8d 83 50 04 00 00 	lea    0x450(%rbx),%rax
     90e:	48 c7 00 8a 00 00 00 	movq   $0x8a,(%rax)
     915:	48 8d 83 58 04 00 00 	lea    0x458(%rbx),%rax
     91c:	48 c7 00 8b 00 00 00 	movq   $0x8b,(%rax)
     923:	48 8d 83 60 04 00 00 	lea    0x460(%rbx),%rax
     92a:	48 c7 00 8c 00 00 00 	movq   $0x8c,(%rax)
     931:	48 8d 83 68 04 00 00 	lea    0x468(%rbx),%rax
     938:	48 c7 00 8d 00 00 00 	movq   $0x8d,(%rax)
     93f:	48 8d 83 70 04 00 00 	lea    0x470(%rbx),%rax
     946:	48 c7 00 8e 00 00 00 	movq   $0x8e,(%rax)
     94d:	48 8d 83 78 04 00 00 	lea    0x478(%rbx),%rax
     954:	48 c7 00 8f 00 00 00 	movq   $0x8f,(%rax)
     95b:	48 8d 83 80 04 00 00 	lea    0x480(%rbx),%rax
     962:	48 c7 00 90 00 00 00 	movq   $0x90,(%rax)
     969:	48 8d 83 88 04 00 00 	lea    0x488(%rbx),%rax
     970:	48 c7 00 91 00 00 00 	movq   $0x91,(%rax)
     977:	48 8d 83 90 04 00 00 	lea    0x490(%rbx),%rax
     97e:	48 c7 00 92 00 00 00 	movq   $0x92,(%rax)
     985:	48 8d 83 98 04 00 00 	lea    0x498(%rbx),%rax
     98c:	48 c7 00 93 00 00 00 	movq   $0x93,(%rax)
     993:	48 8d 83 a0 04 00 00 	lea    0x4a0(%rbx),%rax
     99a:	48 c7 00 94 00 00 00 	movq   $0x94,(%rax)
     9a1:	48 8d 83 a8 04 00 00 	lea    0x4a8(%rbx),%rax
     9a8:	48 c7 00 95 00 00 00 	movq   $0x95,(%rax)
     9af:	48 8d 83 b0 04 00 00 	lea    0x4b0(%rbx),%rax
     9b6:	48 c7 00 96 00 00 00 	movq   $0x96,(%rax)
     9bd:	48 8d 83 b8 04 00 00 	lea    0x4b8(%rbx),%rax
     9c4:	48 c7 00 97 00 00 00 	movq   $0x97,(%rax)
     9cb:	48 8d 83 c0 04 00 00 	lea    0x4c0(%rbx),%rax
     9d2:	48 c7 00 98 00 00 00 	movq   $0x98,(%rax)
     9d9:	48 8d 83 c8 04 00 00 	lea    0x4c8(%rbx),%rax
     9e0:	48 c7 00 99 00 00 00 	movq   $0x99,(%rax)
     9e7:	48 8d 83 d0 04 00 00 	lea    0x4d0(%rbx),%rax
     9ee:	48 c7 00 9a 00 00 00 	movq   $0x9a,(%rax)
     9f5:	48 8d 83 d8 04 00 00 	lea    0x4d8(%rbx),%rax
     9fc:	48 c7 00 9b 00 00 00 	movq   $0x9b,(%rax)
     a03:	48 8d 83 e0 04 00 00 	lea    0x4e0(%rbx),%rax
     a0a:	48 c7 00 9c 00 00 00 	movq   $0x9c,(%rax)
     a11:	48 8d 83 e8 04 00 00 	lea    0x4e8(%rbx),%rax
     a18:	48 c7 00 9d 00 00 00 	movq   $0x9d,(%rax)
     a1f:	48 8d 83 f0 04 00 00 	lea    0x4f0(%rbx),%rax
     a26:	48 c7 00 9e 00 00 00 	movq   $0x9e,(%rax)
     a2d:	48 8d 83 f8 04 00 00 	lea    0x4f8(%rbx),%rax
     a34:	48 c7 00 9f 00 00 00 	movq   $0x9f,(%rax)
     a3b:	48 8d 83 00 05 00 00 	lea    0x500(%rbx),%rax
     a42:	48 c7 00 a0 00 00 00 	movq   $0xa0,(%rax)
     a49:	48 8d 83 08 05 00 00 	lea    0x508(%rbx),%rax
     a50:	48 c7 00 a1 00 00 00 	movq   $0xa1,(%rax)
     a57:	48 8d 83 10 05 00 00 	lea    0x510(%rbx),%rax
     a5e:	48 c7 00 a2 00 00 00 	movq   $0xa2,(%rax)
     a65:	48 8d 83 18 05 00 00 	lea    0x518(%rbx),%rax
     a6c:	48 c7 00 a3 00 00 00 	movq   $0xa3,(%rax)
     a73:	48 8d 83 20 05 00 00 	lea    0x520(%rbx),%rax
     a7a:	48 c7 00 a4 00 00 00 	movq   $0xa4,(%rax)
     a81:	48 8d 83 28 05 00 00 	lea    0x528(%rbx),%rax
     a88:	48 c7 00 a5 00 00 00 	movq   $0xa5,(%rax)
     a8f:	48 8d 83 30 05 00 00 	lea    0x530(%rbx),%rax
     a96:	48 c7 00 a6 00 00 00 	movq   $0xa6,(%rax)
     a9d:	48 8d 83 38 05 00 00 	lea    0x538(%rbx),%rax
     aa4:	48 c7 00 a7 00 00 00 	movq   $0xa7,(%rax)
     aab:	48 8d 83 40 05 00 00 	lea    0x540(%rbx),%rax
     ab2:	48 c7 00 a8 00 00 00 	movq   $0xa8,(%rax)
     ab9:	48 8d 83 48 05 00 00 	lea    0x548(%rbx),%rax
     ac0:	48 c7 00 a9 00 00 00 	movq   $0xa9,(%rax)
     ac7:	48 8d 83 50 05 00 00 	lea    0x550(%rbx),%rax
     ace:	48 c7 00 aa 00 00 00 	movq   $0xaa,(%rax)
     ad5:	48 8d 83 58 05 00 00 	lea    0x558(%rbx),%rax
     adc:	48 c7 00 ab 00 00 00 	movq   $0xab,(%rax)
     ae3:	48 8d 83 60 05 00 00 	lea    0x560(%rbx),%rax
     aea:	48 c7 00 ac 00 00 00 	movq   $0xac,(%rax)
     af1:	48 8d 83 68 05 00 00 	lea    0x568(%rbx),%rax
     af8:	48 c7 00 ad 00 00 00 	movq   $0xad,(%rax)
     aff:	48 8d 83 70 05 00 00 	lea    0x570(%rbx),%rax
     b06:	48 c7 00 ae 00 00 00 	movq   $0xae,(%rax)
     b0d:	48 8d 83 78 05 00 00 	lea    0x578(%rbx),%rax
     b14:	48 c7 00 af 00 00 00 	movq   $0xaf,(%rax)
     b1b:	48 8d 83 80 05 00 00 	lea    0x580(%rbx),%rax
     b22:	48 c7 00 b0 00 00 00 	movq   $0xb0,(%rax)
     b29:	48 8d 83 88 05 00 00 	lea    0x588(%rbx),%rax
     b30:	48 c7 00 b1 00 00 00 	movq   $0xb1,(%rax)
     b37:	48 8d 83 90 05 00 00 	lea    0x590(%rbx),%rax
     b3e:	48 c7 00 b2 00 00 00 	movq   $0xb2,(%rax)
     b45:	48 8d 83 98 05 00 00 	lea    0x598(%rbx),%rax
     b4c:	48 c7 00 b3 00 00 00 	movq   $0xb3,(%rax)
     b53:	48 8d 83 a0 05 00 00 	lea    0x5a0(%rbx),%rax
     b5a:	48 c7 00 b4 00 00 00 	movq   $0xb4,(%rax)
     b61:	48 8d 83 a8 05 00 00 	lea    0x5a8(%rbx),%rax
     b68:	48 c7 00 b5 00 00 00 	movq   $0xb5,(%rax)
     b6f:	48 8d 83 b0 05 00 00 	lea    0x5b0(%rbx),%rax
     b76:	48 c7 00 b6 00 00 00 	movq   $0xb6,(%rax)
     b7d:	48 8d 83 b8 05 00 00 	lea    0x5b8(%rbx),%rax
     b84:	48 c7 00 b7 00 00 00 	movq   $0xb7,(%rax)
     b8b:	48 8d 83 c0 05 00 00 	lea    0x5c0(%rbx),%rax
     b92:	48 c7 00 b8 00 00 00 	movq   $0xb8,(%rax)
     b99:	48 8d 83 c8 05 00 00 	lea    0x5c8(%rbx),%rax
     ba0:	48 c7 00 b9 00 00 00 	movq   $0xb9,(%rax)
     ba7:	48 8d 83 d0 05 00 00 	lea    0x5d0(%rbx),%rax
     bae:	48 c7 00 ba 00 00 00 	movq   $0xba,(%rax)
     bb5:	48 8d 83 d8 05 00 00 	lea    0x5d8(%rbx),%rax
     bbc:	48 c7 00 bb 00 00 00 	movq   $0xbb,(%rax)
     bc3:	48 8d 83 e0 05 00 00 	lea    0x5e0(%rbx),%rax
     bca:	48 c7 00 bc 00 00 00 	movq   $0xbc,(%rax)
     bd1:	48 8d 83 e8 05 00 00 	lea    0x5e8(%rbx),%rax
     bd8:	48 c7 00 bd 00 00 00 	movq   $0xbd,(%rax)
     bdf:	48 8d 83 f0 05 00 00 	lea    0x5f0(%rbx),%rax
     be6:	48 c7 00 be 00 00 00 	movq   $0xbe,(%rax)
     bed:	48 8d 83 f8 05 00 00 	lea    0x5f8(%rbx),%rax
     bf4:	48 c7 00 bf 00 00 00 	movq   $0xbf,(%rax)
     bfb:	48 8d 83 00 06 00 00 	lea    0x600(%rbx),%rax
     c02:	48 c7 00 c0 00 00 00 	movq   $0xc0,(%rax)
     c09:	48 8d 83 08 06 00 00 	lea    0x608(%rbx),%rax
     c10:	48 c7 00 c1 00 00 00 	movq   $0xc1,(%rax)
     c17:	48 8d 83 10 06 00 00 	lea    0x610(%rbx),%rax
     c1e:	48 c7 00 c2 00 00 00 	movq   $0xc2,(%rax)
     c25:	48 8d 83 18 06 00 00 	lea    0x618(%rbx),%rax
     c2c:	48 c7 00 c3 00 00 00 	movq   $0xc3,(%rax)
     c33:	48 8d 83 20 06 00 00 	lea    0x620(%rbx),%rax
     c3a:	48 c7 00 c4 00 00 00 	movq   $0xc4,(%rax)
     c41:	48 8d 83 28 06 00 00 	lea    0x628(%rbx),%rax
     c48:	48 c7 00 c5 00 00 00 	movq   $0xc5,(%rax)
     c4f:	48 8d 83 30 06 00 00 	lea    0x630(%rbx),%rax
     c56:	48 c7 00 c6 00 00 00 	movq   $0xc6,(%rax)
     c5d:	48 8d 83 38 06 00 00 	lea    0x638(%rbx),%rax
     c64:	48 c7 00 c7 00 00 00 	movq   $0xc7,(%rax)
     c6b:	48 8d 83 40 06 00 00 	lea    0x640(%rbx),%rax
     c72:	48 c7 00 c8 00 00 00 	movq   $0xc8,(%rax)
     c79:	48 8d 83 48 06 00 00 	lea    0x648(%rbx),%rax
     c80:	48 c7 00 c9 00 00 00 	movq   $0xc9,(%rax)
     c87:	48 8d 83 50 06 00 00 	lea    0x650(%rbx),%rax
     c8e:	48 c7 00 ca 00 00 00 	movq   $0xca,(%rax)
     c95:	48 8d 83 58 06 00 00 	lea    0x658(%rbx),%rax
     c9c:	48 c7 00 cb 00 00 00 	movq   $0xcb,(%rax)
     ca3:	48 8d 83 60 06 00 00 	lea    0x660(%rbx),%rax
     caa:	48 c7 00 cc 00 00 00 	movq   $0xcc,(%rax)
     cb1:	48 8d 83 68 06 00 00 	lea    0x668(%rbx),%rax
     cb8:	48 c7 00 cd 00 00 00 	movq   $0xcd,(%rax)
     cbf:	48 8d 83 70 06 00 00 	lea    0x670(%rbx),%rax
     cc6:	48 c7 00 ce 00 00 00 	movq   $0xce,(%rax)
     ccd:	48 8d 83 78 06 00 00 	lea    0x678(%rbx),%rax
     cd4:	48 c7 00 cf 00 00 00 	movq   $0xcf,(%rax)
     cdb:	48 8d 83 80 06 00 00 	lea    0x680(%rbx),%rax
     ce2:	48 c7 00 d0 00 00 00 	movq   $0xd0,(%rax)
     ce9:	48 8d 83 88 06 00 00 	lea    0x688(%rbx),%rax
     cf0:	48 c7 00 d1 00 00 00 	movq   $0xd1,(%rax)
     cf7:	48 8d 83 90 06 00 00 	lea    0x690(%rbx),%rax
     cfe:	48 c7 00 d2 00 00 00 	movq   $0xd2,(%rax)
     d05:	48 8d 83 98 06 00 00 	lea    0x698(%rbx),%rax
     d0c:	48 c7 00 d3 00 00 00 	movq   $0xd3,(%rax)
     d13:	48 8d 83 a0 06 00 00 	lea    0x6a0(%rbx),%rax
     d1a:	48 c7 00 d4 00 00 00 	movq   $0xd4,(%rax)
     d21:	48 8d 83 a8 06 00 00 	lea    0x6a8(%rbx),%rax
     d28:	48 c7 00 d5 00 00 00 	movq   $0xd5,(%rax)
     d2f:	48 8d 83 b0 06 00 00 	lea    0x6b0(%rbx),%rax
     d36:	48 c7 00 d6 00 00 00 	movq   $0xd6,(%rax)
     d3d:	48 8d 83 b8 06 00 00 	lea    0x6b8(%rbx),%rax
     d44:	48 c7 00 d7 00 00 00 	movq   $0xd7,(%rax)
     d4b:	48 8d 83 c0 06 00 00 	lea    0x6c0(%rbx),%rax
     d52:	48 c7 00 d8 00 00 00 	movq   $0xd8,(%rax)
     d59:	48 8d 83 c8 06 00 00 	lea    0x6c8(%rbx),%rax
     d60:	48 c7 00 d9 00 00 00 	movq   $0xd9,(%rax)
     d67:	48 8d 83 d0 06 00 00 	lea    0x6d0(%rbx),%rax
     d6e:	48 c7 00 da 00 00 00 	movq   $0xda,(%rax)
     d75:	48 8d 83 d8 06 00 00 	lea    0x6d8(%rbx),%rax
     d7c:	48 c7 00 db 00 00 00 	movq   $0xdb,(%rax)
     d83:	48 8d 83 e0 06 00 00 	lea    0x6e0(%rbx),%rax
     d8a:	48 c7 00 dc 00 00 00 	movq   $0xdc,(%rax)
     d91:	48 8d 83 e8 06 00 00 	lea    0x6e8(%rbx),%rax
     d98:	48 c7 00 dd 00 00 00 	movq   $0xdd,(%rax)
     d9f:	48 8d 83 f0 06 00 00 	lea    0x6f0(%rbx),%rax
     da6:	48 c7 00 de 00 00 00 	movq   $0xde,(%rax)
     dad:	48 8d 83 f8 06 00 00 	lea    0x6f8(%rbx),%rax
     db4:	48 c7 00 df 00 00 00 	movq   $0xdf,(%rax)
     dbb:	48 8d 83 00 07 00 00 	lea    0x700(%rbx),%rax
     dc2:	48 c7 00 e0 00 00 00 	movq   $0xe0,(%rax)
     dc9:	48 8d 83 08 07 00 00 	lea    0x708(%rbx),%rax
     dd0:	48 c7 00 e1 00 00 00 	movq   $0xe1,(%rax)
     dd7:	48 8d 83 10 07 00 00 	lea    0x710(%rbx),%rax
     dde:	48 c7 00 e2 00 00 00 	movq   $0xe2,(%rax)
     de5:	48 8d 83 18 07 00 00 	lea    0x718(%rbx),%rax
     dec:	48 c7 00 e3 00 00 00 	movq   $0xe3,(%rax)
     df3:	48 8d 83 20 07 00 00 	lea    0x720(%rbx),%rax
     dfa:	48 c7 00 e4 00 00 00 	movq   $0xe4,(%rax)
     e01:	48 8d 83 28 07 00 00 	lea    0x728(%rbx),%rax
     e08:	48 c7 00 e5 00 00 00 	movq   $0xe5,(%rax)
     e0f:	48 8d 83 30 07 00 00 	lea    0x730(%rbx),%rax
     e16:	48 c7 00 e6 00 00 00 	movq   $0xe6,(%rax)
     e1d:	48 8d 83 38 07 00 00 	lea    0x738(%rbx),%rax
     e24:	48 c7 00 e7 00 00 00 	movq   $0xe7,(%rax)
     e2b:	48 8d 83 40 07 00 00 	lea    0x740(%rbx),%rax
     e32:	48 c7 00 e8 00 00 00 	movq   $0xe8,(%rax)
     e39:	48 8d 83 48 07 00 00 	lea    0x748(%rbx),%rax
     e40:	48 c7 00 e9 00 00 00 	movq   $0xe9,(%rax)
     e47:	48 8d 83 50 07 00 00 	lea    0x750(%rbx),%rax
     e4e:	48 c7 00 ea 00 00 00 	movq   $0xea,(%rax)
     e55:	48 8d 83 58 07 00 00 	lea    0x758(%rbx),%rax
     e5c:	48 c7 00 eb 00 00 00 	movq   $0xeb,(%rax)
     e63:	48 8d 83 60 07 00 00 	lea    0x760(%rbx),%rax
     e6a:	48 c7 00 ec 00 00 00 	movq   $0xec,(%rax)
     e71:	48 8d 83 68 07 00 00 	lea    0x768(%rbx),%rax
     e78:	48 c7 00 ed 00 00 00 	movq   $0xed,(%rax)
     e7f:	48 8d 83 70 07 00 00 	lea    0x770(%rbx),%rax
     e86:	48 c7 00 ee 00 00 00 	movq   $0xee,(%rax)
     e8d:	48 8d 83 78 07 00 00 	lea    0x778(%rbx),%rax
     e94:	48 c7 00 ef 00 00 00 	movq   $0xef,(%rax)
     e9b:	48 8d 83 80 07 00 00 	lea    0x780(%rbx),%rax
     ea2:	48 c7 00 f0 00 00 00 	movq   $0xf0,(%rax)
     ea9:	48 8d 83 88 07 00 00 	lea    0x788(%rbx),%rax
     eb0:	48 c7 00 f1 00 00 00 	movq   $0xf1,(%rax)
     eb7:	48 8d 83 90 07 00 00 	lea    0x790(%rbx),%rax
     ebe:	48 c7 00 f2 00 00 00 	movq   $0xf2,(%rax)
     ec5:	48 8d 83 98 07 00 00 	lea    0x798(%rbx),%rax
     ecc:	48 c7 00 f3 00 00 00 	movq   $0xf3,(%rax)
     ed3:	48 8d 83 a0 07 00 00 	lea    0x7a0(%rbx),%rax
     eda:	48 c7 00 f4 00 00 00 	movq   $0xf4,(%rax)
     ee1:	48 8d 83 a8 07 00 00 	lea    0x7a8(%rbx),%rax
     ee8:	48 c7 00 f5 00 00 00 	movq   $0xf5,(%rax)
     eef:	48 8d 83 b0 07 00 00 	lea    0x7b0(%rbx),%rax
     ef6:	48 c7 00 f6 00 00 00 	movq   $0xf6,(%rax)
     efd:	48 8d 83 b8 07 00 00 	lea    0x7b8(%rbx),%rax
     f04:	48 c7 00 f7 00 00 00 	movq   $0xf7,(%rax)
     f0b:	48 8d 83 c0 07 00 00 	lea    0x7c0(%rbx),%rax
     f12:	48 c7 00 f8 00 00 00 	movq   $0xf8,(%rax)
     f19:	48 8d 83 c8 07 00 00 	lea    0x7c8(%rbx),%rax
     f20:	48 c7 00 f9 00 00 00 	movq   $0xf9,(%rax)
     f27:	48 8d 83 d0 07 00 00 	lea    0x7d0(%rbx),%rax
     f2e:	48 c7 00 fa 00 00 00 	movq   $0xfa,(%rax)
     f35:	48 8d 83 d8 07 00 00 	lea    0x7d8(%rbx),%rax
     f3c:	48 c7 00 fb 00 00 00 	movq   $0xfb,(%rax)
     f43:	48 8d 83 e0 07 00 00 	lea    0x7e0(%rbx),%rax
     f4a:	48 c7 00 fc 00 00 00 	movq   $0xfc,(%rax)
     f51:	48 8d 83 e8 07 00 00 	lea    0x7e8(%rbx),%rax
     f58:	48 c7 00 fd 00 00 00 	movq   $0xfd,(%rax)
     f5f:	48 8d 83 f0 07 00 00 	lea    0x7f0(%rbx),%rax
     f66:	48 c7 00 fe 00 00 00 	movq   $0xfe,(%rax)
     f6d:	48 8d 83 f8 07 00 00 	lea    0x7f8(%rbx),%rax
     f74:	48 c7 00 ff 00 00 00 	movq   $0xff,(%rax)
     f7b:	48 8d 83 00 08 00 00 	lea    0x800(%rbx),%rax
     f82:	48 c7 00 00 01 00 00 	movq   $0x100,(%rax)
     f89:	48 8d 83 08 08 00 00 	lea    0x808(%rbx),%rax
     f90:	48 c7 00 01 01 00 00 	movq   $0x101,(%rax)
     f97:	48 8d 83 10 08 00 00 	lea    0x810(%rbx),%rax
     f9e:	48 c7 00 02 01 00 00 	movq   $0x102,(%rax)
     fa5:	48 8d 83 18 08 00 00 	lea    0x818(%rbx),%rax
     fac:	48 c7 00 03 01 00 00 	movq   $0x103,(%rax)
     fb3:	48 8d 83 20 08 00 00 	lea    0x820(%rbx),%rax
     fba:	48 c7 00 04 01 00 00 	movq   $0x104,(%rax)
     fc1:	48 8d 83 28 08 00 00 	lea    0x828(%rbx),%rax
     fc8:	48 c7 00 05 01 00 00 	movq   $0x105,(%rax)
     fcf:	48 8d 83 30 08 00 00 	lea    0x830(%rbx),%rax
     fd6:	48 c7 00 06 01 00 00 	movq   $0x106,(%rax)
     fdd:	48 8d 83 38 08 00 00 	lea    0x838(%rbx),%rax
     fe4:	48 c7 00 07 01 00 00 	movq   $0x107,(%rax)
     feb:	48 8d 83 40 08 00 00 	lea    0x840(%rbx),%rax
     ff2:	48 c7 00 08 01 00 00 	movq   $0x108,(%rax)
     ff9:	48 8d 83 48 08 00 00 	lea    0x848(%rbx),%rax
    1000:	48 c7 00 09 01 00 00 	movq   $0x109,(%rax)
    1007:	48 8d 83 50 08 00 00 	lea    0x850(%rbx),%rax
    100e:	48 c7 00 0a 01 00 00 	movq   $0x10a,(%rax)
    1015:	48 8d 83 58 08 00 00 	lea    0x858(%rbx),%rax
    101c:	48 c7 00 0b 01 00 00 	movq   $0x10b,(%rax)
    1023:	48 8d 83 60 08 00 00 	lea    0x860(%rbx),%rax
    102a:	48 c7 00 0c 01 00 00 	movq   $0x10c,(%rax)
    1031:	48 8d 83 68 08 00 00 	lea    0x868(%rbx),%rax
    1038:	48 c7 00 0d 01 00 00 	movq   $0x10d,(%rax)
    103f:	48 8d 83 70 08 00 00 	lea    0x870(%rbx),%rax
    1046:	48 c7 00 0e 01 00 00 	movq   $0x10e,(%rax)
    104d:	48 8d 83 78 08 00 00 	lea    0x878(%rbx),%rax
    1054:	48 c7 00 0f 01 00 00 	movq   $0x10f,(%rax)
    105b:	48 8d 83 80 08 00 00 	lea    0x880(%rbx),%rax
    1062:	48 c7 00 10 01 00 00 	movq   $0x110,(%rax)
    1069:	48 8d 83 88 08 00 00 	lea    0x888(%rbx),%rax
    1070:	48 c7 00 11 01 00 00 	movq   $0x111,(%rax)
    1077:	48 8d 83 90 08 00 00 	lea    0x890(%rbx),%rax
    107e:	48 c7 00 12 01 00 00 	movq   $0x112,(%rax)
    1085:	48 8d 83 98 08 00 00 	lea    0x898(%rbx),%rax
    108c:	48 c7 00 13 01 00 00 	movq   $0x113,(%rax)
    1093:	48 8d 83 a0 08 00 00 	lea    0x8a0(%rbx),%rax
    109a:	48 c7 00 14 01 00 00 	movq   $0x114,(%rax)
    10a1:	48 8d 83 a8 08 00 00 	lea    0x8a8(%rbx),%rax
    10a8:	48 c7 00 15 01 00 00 	movq   $0x115,(%rax)
    10af:	48 8d 83 b0 08 00 00 	lea    0x8b0(%rbx),%rax
    10b6:	48 c7 00 16 01 00 00 	movq   $0x116,(%rax)
    10bd:	48 8d 83 b8 08 00 00 	lea    0x8b8(%rbx),%rax
    10c4:	48 c7 00 17 01 00 00 	movq   $0x117,(%rax)
    10cb:	48 8d 83 c0 08 00 00 	lea    0x8c0(%rbx),%rax
    10d2:	48 c7 00 18 01 00 00 	movq   $0x118,(%rax)
    10d9:	48 8d 83 c8 08 00 00 	lea    0x8c8(%rbx),%rax
    10e0:	48 c7 00 19 01 00 00 	movq   $0x119,(%rax)
    10e7:	48 8d 83 d0 08 00 00 	lea    0x8d0(%rbx),%rax
    10ee:	48 c7 00 1a 01 00 00 	movq   $0x11a,(%rax)
    10f5:	48 8d 83 d8 08 00 00 	lea    0x8d8(%rbx),%rax
    10fc:	48 c7 00 1b 01 00 00 	movq   $0x11b,(%rax)
    1103:	48 8d 83 e0 08 00 00 	lea    0x8e0(%rbx),%rax
    110a:	48 c7 00 1c 01 00 00 	movq   $0x11c,(%rax)
    1111:	48 8d 83 e8 08 00 00 	lea    0x8e8(%rbx),%rax
    1118:	48 c7 00 1d 01 00 00 	movq   $0x11d,(%rax)
    111f:	48 8d 83 f0 08 00 00 	lea    0x8f0(%rbx),%rax
    1126:	48 c7 00 1e 01 00 00 	movq   $0x11e,(%rax)
    112d:	48 8d 83 f8 08 00 00 	lea    0x8f8(%rbx),%rax
    1134:	48 c7 00 1f 01 00 00 	movq   $0x11f,(%rax)
    113b:	48 8d 83 00 09 00 00 	lea    0x900(%rbx),%rax
    1142:	48 c7 00 20 01 00 00 	movq   $0x120,(%rax)
    1149:	48 8d 83 08 09 00 00 	lea    0x908(%rbx),%rax
    1150:	48 c7 00 21 01 00 00 	movq   $0x121,(%rax)
    1157:	48 8d 83 10 09 00 00 	lea    0x910(%rbx),%rax
    115e:	48 c7 00 22 01 00 00 	movq   $0x122,(%rax)
    1165:	48 8d 83 18 09 00 00 	lea    0x918(%rbx),%rax
    116c:	48 c7 00 23 01 00 00 	movq   $0x123,(%rax)
    1173:	48 8d 83 20 09 00 00 	lea    0x920(%rbx),%rax
    117a:	48 c7 00 24 01 00 00 	movq   $0x124,(%rax)
    1181:	48 8d 83 28 09 00 00 	lea    0x928(%rbx),%rax
    1188:	48 c7 00 25 01 00 00 	movq   $0x125,(%rax)
    118f:	48 8d 83 30 09 00 00 	lea    0x930(%rbx),%rax
    1196:	48 c7 00 26 01 00 00 	movq   $0x126,(%rax)
    119d:	48 8d 83 38 09 00 00 	lea    0x938(%rbx),%rax
    11a4:	48 c7 00 27 01 00 00 	movq   $0x127,(%rax)
    11ab:	48 8d 83 40 09 00 00 	lea    0x940(%rbx),%rax
    11b2:	48 c7 00 28 01 00 00 	movq   $0x128,(%rax)
    11b9:	48 8d 83 48 09 00 00 	lea    0x948(%rbx),%rax
    11c0:	48 c7 00 29 01 00 00 	movq   $0x129,(%rax)
    11c7:	48 8d 83 50 09 00 00 	lea    0x950(%rbx),%rax
    11ce:	48 c7 00 2a 01 00 00 	movq   $0x12a,(%rax)
    11d5:	48 8d 83 58 09 00 00 	lea    0x958(%rbx),%rax
    11dc:	48 c7 00 2b 01 00 00 	movq   $0x12b,(%rax)
    11e3:	48 8d 83 60 09 00 00 	lea    0x960(%rbx),%rax
    11ea:	48 c7 00 2c 01 00 00 	movq   $0x12c,(%rax)
    11f1:	48 8d 83 68 09 00 00 	lea    0x968(%rbx),%rax
    11f8:	48 c7 00 2d 01 00 00 	movq   $0x12d,(%rax)
    11ff:	48 8d 83 70 09 00 00 	lea    0x970(%rbx),%rax
    1206:	48 c7 00 2e 01 00 00 	movq   $0x12e,(%rax)
    120d:	48 8d 83 78 09 00 00 	lea    0x978(%rbx),%rax
    1214:	48 c7 00 2f 01 00 00 	movq   $0x12f,(%rax)
    121b:	48 8d 83 80 09 00 00 	lea    0x980(%rbx),%rax
    1222:	48 c7 00 30 01 00 00 	movq   $0x130,(%rax)
    1229:	48 8d 83 88 09 00 00 	lea    0x988(%rbx),%rax
    1230:	48 c7 00 31 01 00 00 	movq   $0x131,(%rax)
    1237:	48 8d 83 90 09 00 00 	lea    0x990(%rbx),%rax
    123e:	48 c7 00 32 01 00 00 	movq   $0x132,(%rax)
    1245:	48 8d 83 98 09 00 00 	lea    0x998(%rbx),%rax
    124c:	48 c7 00 33 01 00 00 	movq   $0x133,(%rax)
    1253:	48 8d 83 a0 09 00 00 	lea    0x9a0(%rbx),%rax
    125a:	48 c7 00 34 01 00 00 	movq   $0x134,(%rax)
    1261:	48 8d 83 a8 09 00 00 	lea    0x9a8(%rbx),%rax
    1268:	48 c7 00 35 01 00 00 	movq   $0x135,(%rax)
    126f:	48 8d 83 b0 09 00 00 	lea    0x9b0(%rbx),%rax
    1276:	48 c7 00 36 01 00 00 	movq   $0x136,(%rax)
    127d:	48 8d 83 b8 09 00 00 	lea    0x9b8(%rbx),%rax
    1284:	48 c7 00 37 01 00 00 	movq   $0x137,(%rax)
    128b:	48 8d 83 c0 09 00 00 	lea    0x9c0(%rbx),%rax
    1292:	48 c7 00 38 01 00 00 	movq   $0x138,(%rax)
    1299:	48 8d 83 c8 09 00 00 	lea    0x9c8(%rbx),%rax
    12a0:	48 c7 00 39 01 00 00 	movq   $0x139,(%rax)
    12a7:	48 8d 83 d0 09 00 00 	lea    0x9d0(%rbx),%rax
    12ae:	48 c7 00 3a 01 00 00 	movq   $0x13a,(%rax)
    12b5:	48 8d 83 d8 09 00 00 	lea    0x9d8(%rbx),%rax
    12bc:	48 c7 00 3b 01 00 00 	movq   $0x13b,(%rax)
    12c3:	48 8d 83 e0 09 00 00 	lea    0x9e0(%rbx),%rax
    12ca:	48 c7 00 3c 01 00 00 	movq   $0x13c,(%rax)
    12d1:	48 8d 83 e8 09 00 00 	lea    0x9e8(%rbx),%rax
    12d8:	48 c7 00 3d 01 00 00 	movq   $0x13d,(%rax)
    12df:	48 8d 83 f0 09 00 00 	lea    0x9f0(%rbx),%rax
    12e6:	48 c7 00 3e 01 00 00 	movq   $0x13e,(%rax)
    12ed:	48 8d 83 f8 09 00 00 	lea    0x9f8(%rbx),%rax
    12f4:	48 c7 00 3f 01 00 00 	movq   $0x13f,(%rax)
    12fb:	48 8d 83 00 0a 00 00 	lea    0xa00(%rbx),%rax
    1302:	48 c7 00 40 01 00 00 	movq   $0x140,(%rax)
    1309:	48 8d 83 08 0a 00 00 	lea    0xa08(%rbx),%rax
    1310:	48 c7 00 41 01 00 00 	movq   $0x141,(%rax)
    1317:	48 8d 83 10 0a 00 00 	lea    0xa10(%rbx),%rax
    131e:	48 c7 00 42 01 00 00 	movq   $0x142,(%rax)
    1325:	48 8d 83 18 0a 00 00 	lea    0xa18(%rbx),%rax
    132c:	48 c7 00 43 01 00 00 	movq   $0x143,(%rax)
    1333:	48 8d 83 20 0a 00 00 	lea    0xa20(%rbx),%rax
    133a:	48 c7 00 44 01 00 00 	movq   $0x144,(%rax)
    1341:	48 8d 83 28 0a 00 00 	lea    0xa28(%rbx),%rax
    1348:	48 c7 00 45 01 00 00 	movq   $0x145,(%rax)
    134f:	48 8d 83 30 0a 00 00 	lea    0xa30(%rbx),%rax
    1356:	48 c7 00 46 01 00 00 	movq   $0x146,(%rax)
    135d:	48 8d 83 38 0a 00 00 	lea    0xa38(%rbx),%rax
    1364:	48 c7 00 47 01 00 00 	movq   $0x147,(%rax)
    136b:	48 8d 83 40 0a 00 00 	lea    0xa40(%rbx),%rax
    1372:	48 c7 00 48 01 00 00 	movq   $0x148,(%rax)
    1379:	48 8d 83 48 0a 00 00 	lea    0xa48(%rbx),%rax
    1380:	48 c7 00 49 01 00 00 	movq   $0x149,(%rax)
    1387:	48 8d 83 50 0a 00 00 	lea    0xa50(%rbx),%rax
    138e:	48 c7 00 4a 01 00 00 	movq   $0x14a,(%rax)
    1395:	48 8d 83 58 0a 00 00 	lea    0xa58(%rbx),%rax
    139c:	48 c7 00 4b 01 00 00 	movq   $0x14b,(%rax)
    13a3:	48 8d 83 60 0a 00 00 	lea    0xa60(%rbx),%rax
    13aa:	48 c7 00 4c 01 00 00 	movq   $0x14c,(%rax)
    13b1:	48 8d 83 68 0a 00 00 	lea    0xa68(%rbx),%rax
    13b8:	48 c7 00 4d 01 00 00 	movq   $0x14d,(%rax)
    13bf:	48 8d 83 70 0a 00 00 	lea    0xa70(%rbx),%rax
    13c6:	48 c7 00 4e 01 00 00 	movq   $0x14e,(%rax)
    13cd:	48 8d 83 78 0a 00 00 	lea    0xa78(%rbx),%rax
    13d4:	48 c7 00 4f 01 00 00 	movq   $0x14f,(%rax)
    13db:	48 8d 83 80 0a 00 00 	lea    0xa80(%rbx),%rax
    13e2:	48 c7 00 50 01 00 00 	movq   $0x150,(%rax)
    13e9:	48 8d 83 88 0a 00 00 	lea    0xa88(%rbx),%rax
    13f0:	48 c7 00 51 01 00 00 	movq   $0x151,(%rax)
    13f7:	48 8d 83 90 0a 00 00 	lea    0xa90(%rbx),%rax
    13fe:	48 c7 00 52 01 00 00 	movq   $0x152,(%rax)
    1405:	48 8d 83 98 0a 00 00 	lea    0xa98(%rbx),%rax
    140c:	48 c7 00 53 01 00 00 	movq   $0x153,(%rax)
    1413:	48 8d 83 a0 0a 00 00 	lea    0xaa0(%rbx),%rax
    141a:	48 c7 00 54 01 00 00 	movq   $0x154,(%rax)
    1421:	48 8d 83 a8 0a 00 00 	lea    0xaa8(%rbx),%rax
    1428:	48 c7 00 55 01 00 00 	movq   $0x155,(%rax)
    142f:	48 8d 83 b0 0a 00 00 	lea    0xab0(%rbx),%rax
    1436:	48 c7 00 56 01 00 00 	movq   $0x156,(%rax)
    143d:	48 8d 83 b8 0a 00 00 	lea    0xab8(%rbx),%rax
    1444:	48 c7 00 57 01 00 00 	movq   $0x157,(%rax)
    144b:	48 8d 83 c0 0a 00 00 	lea    0xac0(%rbx),%rax
    1452:	48 c7 00 58 01 00 00 	movq   $0x158,(%rax)
    1459:	48 8d 83 c8 0a 00 00 	lea    0xac8(%rbx),%rax
    1460:	48 c7 00 59 01 00 00 	movq   $0x159,(%rax)
    1467:	48 8d 83 d0 0a 00 00 	lea    0xad0(%rbx),%rax
    146e:	48 c7 00 5a 01 00 00 	movq   $0x15a,(%rax)
    1475:	48 8d 83 d8 0a 00 00 	lea    0xad8(%rbx),%rax
    147c:	48 c7 00 5b 01 00 00 	movq   $0x15b,(%rax)
    1483:	48 8d 83 e0 0a 00 00 	lea    0xae0(%rbx),%rax
    148a:	48 c7 00 5c 01 00 00 	movq   $0x15c,(%rax)
    1491:	48 8d 83 e8 0a 00 00 	lea    0xae8(%rbx),%rax
    1498:	48 c7 00 5d 01 00 00 	movq   $0x15d,(%rax)
    149f:	48 8d 83 f0 0a 00 00 	lea    0xaf0(%rbx),%rax
    14a6:	48 c7 00 5e 01 00 00 	movq   $0x15e,(%rax)
    14ad:	48 8d 83 f8 0a 00 00 	lea    0xaf8(%rbx),%rax
    14b4:	48 c7 00 5f 01 00 00 	movq   $0x15f,(%rax)
    14bb:	48 8d 83 00 0b 00 00 	lea    0xb00(%rbx),%rax
    14c2:	48 c7 00 60 01 00 00 	movq   $0x160,(%rax)
    14c9:	48 8d 83 08 0b 00 00 	lea    0xb08(%rbx),%rax
    14d0:	48 c7 00 61 01 00 00 	movq   $0x161,(%rax)
    14d7:	48 8d 83 10 0b 00 00 	lea    0xb10(%rbx),%rax
    14de:	48 c7 00 62 01 00 00 	movq   $0x162,(%rax)
    14e5:	48 8d 83 18 0b 00 00 	lea    0xb18(%rbx),%rax
    14ec:	48 c7 00 63 01 00 00 	movq   $0x163,(%rax)
    14f3:	48 8d 83 20 0b 00 00 	lea    0xb20(%rbx),%rax
    14fa:	48 c7 00 64 01 00 00 	movq   $0x164,(%rax)
    1501:	48 8d 83 28 0b 00 00 	lea    0xb28(%rbx),%rax
    1508:	48 c7 00 65 01 00 00 	movq   $0x165,(%rax)
    150f:	48 8d 83 30 0b 00 00 	lea    0xb30(%rbx),%rax
    1516:	48 c7 00 66 01 00 00 	movq   $0x166,(%rax)
    151d:	48 8d 83 38 0b 00 00 	lea    0xb38(%rbx),%rax
    1524:	48 c7 00 67 01 00 00 	movq   $0x167,(%rax)
    152b:	48 8d 83 40 0b 00 00 	lea    0xb40(%rbx),%rax
    1532:	48 c7 00 68 01 00 00 	movq   $0x168,(%rax)
    1539:	48 8d 83 48 0b 00 00 	lea    0xb48(%rbx),%rax
    1540:	48 c7 00 69 01 00 00 	movq   $0x169,(%rax)
    1547:	48 8d 83 50 0b 00 00 	lea    0xb50(%rbx),%rax
    154e:	48 c7 00 6a 01 00 00 	movq   $0x16a,(%rax)
    1555:	48 8d 83 58 0b 00 00 	lea    0xb58(%rbx),%rax
    155c:	48 c7 00 6b 01 00 00 	movq   $0x16b,(%rax)
    1563:	48 8d 83 60 0b 00 00 	lea    0xb60(%rbx),%rax
    156a:	48 c7 00 6c 01 00 00 	movq   $0x16c,(%rax)
    1571:	48 8d 83 68 0b 00 00 	lea    0xb68(%rbx),%rax
    1578:	48 c7 00 6d 01 00 00 	movq   $0x16d,(%rax)
    157f:	48 8d 83 70 0b 00 00 	lea    0xb70(%rbx),%rax
    1586:	48 c7 00 6e 01 00 00 	movq   $0x16e,(%rax)
    158d:	48 8d 83 78 0b 00 00 	lea    0xb78(%rbx),%rax
    1594:	48 c7 00 6f 01 00 00 	movq   $0x16f,(%rax)
    159b:	48 8d 83 80 0b 00 00 	lea    0xb80(%rbx),%rax
    15a2:	48 c7 00 70 01 00 00 	movq   $0x170,(%rax)
    15a9:	48 8d 83 88 0b 00 00 	lea    0xb88(%rbx),%rax
    15b0:	48 c7 00 71 01 00 00 	movq   $0x171,(%rax)
    15b7:	48 8d 83 90 0b 00 00 	lea    0xb90(%rbx),%rax
    15be:	48 c7 00 72 01 00 00 	movq   $0x172,(%rax)
    15c5:	48 8d 83 98 0b 00 00 	lea    0xb98(%rbx),%rax
    15cc:	48 c7 00 73 01 00 00 	movq   $0x173,(%rax)
    15d3:	48 8d 83 a0 0b 00 00 	lea    0xba0(%rbx),%rax
    15da:	48 c7 00 74 01 00 00 	movq   $0x174,(%rax)
    15e1:	48 8d 83 a8 0b 00 00 	lea    0xba8(%rbx),%rax
    15e8:	48 c7 00 75 01 00 00 	movq   $0x175,(%rax)
    15ef:	48 8d 83 b0 0b 00 00 	lea    0xbb0(%rbx),%rax
    15f6:	48 c7 00 76 01 00 00 	movq   $0x176,(%rax)
    15fd:	48 8d 83 b8 0b 00 00 	lea    0xbb8(%rbx),%rax
    1604:	48 c7 00 77 01 00 00 	movq   $0x177,(%rax)
    160b:	48 8d 83 c0 0b 00 00 	lea    0xbc0(%rbx),%rax
    1612:	48 c7 00 78 01 00 00 	movq   $0x178,(%rax)
    1619:	48 8d 83 c8 0b 00 00 	lea    0xbc8(%rbx),%rax
    1620:	48 c7 00 79 01 00 00 	movq   $0x179,(%rax)
    1627:	48 8d 83 d0 0b 00 00 	lea    0xbd0(%rbx),%rax
    162e:	48 c7 00 7a 01 00 00 	movq   $0x17a,(%rax)
    1635:	48 8d 83 d8 0b 00 00 	lea    0xbd8(%rbx),%rax
    163c:	48 c7 00 7b 01 00 00 	movq   $0x17b,(%rax)
    1643:	48 8d 83 e0 0b 00 00 	lea    0xbe0(%rbx),%rax
    164a:	48 c7 00 7c 01 00 00 	movq   $0x17c,(%rax)
    1651:	48 8d 83 e8 0b 00 00 	lea    0xbe8(%rbx),%rax
    1658:	48 c7 00 7d 01 00 00 	movq   $0x17d,(%rax)
    165f:	48 8d 83 f0 0b 00 00 	lea    0xbf0(%rbx),%rax
    1666:	48 c7 00 7e 01 00 00 	movq   $0x17e,(%rax)
    166d:	48 8d 83 f8 0b 00 00 	lea    0xbf8(%rbx),%rax
    1674:	48 c7 00 7f 01 00 00 	movq   $0x17f,(%rax)
    167b:	48 8d 83 00 0c 00 00 	lea    0xc00(%rbx),%rax
    1682:	48 c7 00 80 01 00 00 	movq   $0x180,(%rax)
    1689:	48 8d 83 08 0c 00 00 	lea    0xc08(%rbx),%rax
    1690:	48 c7 00 81 01 00 00 	movq   $0x181,(%rax)
    1697:	48 8d 83 10 0c 00 00 	lea    0xc10(%rbx),%rax
    169e:	48 c7 00 82 01 00 00 	movq   $0x182,(%rax)
    16a5:	48 8d 83 18 0c 00 00 	lea    0xc18(%rbx),%rax
    16ac:	48 c7 00 83 01 00 00 	movq   $0x183,(%rax)
    16b3:	48 8d 83 20 0c 00 00 	lea    0xc20(%rbx),%rax
    16ba:	48 c7 00 84 01 00 00 	movq   $0x184,(%rax)
    16c1:	48 8d 83 28 0c 00 00 	lea    0xc28(%rbx),%rax
    16c8:	48 c7 00 85 01 00 00 	movq   $0x185,(%rax)
    16cf:	48 8d 83 30 0c 00 00 	lea    0xc30(%rbx),%rax
    16d6:	48 c7 00 86 01 00 00 	movq   $0x186,(%rax)
    16dd:	48 8d 83 38 0c 00 00 	lea    0xc38(%rbx),%rax
    16e4:	48 c7 00 87 01 00 00 	movq   $0x187,(%rax)
    16eb:	48 8d 83 40 0c 00 00 	lea    0xc40(%rbx),%rax
    16f2:	48 c7 00 88 01 00 00 	movq   $0x188,(%rax)
    16f9:	48 8d 83 48 0c 00 00 	lea    0xc48(%rbx),%rax
    1700:	48 c7 00 89 01 00 00 	movq   $0x189,(%rax)
    1707:	48 8d 83 50 0c 00 00 	lea    0xc50(%rbx),%rax
    170e:	48 c7 00 8a 01 00 00 	movq   $0x18a,(%rax)
    1715:	48 8d 83 58 0c 00 00 	lea    0xc58(%rbx),%rax
    171c:	48 c7 00 8b 01 00 00 	movq   $0x18b,(%rax)
    1723:	48 8d 83 60 0c 00 00 	lea    0xc60(%rbx),%rax
    172a:	48 c7 00 8c 01 00 00 	movq   $0x18c,(%rax)
    1731:	48 8d 83 68 0c 00 00 	lea    0xc68(%rbx),%rax
    1738:	48 c7 00 8d 01 00 00 	movq   $0x18d,(%rax)
    173f:	48 8d 83 70 0c 00 00 	lea    0xc70(%rbx),%rax
    1746:	48 c7 00 8e 01 00 00 	movq   $0x18e,(%rax)
    174d:	48 8d 83 78 0c 00 00 	lea    0xc78(%rbx),%rax
    1754:	48 c7 00 8f 01 00 00 	movq   $0x18f,(%rax)
    175b:	48 8d 83 80 0c 00 00 	lea    0xc80(%rbx),%rax
    1762:	48 c7 00 90 01 00 00 	movq   $0x190,(%rax)
    1769:	48 8d 83 88 0c 00 00 	lea    0xc88(%rbx),%rax
    1770:	48 c7 00 91 01 00 00 	movq   $0x191,(%rax)
    1777:	48 8d 83 90 0c 00 00 	lea    0xc90(%rbx),%rax
    177e:	48 c7 00 92 01 00 00 	movq   $0x192,(%rax)
    1785:	48 8d 83 98 0c 00 00 	lea    0xc98(%rbx),%rax
    178c:	48 c7 00 93 01 00 00 	movq   $0x193,(%rax)
    1793:	48 8d 83 a0 0c 00 00 	lea    0xca0(%rbx),%rax
    179a:	48 c7 00 94 01 00 00 	movq   $0x194,(%rax)
    17a1:	48 8d 83 a8 0c 00 00 	lea    0xca8(%rbx),%rax
    17a8:	48 c7 00 95 01 00 00 	movq   $0x195,(%rax)
    17af:	48 8d 83 b0 0c 00 00 	lea    0xcb0(%rbx),%rax
    17b6:	48 c7 00 96 01 00 00 	movq   $0x196,(%rax)
    17bd:	48 8d 83 b8 0c 00 00 	lea    0xcb8(%rbx),%rax
    17c4:	48 c7 00 97 01 00 00 	movq   $0x197,(%rax)
    17cb:	48 8d 83 c0 0c 00 00 	lea    0xcc0(%rbx),%rax
    17d2:	48 c7 00 98 01 00 00 	movq   $0x198,(%rax)
    17d9:	48 8d 83 c8 0c 00 00 	lea    0xcc8(%rbx),%rax
    17e0:	48 c7 00 99 01 00 00 	movq   $0x199,(%rax)
    17e7:	48 8d 83 d0 0c 00 00 	lea    0xcd0(%rbx),%rax
    17ee:	48 c7 00 9a 01 00 00 	movq   $0x19a,(%rax)
    17f5:	48 8d 83 d8 0c 00 00 	lea    0xcd8(%rbx),%rax
    17fc:	48 c7 00 9b 01 00 00 	movq   $0x19b,(%rax)
    1803:	48 8d 83 e0 0c 00 00 	lea    0xce0(%rbx),%rax
    180a:	48 c7 00 9c 01 00 00 	movq   $0x19c,(%rax)
    1811:	48 8d 83 e8 0c 00 00 	lea    0xce8(%rbx),%rax
    1818:	48 c7 00 9d 01 00 00 	movq   $0x19d,(%rax)
    181f:	48 8d 83 f0 0c 00 00 	lea    0xcf0(%rbx),%rax
    1826:	48 c7 00 9e 01 00 00 	movq   $0x19e,(%rax)
    182d:	48 8d 83 f8 0c 00 00 	lea    0xcf8(%rbx),%rax
    1834:	48 c7 00 9f 01 00 00 	movq   $0x19f,(%rax)
    183b:	48 8d 83 00 0d 00 00 	lea    0xd00(%rbx),%rax
    1842:	48 c7 00 a0 01 00 00 	movq   $0x1a0,(%rax)
    1849:	48 8d 83 08 0d 00 00 	lea    0xd08(%rbx),%rax
    1850:	48 c7 00 a1 01 00 00 	movq   $0x1a1,(%rax)
    1857:	48 8d 83 10 0d 00 00 	lea    0xd10(%rbx),%rax
    185e:	48 c7 00 a2 01 00 00 	movq   $0x1a2,(%rax)
    1865:	48 8d 83 18 0d 00 00 	lea    0xd18(%rbx),%rax
    186c:	48 c7 00 a3 01 00 00 	movq   $0x1a3,(%rax)
    1873:	48 8d 83 20 0d 00 00 	lea    0xd20(%rbx),%rax
    187a:	48 c7 00 a4 01 00 00 	movq   $0x1a4,(%rax)
    1881:	48 8d 83 28 0d 00 00 	lea    0xd28(%rbx),%rax
    1888:	48 c7 00 a5 01 00 00 	movq   $0x1a5,(%rax)
    188f:	48 8d 83 30 0d 00 00 	lea    0xd30(%rbx),%rax
    1896:	48 c7 00 a6 01 00 00 	movq   $0x1a6,(%rax)
    189d:	48 8d 83 38 0d 00 00 	lea    0xd38(%rbx),%rax
    18a4:	48 c7 00 a7 01 00 00 	movq   $0x1a7,(%rax)
    18ab:	48 8d 83 40 0d 00 00 	lea    0xd40(%rbx),%rax
    18b2:	48 c7 00 a8 01 00 00 	movq   $0x1a8,(%rax)
    18b9:	48 8d 83 48 0d 00 00 	lea    0xd48(%rbx),%rax
    18c0:	48 c7 00 a9 01 00 00 	movq   $0x1a9,(%rax)
    18c7:	48 8d 83 50 0d 00 00 	lea    0xd50(%rbx),%rax
    18ce:	48 c7 00 aa 01 00 00 	movq   $0x1aa,(%rax)
    18d5:	48 8d 83 58 0d 00 00 	lea    0xd58(%rbx),%rax
    18dc:	48 c7 00 ab 01 00 00 	movq   $0x1ab,(%rax)
    18e3:	48 8d 83 60 0d 00 00 	lea    0xd60(%rbx),%rax
    18ea:	48 c7 00 ac 01 00 00 	movq   $0x1ac,(%rax)
    18f1:	48 8d 83 68 0d 00 00 	lea    0xd68(%rbx),%rax
    18f8:	48 c7 00 ad 01 00 00 	movq   $0x1ad,(%rax)
    18ff:	48 8d 83 70 0d 00 00 	lea    0xd70(%rbx),%rax
    1906:	48 c7 00 ae 01 00 00 	movq   $0x1ae,(%rax)
    190d:	48 8d 83 78 0d 00 00 	lea    0xd78(%rbx),%rax
    1914:	48 c7 00 af 01 00 00 	movq   $0x1af,(%rax)
    191b:	48 8d 83 80 0d 00 00 	lea    0xd80(%rbx),%rax
    1922:	48 c7 00 b0 01 00 00 	movq   $0x1b0,(%rax)
    1929:	48 8d 83 88 0d 00 00 	lea    0xd88(%rbx),%rax
    1930:	48 c7 00 b1 01 00 00 	movq   $0x1b1,(%rax)
    1937:	48 8d 83 90 0d 00 00 	lea    0xd90(%rbx),%rax
    193e:	48 c7 00 b2 01 00 00 	movq   $0x1b2,(%rax)
    1945:	48 8d 83 98 0d 00 00 	lea    0xd98(%rbx),%rax
    194c:	48 c7 00 b3 01 00 00 	movq   $0x1b3,(%rax)
    1953:	48 8d 83 a0 0d 00 00 	lea    0xda0(%rbx),%rax
    195a:	48 c7 00 b4 01 00 00 	movq   $0x1b4,(%rax)
    1961:	48 8d 83 a8 0d 00 00 	lea    0xda8(%rbx),%rax
    1968:	48 c7 00 b5 01 00 00 	movq   $0x1b5,(%rax)
    196f:	48 8d 83 b0 0d 00 00 	lea    0xdb0(%rbx),%rax
    1976:	48 c7 00 b6 01 00 00 	movq   $0x1b6,(%rax)
    197d:	48 8d 83 b8 0d 00 00 	lea    0xdb8(%rbx),%rax
    1984:	48 c7 00 b7 01 00 00 	movq   $0x1b7,(%rax)
    198b:	48 8d 83 c0 0d 00 00 	lea    0xdc0(%rbx),%rax
    1992:	48 c7 00 b8 01 00 00 	movq   $0x1b8,(%rax)
    1999:	48 8d 83 c8 0d 00 00 	lea    0xdc8(%rbx),%rax
    19a0:	48 c7 00 b9 01 00 00 	movq   $0x1b9,(%rax)
    19a7:	48 8d 83 d0 0d 00 00 	lea    0xdd0(%rbx),%rax
    19ae:	48 c7 00 ba 01 00 00 	movq   $0x1ba,(%rax)
    19b5:	48 8d 83 d8 0d 00 00 	lea    0xdd8(%rbx),%rax
    19bc:	48 c7 00 bb 01 00 00 	movq   $0x1bb,(%rax)
    19c3:	48 8d 83 e0 0d 00 00 	lea    0xde0(%rbx),%rax
    19ca:	48 c7 00 bc 01 00 00 	movq   $0x1bc,(%rax)
    19d1:	48 8d 83 e8 0d 00 00 	lea    0xde8(%rbx),%rax
    19d8:	48 c7 00 bd 01 00 00 	movq   $0x1bd,(%rax)
    19df:	48 8d 83 f0 0d 00 00 	lea    0xdf0(%rbx),%rax
    19e6:	48 c7 00 be 01 00 00 	movq   $0x1be,(%rax)
    19ed:	48 8d 83 f8 0d 00 00 	lea    0xdf8(%rbx),%rax
    19f4:	48 c7 00 bf 01 00 00 	movq   $0x1bf,(%rax)
    19fb:	48 8d 83 00 0e 00 00 	lea    0xe00(%rbx),%rax
    1a02:	48 c7 00 c0 01 00 00 	movq   $0x1c0,(%rax)
    1a09:	48 8d 83 08 0e 00 00 	lea    0xe08(%rbx),%rax
    1a10:	48 c7 00 c1 01 00 00 	movq   $0x1c1,(%rax)
    1a17:	48 8d 83 10 0e 00 00 	lea    0xe10(%rbx),%rax
    1a1e:	48 c7 00 c2 01 00 00 	movq   $0x1c2,(%rax)
    1a25:	48 8d 83 18 0e 00 00 	lea    0xe18(%rbx),%rax
    1a2c:	48 c7 00 c3 01 00 00 	movq   $0x1c3,(%rax)
    1a33:	48 8d 83 20 0e 00 00 	lea    0xe20(%rbx),%rax
    1a3a:	48 c7 00 c4 01 00 00 	movq   $0x1c4,(%rax)
    1a41:	48 8d 83 28 0e 00 00 	lea    0xe28(%rbx),%rax
    1a48:	48 c7 00 c5 01 00 00 	movq   $0x1c5,(%rax)
    1a4f:	48 8d 83 30 0e 00 00 	lea    0xe30(%rbx),%rax
    1a56:	48 c7 00 c6 01 00 00 	movq   $0x1c6,(%rax)
    1a5d:	48 8d 83 38 0e 00 00 	lea    0xe38(%rbx),%rax
    1a64:	48 c7 00 c7 01 00 00 	movq   $0x1c7,(%rax)
    1a6b:	48 8d 83 40 0e 00 00 	lea    0xe40(%rbx),%rax
    1a72:	48 c7 00 c8 01 00 00 	movq   $0x1c8,(%rax)
    1a79:	48 8d 83 48 0e 00 00 	lea    0xe48(%rbx),%rax
    1a80:	48 c7 00 c9 01 00 00 	movq   $0x1c9,(%rax)
    1a87:	48 8d 83 50 0e 00 00 	lea    0xe50(%rbx),%rax
    1a8e:	48 c7 00 ca 01 00 00 	movq   $0x1ca,(%rax)
    1a95:	48 8d 83 58 0e 00 00 	lea    0xe58(%rbx),%rax
    1a9c:	48 c7 00 cb 01 00 00 	movq   $0x1cb,(%rax)
    1aa3:	48 8d 83 60 0e 00 00 	lea    0xe60(%rbx),%rax
    1aaa:	48 c7 00 cc 01 00 00 	movq   $0x1cc,(%rax)
    1ab1:	48 8d 83 68 0e 00 00 	lea    0xe68(%rbx),%rax
    1ab8:	48 c7 00 cd 01 00 00 	movq   $0x1cd,(%rax)
    1abf:	48 8d 83 70 0e 00 00 	lea    0xe70(%rbx),%rax
    1ac6:	48 c7 00 ce 01 00 00 	movq   $0x1ce,(%rax)
    1acd:	48 8d 83 78 0e 00 00 	lea    0xe78(%rbx),%rax
    1ad4:	48 c7 00 cf 01 00 00 	movq   $0x1cf,(%rax)
    1adb:	48 8d 83 80 0e 00 00 	lea    0xe80(%rbx),%rax
    1ae2:	48 c7 00 d0 01 00 00 	movq   $0x1d0,(%rax)
    1ae9:	48 8d 83 88 0e 00 00 	lea    0xe88(%rbx),%rax
    1af0:	48 c7 00 d1 01 00 00 	movq   $0x1d1,(%rax)
    1af7:	48 8d 83 90 0e 00 00 	lea    0xe90(%rbx),%rax
    1afe:	48 c7 00 d2 01 00 00 	movq   $0x1d2,(%rax)
    1b05:	48 8d 83 98 0e 00 00 	lea    0xe98(%rbx),%rax
    1b0c:	48 c7 00 d3 01 00 00 	movq   $0x1d3,(%rax)
    1b13:	48 8d 83 a0 0e 00 00 	lea    0xea0(%rbx),%rax
    1b1a:	48 c7 00 d4 01 00 00 	movq   $0x1d4,(%rax)
    1b21:	48 8d 83 a8 0e 00 00 	lea    0xea8(%rbx),%rax
    1b28:	48 c7 00 d5 01 00 00 	movq   $0x1d5,(%rax)
    1b2f:	48 8d 83 b0 0e 00 00 	lea    0xeb0(%rbx),%rax
    1b36:	48 c7 00 d6 01 00 00 	movq   $0x1d6,(%rax)
    1b3d:	48 8d 83 b8 0e 00 00 	lea    0xeb8(%rbx),%rax
    1b44:	48 c7 00 d7 01 00 00 	movq   $0x1d7,(%rax)
    1b4b:	48 8d 83 c0 0e 00 00 	lea    0xec0(%rbx),%rax
    1b52:	48 c7 00 d8 01 00 00 	movq   $0x1d8,(%rax)
    1b59:	48 8d 83 c8 0e 00 00 	lea    0xec8(%rbx),%rax
    1b60:	48 c7 00 d9 01 00 00 	movq   $0x1d9,(%rax)
    1b67:	48 8d 83 d0 0e 00 00 	lea    0xed0(%rbx),%rax
    1b6e:	48 c7 00 da 01 00 00 	movq   $0x1da,(%rax)
    1b75:	48 8d 83 d8 0e 00 00 	lea    0xed8(%rbx),%rax
    1b7c:	48 c7 00 db 01 00 00 	movq   $0x1db,(%rax)
    1b83:	48 8d 83 e0 0e 00 00 	lea    0xee0(%rbx),%rax
    1b8a:	48 c7 00 dc 01 00 00 	movq   $0x1dc,(%rax)
    1b91:	48 8d 83 e8 0e 00 00 	lea    0xee8(%rbx),%rax
    1b98:	48 c7 00 dd 01 00 00 	movq   $0x1dd,(%rax)
    1b9f:	48 8d 83 f0 0e 00 00 	lea    0xef0(%rbx),%rax
    1ba6:	48 c7 00 de 01 00 00 	movq   $0x1de,(%rax)
    1bad:	48 8d 83 f8 0e 00 00 	lea    0xef8(%rbx),%rax
    1bb4:	48 c7 00 df 01 00 00 	movq   $0x1df,(%rax)
    1bbb:	48 8d 83 00 0f 00 00 	lea    0xf00(%rbx),%rax
    1bc2:	48 c7 00 e0 01 00 00 	movq   $0x1e0,(%rax)
    1bc9:	48 8d 83 08 0f 00 00 	lea    0xf08(%rbx),%rax
    1bd0:	48 c7 00 e1 01 00 00 	movq   $0x1e1,(%rax)
    1bd7:	48 8d 83 10 0f 00 00 	lea    0xf10(%rbx),%rax
    1bde:	48 c7 00 e2 01 00 00 	movq   $0x1e2,(%rax)
    1be5:	48 8d 83 18 0f 00 00 	lea    0xf18(%rbx),%rax
    1bec:	48 c7 00 e3 01 00 00 	movq   $0x1e3,(%rax)
    1bf3:	48 8d 83 20 0f 00 00 	lea    0xf20(%rbx),%rax
    1bfa:	48 c7 00 e4 01 00 00 	movq   $0x1e4,(%rax)
    1c01:	48 8d 83 28 0f 00 00 	lea    0xf28(%rbx),%rax
    1c08:	48 c7 00 e5 01 00 00 	movq   $0x1e5,(%rax)
    1c0f:	48 8d 83 30 0f 00 00 	lea    0xf30(%rbx),%rax
    1c16:	48 c7 00 e6 01 00 00 	movq   $0x1e6,(%rax)
    1c1d:	48 8d 83 38 0f 00 00 	lea    0xf38(%rbx),%rax
    1c24:	48 c7 00 e7 01 00 00 	movq   $0x1e7,(%rax)
    1c2b:	48 8d 83 40 0f 00 00 	lea    0xf40(%rbx),%rax
    1c32:	48 c7 00 e8 01 00 00 	movq   $0x1e8,(%rax)
    1c39:	48 8d 83 48 0f 00 00 	lea    0xf48(%rbx),%rax
    1c40:	48 c7 00 e9 01 00 00 	movq   $0x1e9,(%rax)
    1c47:	48 8d 83 50 0f 00 00 	lea    0xf50(%rbx),%rax
    1c4e:	48 c7 00 ea 01 00 00 	movq   $0x1ea,(%rax)
    1c55:	48 8d 83 58 0f 00 00 	lea    0xf58(%rbx),%rax
    1c5c:	48 c7 00 eb 01 00 00 	movq   $0x1eb,(%rax)
    1c63:	48 8d 83 60 0f 00 00 	lea    0xf60(%rbx),%rax
    1c6a:	48 c7 00 ec 01 00 00 	movq   $0x1ec,(%rax)
    1c71:	48 8d 83 68 0f 00 00 	lea    0xf68(%rbx),%rax
    1c78:	48 c7 00 ed 01 00 00 	movq   $0x1ed,(%rax)
    1c7f:	48 8d 83 70 0f 00 00 	lea    0xf70(%rbx),%rax
    1c86:	48 c7 00 ee 01 00 00 	movq   $0x1ee,(%rax)
    1c8d:	48 8d 83 78 0f 00 00 	lea    0xf78(%rbx),%rax
    1c94:	48 c7 00 ef 01 00 00 	movq   $0x1ef,(%rax)
    1c9b:	48 8d 83 80 0f 00 00 	lea    0xf80(%rbx),%rax
    1ca2:	48 c7 00 f0 01 00 00 	movq   $0x1f0,(%rax)
    1ca9:	48 8d 83 88 0f 00 00 	lea    0xf88(%rbx),%rax
    1cb0:	48 c7 00 f1 01 00 00 	movq   $0x1f1,(%rax)
    1cb7:	48 8d 83 90 0f 00 00 	lea    0xf90(%rbx),%rax
    1cbe:	48 c7 00 f2 01 00 00 	movq   $0x1f2,(%rax)
    1cc5:	48 8d 83 98 0f 00 00 	lea    0xf98(%rbx),%rax
    1ccc:	48 c7 00 f3 01 00 00 	movq   $0x1f3,(%rax)
    1cd3:	48 8d 83 a0 0f 00 00 	lea    0xfa0(%rbx),%rax
    1cda:	48 c7 00 f4 01 00 00 	movq   $0x1f4,(%rax)
    1ce1:	48 8d 83 a8 0f 00 00 	lea    0xfa8(%rbx),%rax
    1ce8:	48 c7 00 f5 01 00 00 	movq   $0x1f5,(%rax)
    1cef:	48 8d 83 b0 0f 00 00 	lea    0xfb0(%rbx),%rax
    1cf6:	48 c7 00 f6 01 00 00 	movq   $0x1f6,(%rax)
    1cfd:	48 8d 83 b8 0f 00 00 	lea    0xfb8(%rbx),%rax
    1d04:	48 c7 00 f7 01 00 00 	movq   $0x1f7,(%rax)
    1d0b:	48 8d 83 c0 0f 00 00 	lea    0xfc0(%rbx),%rax
    1d12:	48 c7 00 f8 01 00 00 	movq   $0x1f8,(%rax)
    1d19:	48 8d 83 c8 0f 00 00 	lea    0xfc8(%rbx),%rax
    1d20:	48 c7 00 f9 01 00 00 	movq   $0x1f9,(%rax)
    1d27:	48 8d 83 d0 0f 00 00 	lea    0xfd0(%rbx),%rax
    1d2e:	48 c7 00 fa 01 00 00 	movq   $0x1fa,(%rax)
    1d35:	48 8d 83 d8 0f 00 00 	lea    0xfd8(%rbx),%rax
    1d3c:	48 c7 00 fb 01 00 00 	movq   $0x1fb,(%rax)
    1d43:	48 8d 83 e0 0f 00 00 	lea    0xfe0(%rbx),%rax
    1d4a:	48 c7 00 fc 01 00 00 	movq   $0x1fc,(%rax)
    1d51:	48 8d 83 e8 0f 00 00 	lea    0xfe8(%rbx),%rax
    1d58:	48 c7 00 fd 01 00 00 	movq   $0x1fd,(%rax)
    1d5f:	48 8d 83 f0 0f 00 00 	lea    0xff0(%rbx),%rax
    1d66:	48 c7 00 fe 01 00 00 	movq   $0x1fe,(%rax)
    1d6d:	48 8d 83 f8 0f 00 00 	lea    0xff8(%rbx),%rax
    1d74:	48 c7 00 ff 01 00 00 	movq   $0x1ff,(%rax)
    1d7b:	48 8d 83 00 10 00 00 	lea    0x1000(%rbx),%rax
    1d82:	48 c7 00 00 02 00 00 	movq   $0x200,(%rax)
    1d89:	48 8d 83 08 10 00 00 	lea    0x1008(%rbx),%rax
    1d90:	48 c7 00 01 02 00 00 	movq   $0x201,(%rax)
    1d97:	48 8d 83 10 10 00 00 	lea    0x1010(%rbx),%rax
    1d9e:	48 c7 00 02 02 00 00 	movq   $0x202,(%rax)
    1da5:	48 8d 83 18 10 00 00 	lea    0x1018(%rbx),%rax
    1dac:	48 c7 00 03 02 00 00 	movq   $0x203,(%rax)
    1db3:	48 8d 83 20 10 00 00 	lea    0x1020(%rbx),%rax
    1dba:	48 c7 00 04 02 00 00 	movq   $0x204,(%rax)
    1dc1:	48 8d 83 28 10 00 00 	lea    0x1028(%rbx),%rax
    1dc8:	48 c7 00 05 02 00 00 	movq   $0x205,(%rax)
    1dcf:	48 8d 83 30 10 00 00 	lea    0x1030(%rbx),%rax
    1dd6:	48 c7 00 06 02 00 00 	movq   $0x206,(%rax)
    1ddd:	48 8d 83 38 10 00 00 	lea    0x1038(%rbx),%rax
    1de4:	48 c7 00 07 02 00 00 	movq   $0x207,(%rax)
    1deb:	48 8d 83 40 10 00 00 	lea    0x1040(%rbx),%rax
    1df2:	48 c7 00 08 02 00 00 	movq   $0x208,(%rax)
    1df9:	48 8d 83 48 10 00 00 	lea    0x1048(%rbx),%rax
    1e00:	48 c7 00 09 02 00 00 	movq   $0x209,(%rax)
    1e07:	48 8d 83 50 10 00 00 	lea    0x1050(%rbx),%rax
    1e0e:	48 c7 00 0a 02 00 00 	movq   $0x20a,(%rax)
    1e15:	48 8d 83 58 10 00 00 	lea    0x1058(%rbx),%rax
    1e1c:	48 c7 00 0b 02 00 00 	movq   $0x20b,(%rax)
    1e23:	48 8d 83 60 10 00 00 	lea    0x1060(%rbx),%rax
    1e2a:	48 c7 00 0c 02 00 00 	movq   $0x20c,(%rax)
    1e31:	48 8d 83 68 10 00 00 	lea    0x1068(%rbx),%rax
    1e38:	48 c7 00 0d 02 00 00 	movq   $0x20d,(%rax)
    1e3f:	48 8d 83 70 10 00 00 	lea    0x1070(%rbx),%rax
    1e46:	48 c7 00 0e 02 00 00 	movq   $0x20e,(%rax)
    1e4d:	48 8d 83 78 10 00 00 	lea    0x1078(%rbx),%rax
    1e54:	48 c7 00 0f 02 00 00 	movq   $0x20f,(%rax)
    1e5b:	48 8d 83 80 10 00 00 	lea    0x1080(%rbx),%rax
    1e62:	48 c7 00 10 02 00 00 	movq   $0x210,(%rax)
    1e69:	48 8d 83 88 10 00 00 	lea    0x1088(%rbx),%rax
    1e70:	48 c7 00 11 02 00 00 	movq   $0x211,(%rax)
    1e77:	48 8d 83 90 10 00 00 	lea    0x1090(%rbx),%rax
    1e7e:	48 c7 00 12 02 00 00 	movq   $0x212,(%rax)
    1e85:	48 8d 83 98 10 00 00 	lea    0x1098(%rbx),%rax
    1e8c:	48 c7 00 13 02 00 00 	movq   $0x213,(%rax)
    1e93:	48 8d 83 a0 10 00 00 	lea    0x10a0(%rbx),%rax
    1e9a:	48 c7 00 14 02 00 00 	movq   $0x214,(%rax)
    1ea1:	48 8d 83 a8 10 00 00 	lea    0x10a8(%rbx),%rax
    1ea8:	48 c7 00 15 02 00 00 	movq   $0x215,(%rax)
    1eaf:	48 8d 83 b0 10 00 00 	lea    0x10b0(%rbx),%rax
    1eb6:	48 c7 00 16 02 00 00 	movq   $0x216,(%rax)
    1ebd:	48 8d 83 b8 10 00 00 	lea    0x10b8(%rbx),%rax
    1ec4:	48 c7 00 17 02 00 00 	movq   $0x217,(%rax)
    1ecb:	48 8d 83 c0 10 00 00 	lea    0x10c0(%rbx),%rax
    1ed2:	48 c7 00 18 02 00 00 	movq   $0x218,(%rax)
    1ed9:	48 8d 83 c8 10 00 00 	lea    0x10c8(%rbx),%rax
    1ee0:	48 c7 00 19 02 00 00 	movq   $0x219,(%rax)
    1ee7:	48 8d 83 d0 10 00 00 	lea    0x10d0(%rbx),%rax
    1eee:	48 c7 00 1a 02 00 00 	movq   $0x21a,(%rax)
    1ef5:	48 8d 83 d8 10 00 00 	lea    0x10d8(%rbx),%rax
    1efc:	48 c7 00 1b 02 00 00 	movq   $0x21b,(%rax)
    1f03:	48 8d 83 e0 10 00 00 	lea    0x10e0(%rbx),%rax
    1f0a:	48 c7 00 1c 02 00 00 	movq   $0x21c,(%rax)
    1f11:	48 8d 83 e8 10 00 00 	lea    0x10e8(%rbx),%rax
    1f18:	48 c7 00 1d 02 00 00 	movq   $0x21d,(%rax)
    1f1f:	48 8d 83 f0 10 00 00 	lea    0x10f0(%rbx),%rax
    1f26:	48 c7 00 1e 02 00 00 	movq   $0x21e,(%rax)
    1f2d:	48 8d 83 f8 10 00 00 	lea    0x10f8(%rbx),%rax
    1f34:	48 c7 00 1f 02 00 00 	movq   $0x21f,(%rax)
    1f3b:	48 8d 83 00 11 00 00 	lea    0x1100(%rbx),%rax
    1f42:	48 c7 00 20 02 00 00 	movq   $0x220,(%rax)
    1f49:	48 8d 83 08 11 00 00 	lea    0x1108(%rbx),%rax
    1f50:	48 c7 00 21 02 00 00 	movq   $0x221,(%rax)
    1f57:	48 8d 83 10 11 00 00 	lea    0x1110(%rbx),%rax
    1f5e:	48 c7 00 22 02 00 00 	movq   $0x222,(%rax)
    1f65:	48 8d 83 18 11 00 00 	lea    0x1118(%rbx),%rax
    1f6c:	48 c7 00 23 02 00 00 	movq   $0x223,(%rax)
    1f73:	48 8d 83 20 11 00 00 	lea    0x1120(%rbx),%rax
    1f7a:	48 c7 00 24 02 00 00 	movq   $0x224,(%rax)
    1f81:	48 8d 83 28 11 00 00 	lea    0x1128(%rbx),%rax
    1f88:	48 c7 00 25 02 00 00 	movq   $0x225,(%rax)
    1f8f:	48 8d 83 30 11 00 00 	lea    0x1130(%rbx),%rax
    1f96:	48 c7 00 26 02 00 00 	movq   $0x226,(%rax)
    1f9d:	48 8d 83 38 11 00 00 	lea    0x1138(%rbx),%rax
    1fa4:	48 c7 00 27 02 00 00 	movq   $0x227,(%rax)
    1fab:	48 8d 83 40 11 00 00 	lea    0x1140(%rbx),%rax
    1fb2:	48 c7 00 28 02 00 00 	movq   $0x228,(%rax)
    1fb9:	48 8d 83 48 11 00 00 	lea    0x1148(%rbx),%rax
    1fc0:	48 c7 00 29 02 00 00 	movq   $0x229,(%rax)
    1fc7:	48 8d 83 50 11 00 00 	lea    0x1150(%rbx),%rax
    1fce:	48 c7 00 2a 02 00 00 	movq   $0x22a,(%rax)
    1fd5:	48 8d 83 58 11 00 00 	lea    0x1158(%rbx),%rax
    1fdc:	48 c7 00 2b 02 00 00 	movq   $0x22b,(%rax)
    1fe3:	48 8d 83 60 11 00 00 	lea    0x1160(%rbx),%rax
    1fea:	48 c7 00 2c 02 00 00 	movq   $0x22c,(%rax)
    1ff1:	48 8d 83 68 11 00 00 	lea    0x1168(%rbx),%rax
    1ff8:	48 c7 00 2d 02 00 00 	movq   $0x22d,(%rax)
    1fff:	48 8d 83 70 11 00 00 	lea    0x1170(%rbx),%rax
    2006:	48 c7 00 2e 02 00 00 	movq   $0x22e,(%rax)
    200d:	48 8d 83 78 11 00 00 	lea    0x1178(%rbx),%rax
    2014:	48 c7 00 2f 02 00 00 	movq   $0x22f,(%rax)
    201b:	48 8d 83 80 11 00 00 	lea    0x1180(%rbx),%rax
    2022:	48 c7 00 30 02 00 00 	movq   $0x230,(%rax)
    2029:	48 8d 83 88 11 00 00 	lea    0x1188(%rbx),%rax
    2030:	48 c7 00 31 02 00 00 	movq   $0x231,(%rax)
    2037:	48 8d 83 90 11 00 00 	lea    0x1190(%rbx),%rax
    203e:	48 c7 00 32 02 00 00 	movq   $0x232,(%rax)
    2045:	48 8d 83 98 11 00 00 	lea    0x1198(%rbx),%rax
    204c:	48 c7 00 33 02 00 00 	movq   $0x233,(%rax)
    2053:	48 8d 83 a0 11 00 00 	lea    0x11a0(%rbx),%rax
    205a:	48 c7 00 34 02 00 00 	movq   $0x234,(%rax)
    2061:	48 8d 83 a8 11 00 00 	lea    0x11a8(%rbx),%rax
    2068:	48 c7 00 35 02 00 00 	movq   $0x235,(%rax)
    206f:	48 8d 83 b0 11 00 00 	lea    0x11b0(%rbx),%rax
    2076:	48 c7 00 36 02 00 00 	movq   $0x236,(%rax)
    207d:	48 8d 83 b8 11 00 00 	lea    0x11b8(%rbx),%rax
    2084:	48 c7 00 37 02 00 00 	movq   $0x237,(%rax)
    208b:	48 8d 83 c0 11 00 00 	lea    0x11c0(%rbx),%rax
    2092:	48 c7 00 38 02 00 00 	movq   $0x238,(%rax)
    2099:	48 8d 83 c8 11 00 00 	lea    0x11c8(%rbx),%rax
    20a0:	48 c7 00 39 02 00 00 	movq   $0x239,(%rax)
    20a7:	48 8d 83 d0 11 00 00 	lea    0x11d0(%rbx),%rax
    20ae:	48 c7 00 3a 02 00 00 	movq   $0x23a,(%rax)
    20b5:	48 8d 83 d8 11 00 00 	lea    0x11d8(%rbx),%rax
    20bc:	48 c7 00 3b 02 00 00 	movq   $0x23b,(%rax)
    20c3:	48 8d 83 e0 11 00 00 	lea    0x11e0(%rbx),%rax
    20ca:	48 c7 00 3c 02 00 00 	movq   $0x23c,(%rax)
    20d1:	48 8d 83 e8 11 00 00 	lea    0x11e8(%rbx),%rax
    20d8:	48 c7 00 3d 02 00 00 	movq   $0x23d,(%rax)
    20df:	48 8d 83 f0 11 00 00 	lea    0x11f0(%rbx),%rax
    20e6:	48 c7 00 3e 02 00 00 	movq   $0x23e,(%rax)
    20ed:	48 8d 83 f8 11 00 00 	lea    0x11f8(%rbx),%rax
    20f4:	48 c7 00 3f 02 00 00 	movq   $0x23f,(%rax)
    20fb:	48 8d 83 00 12 00 00 	lea    0x1200(%rbx),%rax
    2102:	48 c7 00 40 02 00 00 	movq   $0x240,(%rax)
    2109:	48 8d 83 08 12 00 00 	lea    0x1208(%rbx),%rax
    2110:	48 c7 00 41 02 00 00 	movq   $0x241,(%rax)
    2117:	48 8d 83 10 12 00 00 	lea    0x1210(%rbx),%rax
    211e:	48 c7 00 42 02 00 00 	movq   $0x242,(%rax)
    2125:	48 8d 83 18 12 00 00 	lea    0x1218(%rbx),%rax
    212c:	48 c7 00 43 02 00 00 	movq   $0x243,(%rax)
    2133:	48 8d 83 20 12 00 00 	lea    0x1220(%rbx),%rax
    213a:	48 c7 00 44 02 00 00 	movq   $0x244,(%rax)
    2141:	48 8d 83 28 12 00 00 	lea    0x1228(%rbx),%rax
    2148:	48 c7 00 45 02 00 00 	movq   $0x245,(%rax)
    214f:	48 8d 83 30 12 00 00 	lea    0x1230(%rbx),%rax
    2156:	48 c7 00 46 02 00 00 	movq   $0x246,(%rax)
    215d:	48 8d 83 38 12 00 00 	lea    0x1238(%rbx),%rax
    2164:	48 c7 00 47 02 00 00 	movq   $0x247,(%rax)
    216b:	48 8d 83 40 12 00 00 	lea    0x1240(%rbx),%rax
    2172:	48 c7 00 48 02 00 00 	movq   $0x248,(%rax)
    2179:	48 8d 83 48 12 00 00 	lea    0x1248(%rbx),%rax
    2180:	48 c7 00 49 02 00 00 	movq   $0x249,(%rax)
    2187:	48 8d 83 50 12 00 00 	lea    0x1250(%rbx),%rax
    218e:	48 c7 00 4a 02 00 00 	movq   $0x24a,(%rax)
    2195:	48 8d 83 58 12 00 00 	lea    0x1258(%rbx),%rax
    219c:	48 c7 00 4b 02 00 00 	movq   $0x24b,(%rax)
    21a3:	48 8d 83 60 12 00 00 	lea    0x1260(%rbx),%rax
    21aa:	48 c7 00 4c 02 00 00 	movq   $0x24c,(%rax)
    21b1:	48 8d 83 68 12 00 00 	lea    0x1268(%rbx),%rax
    21b8:	48 c7 00 4d 02 00 00 	movq   $0x24d,(%rax)
    21bf:	48 8d 83 70 12 00 00 	lea    0x1270(%rbx),%rax
    21c6:	48 c7 00 4e 02 00 00 	movq   $0x24e,(%rax)
    21cd:	48 8d 83 78 12 00 00 	lea    0x1278(%rbx),%rax
    21d4:	48 c7 00 4f 02 00 00 	movq   $0x24f,(%rax)
    21db:	48 8d 83 80 12 00 00 	lea    0x1280(%rbx),%rax
    21e2:	48 c7 00 50 02 00 00 	movq   $0x250,(%rax)
    21e9:	48 8d 83 88 12 00 00 	lea    0x1288(%rbx),%rax
    21f0:	48 c7 00 51 02 00 00 	movq   $0x251,(%rax)
    21f7:	48 8d 83 90 12 00 00 	lea    0x1290(%rbx),%rax
    21fe:	48 c7 00 52 02 00 00 	movq   $0x252,(%rax)
    2205:	48 8d 83 98 12 00 00 	lea    0x1298(%rbx),%rax
    220c:	48 c7 00 53 02 00 00 	movq   $0x253,(%rax)
    2213:	48 8d 83 a0 12 00 00 	lea    0x12a0(%rbx),%rax
    221a:	48 c7 00 54 02 00 00 	movq   $0x254,(%rax)
    2221:	48 8d 83 a8 12 00 00 	lea    0x12a8(%rbx),%rax
    2228:	48 c7 00 55 02 00 00 	movq   $0x255,(%rax)
    222f:	48 8d 83 b0 12 00 00 	lea    0x12b0(%rbx),%rax
    2236:	48 c7 00 56 02 00 00 	movq   $0x256,(%rax)
    223d:	48 8d 83 b8 12 00 00 	lea    0x12b8(%rbx),%rax
    2244:	48 c7 00 57 02 00 00 	movq   $0x257,(%rax)
    224b:	48 8d 83 c0 12 00 00 	lea    0x12c0(%rbx),%rax
    2252:	48 c7 00 58 02 00 00 	movq   $0x258,(%rax)
    2259:	48 8d 83 c8 12 00 00 	lea    0x12c8(%rbx),%rax
    2260:	48 c7 00 59 02 00 00 	movq   $0x259,(%rax)
    2267:	48 8d 83 d0 12 00 00 	lea    0x12d0(%rbx),%rax
    226e:	48 c7 00 5a 02 00 00 	movq   $0x25a,(%rax)
    2275:	48 8d 83 d8 12 00 00 	lea    0x12d8(%rbx),%rax
    227c:	48 c7 00 5b 02 00 00 	movq   $0x25b,(%rax)
    2283:	48 8d 83 e0 12 00 00 	lea    0x12e0(%rbx),%rax
    228a:	48 c7 00 5c 02 00 00 	movq   $0x25c,(%rax)
    2291:	48 8d 83 e8 12 00 00 	lea    0x12e8(%rbx),%rax
    2298:	48 c7 00 5d 02 00 00 	movq   $0x25d,(%rax)
    229f:	48 8d 83 f0 12 00 00 	lea    0x12f0(%rbx),%rax
    22a6:	48 c7 00 5e 02 00 00 	movq   $0x25e,(%rax)
    22ad:	48 8d 83 f8 12 00 00 	lea    0x12f8(%rbx),%rax
    22b4:	48 c7 00 5f 02 00 00 	movq   $0x25f,(%rax)
    22bb:	48 8d 83 00 13 00 00 	lea    0x1300(%rbx),%rax
    22c2:	48 c7 00 60 02 00 00 	movq   $0x260,(%rax)
    22c9:	48 8d 83 08 13 00 00 	lea    0x1308(%rbx),%rax
    22d0:	48 c7 00 61 02 00 00 	movq   $0x261,(%rax)
    22d7:	48 8d 83 10 13 00 00 	lea    0x1310(%rbx),%rax
    22de:	48 c7 00 62 02 00 00 	movq   $0x262,(%rax)
    22e5:	48 8d 83 18 13 00 00 	lea    0x1318(%rbx),%rax
    22ec:	48 c7 00 63 02 00 00 	movq   $0x263,(%rax)
    22f3:	48 8d 83 20 13 00 00 	lea    0x1320(%rbx),%rax
    22fa:	48 c7 00 64 02 00 00 	movq   $0x264,(%rax)
    2301:	48 8d 83 28 13 00 00 	lea    0x1328(%rbx),%rax
    2308:	48 c7 00 65 02 00 00 	movq   $0x265,(%rax)
    230f:	48 8d 83 30 13 00 00 	lea    0x1330(%rbx),%rax
    2316:	48 c7 00 66 02 00 00 	movq   $0x266,(%rax)
    231d:	48 8d 83 38 13 00 00 	lea    0x1338(%rbx),%rax
    2324:	48 c7 00 67 02 00 00 	movq   $0x267,(%rax)
    232b:	48 8d 83 40 13 00 00 	lea    0x1340(%rbx),%rax
    2332:	48 c7 00 68 02 00 00 	movq   $0x268,(%rax)
    2339:	48 8d 83 48 13 00 00 	lea    0x1348(%rbx),%rax
    2340:	48 c7 00 69 02 00 00 	movq   $0x269,(%rax)
    2347:	48 8d 83 50 13 00 00 	lea    0x1350(%rbx),%rax
    234e:	48 c7 00 6a 02 00 00 	movq   $0x26a,(%rax)
    2355:	48 8d 83 58 13 00 00 	lea    0x1358(%rbx),%rax
    235c:	48 c7 00 6b 02 00 00 	movq   $0x26b,(%rax)
    2363:	48 8d 83 60 13 00 00 	lea    0x1360(%rbx),%rax
    236a:	48 c7 00 6c 02 00 00 	movq   $0x26c,(%rax)
    2371:	48 8d 83 68 13 00 00 	lea    0x1368(%rbx),%rax
    2378:	48 c7 00 6d 02 00 00 	movq   $0x26d,(%rax)
    237f:	48 8d 83 70 13 00 00 	lea    0x1370(%rbx),%rax
    2386:	48 c7 00 6e 02 00 00 	movq   $0x26e,(%rax)
    238d:	48 8d 83 78 13 00 00 	lea    0x1378(%rbx),%rax
    2394:	48 c7 00 6f 02 00 00 	movq   $0x26f,(%rax)
    239b:	48 8d 83 80 13 00 00 	lea    0x1380(%rbx),%rax
    23a2:	48 c7 00 70 02 00 00 	movq   $0x270,(%rax)
    23a9:	48 8d 83 88 13 00 00 	lea    0x1388(%rbx),%rax
    23b0:	48 c7 00 71 02 00 00 	movq   $0x271,(%rax)
    23b7:	48 8d 83 90 13 00 00 	lea    0x1390(%rbx),%rax
    23be:	48 c7 00 72 02 00 00 	movq   $0x272,(%rax)
    23c5:	48 8d 83 98 13 00 00 	lea    0x1398(%rbx),%rax
    23cc:	48 c7 00 73 02 00 00 	movq   $0x273,(%rax)
    23d3:	48 8d 83 a0 13 00 00 	lea    0x13a0(%rbx),%rax
    23da:	48 c7 00 74 02 00 00 	movq   $0x274,(%rax)
    23e1:	48 8d 83 a8 13 00 00 	lea    0x13a8(%rbx),%rax
    23e8:	48 c7 00 75 02 00 00 	movq   $0x275,(%rax)
    23ef:	48 8d 83 b0 13 00 00 	lea    0x13b0(%rbx),%rax
    23f6:	48 c7 00 76 02 00 00 	movq   $0x276,(%rax)
    23fd:	48 8d 83 b8 13 00 00 	lea    0x13b8(%rbx),%rax
    2404:	48 c7 00 77 02 00 00 	movq   $0x277,(%rax)
    240b:	48 8d 83 c0 13 00 00 	lea    0x13c0(%rbx),%rax
    2412:	48 c7 00 78 02 00 00 	movq   $0x278,(%rax)
    2419:	48 8d 83 c8 13 00 00 	lea    0x13c8(%rbx),%rax
    2420:	48 c7 00 79 02 00 00 	movq   $0x279,(%rax)
    2427:	48 8d 83 d0 13 00 00 	lea    0x13d0(%rbx),%rax
    242e:	48 c7 00 7a 02 00 00 	movq   $0x27a,(%rax)
    2435:	48 8d 83 d8 13 00 00 	lea    0x13d8(%rbx),%rax
    243c:	48 c7 00 7b 02 00 00 	movq   $0x27b,(%rax)
    2443:	48 8d 83 e0 13 00 00 	lea    0x13e0(%rbx),%rax
    244a:	48 c7 00 7c 02 00 00 	movq   $0x27c,(%rax)
    2451:	48 8d 83 e8 13 00 00 	lea    0x13e8(%rbx),%rax
    2458:	48 c7 00 7d 02 00 00 	movq   $0x27d,(%rax)
    245f:	48 8d 83 f0 13 00 00 	lea    0x13f0(%rbx),%rax
    2466:	48 c7 00 7e 02 00 00 	movq   $0x27e,(%rax)
    246d:	48 8d 83 f8 13 00 00 	lea    0x13f8(%rbx),%rax
    2474:	48 c7 00 7f 02 00 00 	movq   $0x27f,(%rax)
    247b:	48 8d 83 00 14 00 00 	lea    0x1400(%rbx),%rax
    2482:	48 c7 00 80 02 00 00 	movq   $0x280,(%rax)
    2489:	48 8d 83 08 14 00 00 	lea    0x1408(%rbx),%rax
    2490:	48 c7 00 81 02 00 00 	movq   $0x281,(%rax)
    2497:	48 8d 83 10 14 00 00 	lea    0x1410(%rbx),%rax
    249e:	48 c7 00 82 02 00 00 	movq   $0x282,(%rax)
    24a5:	48 8d 83 18 14 00 00 	lea    0x1418(%rbx),%rax
    24ac:	48 c7 00 83 02 00 00 	movq   $0x283,(%rax)
    24b3:	48 8d 83 20 14 00 00 	lea    0x1420(%rbx),%rax
    24ba:	48 c7 00 84 02 00 00 	movq   $0x284,(%rax)
    24c1:	48 8d 83 28 14 00 00 	lea    0x1428(%rbx),%rax
    24c8:	48 c7 00 85 02 00 00 	movq   $0x285,(%rax)
    24cf:	48 8d 83 30 14 00 00 	lea    0x1430(%rbx),%rax
    24d6:	48 c7 00 86 02 00 00 	movq   $0x286,(%rax)
    24dd:	48 8d 83 38 14 00 00 	lea    0x1438(%rbx),%rax
    24e4:	48 c7 00 87 02 00 00 	movq   $0x287,(%rax)
    24eb:	48 8d 83 40 14 00 00 	lea    0x1440(%rbx),%rax
    24f2:	48 c7 00 88 02 00 00 	movq   $0x288,(%rax)
    24f9:	48 8d 83 48 14 00 00 	lea    0x1448(%rbx),%rax
    2500:	48 c7 00 89 02 00 00 	movq   $0x289,(%rax)
    2507:	48 8d 83 50 14 00 00 	lea    0x1450(%rbx),%rax
    250e:	48 c7 00 8a 02 00 00 	movq   $0x28a,(%rax)
    2515:	48 8d 83 58 14 00 00 	lea    0x1458(%rbx),%rax
    251c:	48 c7 00 8b 02 00 00 	movq   $0x28b,(%rax)
    2523:	48 8d 83 60 14 00 00 	lea    0x1460(%rbx),%rax
    252a:	48 c7 00 8c 02 00 00 	movq   $0x28c,(%rax)
    2531:	48 8d 83 68 14 00 00 	lea    0x1468(%rbx),%rax
    2538:	48 c7 00 8d 02 00 00 	movq   $0x28d,(%rax)
    253f:	48 8d 83 70 14 00 00 	lea    0x1470(%rbx),%rax
    2546:	48 c7 00 8e 02 00 00 	movq   $0x28e,(%rax)
    254d:	48 8d 83 78 14 00 00 	lea    0x1478(%rbx),%rax
    2554:	48 c7 00 8f 02 00 00 	movq   $0x28f,(%rax)
    255b:	48 8d 83 80 14 00 00 	lea    0x1480(%rbx),%rax
    2562:	48 c7 00 90 02 00 00 	movq   $0x290,(%rax)
    2569:	48 8d 83 88 14 00 00 	lea    0x1488(%rbx),%rax
    2570:	48 c7 00 91 02 00 00 	movq   $0x291,(%rax)
    2577:	48 8d 83 90 14 00 00 	lea    0x1490(%rbx),%rax
    257e:	48 c7 00 92 02 00 00 	movq   $0x292,(%rax)
    2585:	48 8d 83 98 14 00 00 	lea    0x1498(%rbx),%rax
    258c:	48 c7 00 93 02 00 00 	movq   $0x293,(%rax)
    2593:	48 8d 83 a0 14 00 00 	lea    0x14a0(%rbx),%rax
    259a:	48 c7 00 94 02 00 00 	movq   $0x294,(%rax)
    25a1:	48 8d 83 a8 14 00 00 	lea    0x14a8(%rbx),%rax
    25a8:	48 c7 00 95 02 00 00 	movq   $0x295,(%rax)
    25af:	48 8d 83 b0 14 00 00 	lea    0x14b0(%rbx),%rax
    25b6:	48 c7 00 96 02 00 00 	movq   $0x296,(%rax)
    25bd:	48 8d 83 b8 14 00 00 	lea    0x14b8(%rbx),%rax
    25c4:	48 c7 00 97 02 00 00 	movq   $0x297,(%rax)
    25cb:	48 8d 83 c0 14 00 00 	lea    0x14c0(%rbx),%rax
    25d2:	48 c7 00 98 02 00 00 	movq   $0x298,(%rax)
    25d9:	48 8d 83 c8 14 00 00 	lea    0x14c8(%rbx),%rax
    25e0:	48 c7 00 99 02 00 00 	movq   $0x299,(%rax)
    25e7:	48 8d 83 d0 14 00 00 	lea    0x14d0(%rbx),%rax
    25ee:	48 c7 00 9a 02 00 00 	movq   $0x29a,(%rax)
    25f5:	48 8d 83 d8 14 00 00 	lea    0x14d8(%rbx),%rax
    25fc:	48 c7 00 9b 02 00 00 	movq   $0x29b,(%rax)
    2603:	48 8d 83 e0 14 00 00 	lea    0x14e0(%rbx),%rax
    260a:	48 c7 00 9c 02 00 00 	movq   $0x29c,(%rax)
    2611:	48 8d 83 e8 14 00 00 	lea    0x14e8(%rbx),%rax
    2618:	48 c7 00 9d 02 00 00 	movq   $0x29d,(%rax)
    261f:	48 8d 83 f0 14 00 00 	lea    0x14f0(%rbx),%rax
    2626:	48 c7 00 9e 02 00 00 	movq   $0x29e,(%rax)
    262d:	48 8d 83 f8 14 00 00 	lea    0x14f8(%rbx),%rax
    2634:	48 c7 00 9f 02 00 00 	movq   $0x29f,(%rax)
    263b:	48 8d 83 00 15 00 00 	lea    0x1500(%rbx),%rax
    2642:	48 c7 00 a0 02 00 00 	movq   $0x2a0,(%rax)
    2649:	48 8d 83 08 15 00 00 	lea    0x1508(%rbx),%rax
    2650:	48 c7 00 a1 02 00 00 	movq   $0x2a1,(%rax)
    2657:	48 8d 83 10 15 00 00 	lea    0x1510(%rbx),%rax
    265e:	48 c7 00 a2 02 00 00 	movq   $0x2a2,(%rax)
    2665:	48 8d 83 18 15 00 00 	lea    0x1518(%rbx),%rax
    266c:	48 c7 00 a3 02 00 00 	movq   $0x2a3,(%rax)
    2673:	48 8d 83 20 15 00 00 	lea    0x1520(%rbx),%rax
    267a:	48 c7 00 a4 02 00 00 	movq   $0x2a4,(%rax)
    2681:	48 8d 83 28 15 00 00 	lea    0x1528(%rbx),%rax
    2688:	48 c7 00 a5 02 00 00 	movq   $0x2a5,(%rax)
    268f:	48 8d 83 30 15 00 00 	lea    0x1530(%rbx),%rax
    2696:	48 c7 00 a6 02 00 00 	movq   $0x2a6,(%rax)
    269d:	48 8d 83 38 15 00 00 	lea    0x1538(%rbx),%rax
    26a4:	48 c7 00 a7 02 00 00 	movq   $0x2a7,(%rax)
    26ab:	48 8d 83 40 15 00 00 	lea    0x1540(%rbx),%rax
    26b2:	48 c7 00 a8 02 00 00 	movq   $0x2a8,(%rax)
    26b9:	48 8d 83 48 15 00 00 	lea    0x1548(%rbx),%rax
    26c0:	48 c7 00 a9 02 00 00 	movq   $0x2a9,(%rax)
    26c7:	48 8d 83 50 15 00 00 	lea    0x1550(%rbx),%rax
    26ce:	48 c7 00 aa 02 00 00 	movq   $0x2aa,(%rax)
    26d5:	48 8d 83 58 15 00 00 	lea    0x1558(%rbx),%rax
    26dc:	48 c7 00 ab 02 00 00 	movq   $0x2ab,(%rax)
    26e3:	48 8d 83 60 15 00 00 	lea    0x1560(%rbx),%rax
    26ea:	48 c7 00 ac 02 00 00 	movq   $0x2ac,(%rax)
    26f1:	48 8d 83 68 15 00 00 	lea    0x1568(%rbx),%rax
    26f8:	48 c7 00 ad 02 00 00 	movq   $0x2ad,(%rax)
    26ff:	48 8d 83 70 15 00 00 	lea    0x1570(%rbx),%rax
    2706:	48 c7 00 ae 02 00 00 	movq   $0x2ae,(%rax)
    270d:	48 8d 83 78 15 00 00 	lea    0x1578(%rbx),%rax
    2714:	48 c7 00 af 02 00 00 	movq   $0x2af,(%rax)
    271b:	48 8d 83 80 15 00 00 	lea    0x1580(%rbx),%rax
    2722:	48 c7 00 b0 02 00 00 	movq   $0x2b0,(%rax)
    2729:	48 8d 83 88 15 00 00 	lea    0x1588(%rbx),%rax
    2730:	48 c7 00 b1 02 00 00 	movq   $0x2b1,(%rax)
    2737:	48 8d 83 90 15 00 00 	lea    0x1590(%rbx),%rax
    273e:	48 c7 00 b2 02 00 00 	movq   $0x2b2,(%rax)
    2745:	48 8d 83 98 15 00 00 	lea    0x1598(%rbx),%rax
    274c:	48 c7 00 b3 02 00 00 	movq   $0x2b3,(%rax)
    2753:	48 8d 83 a0 15 00 00 	lea    0x15a0(%rbx),%rax
    275a:	48 c7 00 b4 02 00 00 	movq   $0x2b4,(%rax)
    2761:	48 8d 83 a8 15 00 00 	lea    0x15a8(%rbx),%rax
    2768:	48 c7 00 b5 02 00 00 	movq   $0x2b5,(%rax)
    276f:	48 8d 83 b0 15 00 00 	lea    0x15b0(%rbx),%rax
    2776:	48 c7 00 b6 02 00 00 	movq   $0x2b6,(%rax)
    277d:	48 8d 83 b8 15 00 00 	lea    0x15b8(%rbx),%rax
    2784:	48 c7 00 b7 02 00 00 	movq   $0x2b7,(%rax)
    278b:	48 8d 83 c0 15 00 00 	lea    0x15c0(%rbx),%rax
    2792:	48 c7 00 b8 02 00 00 	movq   $0x2b8,(%rax)
    2799:	48 8d 83 c8 15 00 00 	lea    0x15c8(%rbx),%rax
    27a0:	48 c7 00 b9 02 00 00 	movq   $0x2b9,(%rax)
    27a7:	48 8d 83 d0 15 00 00 	lea    0x15d0(%rbx),%rax
    27ae:	48 c7 00 ba 02 00 00 	movq   $0x2ba,(%rax)
    27b5:	48 8d 83 d8 15 00 00 	lea    0x15d8(%rbx),%rax
    27bc:	48 c7 00 bb 02 00 00 	movq   $0x2bb,(%rax)
    27c3:	48 8d 83 e0 15 00 00 	lea    0x15e0(%rbx),%rax
    27ca:	48 c7 00 bc 02 00 00 	movq   $0x2bc,(%rax)
    27d1:	48 8d 83 e8 15 00 00 	lea    0x15e8(%rbx),%rax
    27d8:	48 c7 00 bd 02 00 00 	movq   $0x2bd,(%rax)
    27df:	48 8d 83 f0 15 00 00 	lea    0x15f0(%rbx),%rax
    27e6:	48 c7 00 be 02 00 00 	movq   $0x2be,(%rax)
    27ed:	48 8d 83 f8 15 00 00 	lea    0x15f8(%rbx),%rax
    27f4:	48 c7 00 bf 02 00 00 	movq   $0x2bf,(%rax)
    27fb:	48 8d 83 00 16 00 00 	lea    0x1600(%rbx),%rax
    2802:	48 c7 00 c0 02 00 00 	movq   $0x2c0,(%rax)
    2809:	48 8d 83 08 16 00 00 	lea    0x1608(%rbx),%rax
    2810:	48 c7 00 c1 02 00 00 	movq   $0x2c1,(%rax)
    2817:	48 8d 83 10 16 00 00 	lea    0x1610(%rbx),%rax
    281e:	48 c7 00 c2 02 00 00 	movq   $0x2c2,(%rax)
    2825:	48 8d 83 18 16 00 00 	lea    0x1618(%rbx),%rax
    282c:	48 c7 00 c3 02 00 00 	movq   $0x2c3,(%rax)
    2833:	48 8d 83 20 16 00 00 	lea    0x1620(%rbx),%rax
    283a:	48 c7 00 c4 02 00 00 	movq   $0x2c4,(%rax)
    2841:	48 8d 83 28 16 00 00 	lea    0x1628(%rbx),%rax
    2848:	48 c7 00 c5 02 00 00 	movq   $0x2c5,(%rax)
    284f:	48 8d 83 30 16 00 00 	lea    0x1630(%rbx),%rax
    2856:	48 c7 00 c6 02 00 00 	movq   $0x2c6,(%rax)
    285d:	48 8d 83 38 16 00 00 	lea    0x1638(%rbx),%rax
    2864:	48 c7 00 c7 02 00 00 	movq   $0x2c7,(%rax)
    286b:	48 8d 83 40 16 00 00 	lea    0x1640(%rbx),%rax
    2872:	48 c7 00 c8 02 00 00 	movq   $0x2c8,(%rax)
    2879:	48 8d 83 48 16 00 00 	lea    0x1648(%rbx),%rax
    2880:	48 c7 00 c9 02 00 00 	movq   $0x2c9,(%rax)
    2887:	48 8d 83 50 16 00 00 	lea    0x1650(%rbx),%rax
    288e:	48 c7 00 ca 02 00 00 	movq   $0x2ca,(%rax)
    2895:	48 8d 83 58 16 00 00 	lea    0x1658(%rbx),%rax
    289c:	48 c7 00 cb 02 00 00 	movq   $0x2cb,(%rax)
    28a3:	48 8d 83 60 16 00 00 	lea    0x1660(%rbx),%rax
    28aa:	48 c7 00 cc 02 00 00 	movq   $0x2cc,(%rax)
    28b1:	48 8d 83 68 16 00 00 	lea    0x1668(%rbx),%rax
    28b8:	48 c7 00 cd 02 00 00 	movq   $0x2cd,(%rax)
    28bf:	48 8d 83 70 16 00 00 	lea    0x1670(%rbx),%rax
    28c6:	48 c7 00 ce 02 00 00 	movq   $0x2ce,(%rax)
    28cd:	48 8d 83 78 16 00 00 	lea    0x1678(%rbx),%rax
    28d4:	48 c7 00 cf 02 00 00 	movq   $0x2cf,(%rax)
    28db:	48 8d 83 80 16 00 00 	lea    0x1680(%rbx),%rax
    28e2:	48 c7 00 d0 02 00 00 	movq   $0x2d0,(%rax)
    28e9:	48 8d 83 88 16 00 00 	lea    0x1688(%rbx),%rax
    28f0:	48 c7 00 d1 02 00 00 	movq   $0x2d1,(%rax)
    28f7:	48 8d 83 90 16 00 00 	lea    0x1690(%rbx),%rax
    28fe:	48 c7 00 d2 02 00 00 	movq   $0x2d2,(%rax)
    2905:	48 8d 83 98 16 00 00 	lea    0x1698(%rbx),%rax
    290c:	48 c7 00 d3 02 00 00 	movq   $0x2d3,(%rax)
    2913:	48 8d 83 a0 16 00 00 	lea    0x16a0(%rbx),%rax
    291a:	48 c7 00 d4 02 00 00 	movq   $0x2d4,(%rax)
    2921:	48 8d 83 a8 16 00 00 	lea    0x16a8(%rbx),%rax
    2928:	48 c7 00 d5 02 00 00 	movq   $0x2d5,(%rax)
    292f:	48 8d 83 b0 16 00 00 	lea    0x16b0(%rbx),%rax
    2936:	48 c7 00 d6 02 00 00 	movq   $0x2d6,(%rax)
    293d:	48 8d 83 b8 16 00 00 	lea    0x16b8(%rbx),%rax
    2944:	48 c7 00 d7 02 00 00 	movq   $0x2d7,(%rax)
    294b:	48 8d 83 c0 16 00 00 	lea    0x16c0(%rbx),%rax
    2952:	48 c7 00 d8 02 00 00 	movq   $0x2d8,(%rax)
    2959:	48 8d 83 c8 16 00 00 	lea    0x16c8(%rbx),%rax
    2960:	48 c7 00 d9 02 00 00 	movq   $0x2d9,(%rax)
    2967:	48 8d 83 d0 16 00 00 	lea    0x16d0(%rbx),%rax
    296e:	48 c7 00 da 02 00 00 	movq   $0x2da,(%rax)
    2975:	48 8d 83 d8 16 00 00 	lea    0x16d8(%rbx),%rax
    297c:	48 c7 00 db 02 00 00 	movq   $0x2db,(%rax)
    2983:	48 8d 83 e0 16 00 00 	lea    0x16e0(%rbx),%rax
    298a:	48 c7 00 dc 02 00 00 	movq   $0x2dc,(%rax)
    2991:	48 8d 83 e8 16 00 00 	lea    0x16e8(%rbx),%rax
    2998:	48 c7 00 dd 02 00 00 	movq   $0x2dd,(%rax)
    299f:	48 8d 83 f0 16 00 00 	lea    0x16f0(%rbx),%rax
    29a6:	48 c7 00 de 02 00 00 	movq   $0x2de,(%rax)
    29ad:	48 8d 83 f8 16 00 00 	lea    0x16f8(%rbx),%rax
    29b4:	48 c7 00 df 02 00 00 	movq   $0x2df,(%rax)
    29bb:	48 8d 83 00 17 00 00 	lea    0x1700(%rbx),%rax
    29c2:	48 c7 00 e0 02 00 00 	movq   $0x2e0,(%rax)
    29c9:	48 8d 83 08 17 00 00 	lea    0x1708(%rbx),%rax
    29d0:	48 c7 00 e1 02 00 00 	movq   $0x2e1,(%rax)
    29d7:	48 8d 83 10 17 00 00 	lea    0x1710(%rbx),%rax
    29de:	48 c7 00 e2 02 00 00 	movq   $0x2e2,(%rax)
    29e5:	48 8d 83 18 17 00 00 	lea    0x1718(%rbx),%rax
    29ec:	48 c7 00 e3 02 00 00 	movq   $0x2e3,(%rax)
    29f3:	48 8d 83 20 17 00 00 	lea    0x1720(%rbx),%rax
    29fa:	48 c7 00 e4 02 00 00 	movq   $0x2e4,(%rax)
    2a01:	48 8d 83 28 17 00 00 	lea    0x1728(%rbx),%rax
    2a08:	48 c7 00 e5 02 00 00 	movq   $0x2e5,(%rax)
    2a0f:	48 8d 83 30 17 00 00 	lea    0x1730(%rbx),%rax
    2a16:	48 c7 00 e6 02 00 00 	movq   $0x2e6,(%rax)
    2a1d:	48 8d 83 38 17 00 00 	lea    0x1738(%rbx),%rax
    2a24:	48 c7 00 e7 02 00 00 	movq   $0x2e7,(%rax)
    2a2b:	48 8d 83 40 17 00 00 	lea    0x1740(%rbx),%rax
    2a32:	48 c7 00 e8 02 00 00 	movq   $0x2e8,(%rax)
    2a39:	48 8d 83 48 17 00 00 	lea    0x1748(%rbx),%rax
    2a40:	48 c7 00 e9 02 00 00 	movq   $0x2e9,(%rax)
    2a47:	48 8d 83 50 17 00 00 	lea    0x1750(%rbx),%rax
    2a4e:	48 c7 00 ea 02 00 00 	movq   $0x2ea,(%rax)
    2a55:	48 8d 83 58 17 00 00 	lea    0x1758(%rbx),%rax
    2a5c:	48 c7 00 eb 02 00 00 	movq   $0x2eb,(%rax)
    2a63:	48 8d 83 60 17 00 00 	lea    0x1760(%rbx),%rax
    2a6a:	48 c7 00 ec 02 00 00 	movq   $0x2ec,(%rax)
    2a71:	48 8d 83 68 17 00 00 	lea    0x1768(%rbx),%rax
    2a78:	48 c7 00 ed 02 00 00 	movq   $0x2ed,(%rax)
    2a7f:	48 8d 83 70 17 00 00 	lea    0x1770(%rbx),%rax
    2a86:	48 c7 00 ee 02 00 00 	movq   $0x2ee,(%rax)
    2a8d:	48 8d 83 78 17 00 00 	lea    0x1778(%rbx),%rax
    2a94:	48 c7 00 ef 02 00 00 	movq   $0x2ef,(%rax)
    2a9b:	48 8d 83 80 17 00 00 	lea    0x1780(%rbx),%rax
    2aa2:	48 c7 00 f0 02 00 00 	movq   $0x2f0,(%rax)
    2aa9:	48 8d 83 88 17 00 00 	lea    0x1788(%rbx),%rax
    2ab0:	48 c7 00 f1 02 00 00 	movq   $0x2f1,(%rax)
    2ab7:	48 8d 83 90 17 00 00 	lea    0x1790(%rbx),%rax
    2abe:	48 c7 00 f2 02 00 00 	movq   $0x2f2,(%rax)
    2ac5:	48 8d 83 98 17 00 00 	lea    0x1798(%rbx),%rax
    2acc:	48 c7 00 f3 02 00 00 	movq   $0x2f3,(%rax)
    2ad3:	48 8d 83 a0 17 00 00 	lea    0x17a0(%rbx),%rax
    2ada:	48 c7 00 f4 02 00 00 	movq   $0x2f4,(%rax)
    2ae1:	48 8d 83 a8 17 00 00 	lea    0x17a8(%rbx),%rax
    2ae8:	48 c7 00 f5 02 00 00 	movq   $0x2f5,(%rax)
    2aef:	48 8d 83 b0 17 00 00 	lea    0x17b0(%rbx),%rax
    2af6:	48 c7 00 f6 02 00 00 	movq   $0x2f6,(%rax)
    2afd:	48 8d 83 b8 17 00 00 	lea    0x17b8(%rbx),%rax
    2b04:	48 c7 00 f7 02 00 00 	movq   $0x2f7,(%rax)
    2b0b:	48 8d 83 c0 17 00 00 	lea    0x17c0(%rbx),%rax
    2b12:	48 c7 00 f8 02 00 00 	movq   $0x2f8,(%rax)
    2b19:	48 8d 83 c8 17 00 00 	lea    0x17c8(%rbx),%rax
    2b20:	48 c7 00 f9 02 00 00 	movq   $0x2f9,(%rax)
    2b27:	48 8d 83 d0 17 00 00 	lea    0x17d0(%rbx),%rax
    2b2e:	48 c7 00 fa 02 00 00 	movq   $0x2fa,(%rax)
    2b35:	48 8d 83 d8 17 00 00 	lea    0x17d8(%rbx),%rax
    2b3c:	48 c7 00 fb 02 00 00 	movq   $0x2fb,(%rax)
    2b43:	48 8d 83 e0 17 00 00 	lea    0x17e0(%rbx),%rax
    2b4a:	48 c7 00 fc 02 00 00 	movq   $0x2fc,(%rax)
    2b51:	48 8d 83 e8 17 00 00 	lea    0x17e8(%rbx),%rax
    2b58:	48 c7 00 fd 02 00 00 	movq   $0x2fd,(%rax)
    2b5f:	48 8d 83 f0 17 00 00 	lea    0x17f0(%rbx),%rax
    2b66:	48 c7 00 fe 02 00 00 	movq   $0x2fe,(%rax)
    2b6d:	48 8d 83 f8 17 00 00 	lea    0x17f8(%rbx),%rax
    2b74:	48 c7 00 ff 02 00 00 	movq   $0x2ff,(%rax)
    2b7b:	48 8d 83 00 18 00 00 	lea    0x1800(%rbx),%rax
    2b82:	48 c7 00 00 03 00 00 	movq   $0x300,(%rax)
    2b89:	48 8d 83 08 18 00 00 	lea    0x1808(%rbx),%rax
    2b90:	48 c7 00 01 03 00 00 	movq   $0x301,(%rax)
    2b97:	48 8d 83 10 18 00 00 	lea    0x1810(%rbx),%rax
    2b9e:	48 c7 00 02 03 00 00 	movq   $0x302,(%rax)
    2ba5:	48 8d 83 18 18 00 00 	lea    0x1818(%rbx),%rax
    2bac:	48 c7 00 03 03 00 00 	movq   $0x303,(%rax)
    2bb3:	48 8d 83 20 18 00 00 	lea    0x1820(%rbx),%rax
    2bba:	48 c7 00 04 03 00 00 	movq   $0x304,(%rax)
    2bc1:	48 8d 83 28 18 00 00 	lea    0x1828(%rbx),%rax
    2bc8:	48 c7 00 05 03 00 00 	movq   $0x305,(%rax)
    2bcf:	48 8d 83 30 18 00 00 	lea    0x1830(%rbx),%rax
    2bd6:	48 c7 00 06 03 00 00 	movq   $0x306,(%rax)
    2bdd:	48 8d 83 38 18 00 00 	lea    0x1838(%rbx),%rax
    2be4:	48 c7 00 07 03 00 00 	movq   $0x307,(%rax)
    2beb:	48 8d 83 40 18 00 00 	lea    0x1840(%rbx),%rax
    2bf2:	48 c7 00 08 03 00 00 	movq   $0x308,(%rax)
    2bf9:	48 8d 83 48 18 00 00 	lea    0x1848(%rbx),%rax
    2c00:	48 c7 00 09 03 00 00 	movq   $0x309,(%rax)
    2c07:	48 8d 83 50 18 00 00 	lea    0x1850(%rbx),%rax
    2c0e:	48 c7 00 0a 03 00 00 	movq   $0x30a,(%rax)
    2c15:	48 8d 83 58 18 00 00 	lea    0x1858(%rbx),%rax
    2c1c:	48 c7 00 0b 03 00 00 	movq   $0x30b,(%rax)
    2c23:	48 8d 83 60 18 00 00 	lea    0x1860(%rbx),%rax
    2c2a:	48 c7 00 0c 03 00 00 	movq   $0x30c,(%rax)
    2c31:	48 8d 83 68 18 00 00 	lea    0x1868(%rbx),%rax
    2c38:	48 c7 00 0d 03 00 00 	movq   $0x30d,(%rax)
    2c3f:	48 8d 83 70 18 00 00 	lea    0x1870(%rbx),%rax
    2c46:	48 c7 00 0e 03 00 00 	movq   $0x30e,(%rax)
    2c4d:	48 8d 83 78 18 00 00 	lea    0x1878(%rbx),%rax
    2c54:	48 c7 00 0f 03 00 00 	movq   $0x30f,(%rax)
    2c5b:	48 8d 83 80 18 00 00 	lea    0x1880(%rbx),%rax
    2c62:	48 c7 00 10 03 00 00 	movq   $0x310,(%rax)
    2c69:	48 8d 83 88 18 00 00 	lea    0x1888(%rbx),%rax
    2c70:	48 c7 00 11 03 00 00 	movq   $0x311,(%rax)
    2c77:	48 8d 83 90 18 00 00 	lea    0x1890(%rbx),%rax
    2c7e:	48 c7 00 12 03 00 00 	movq   $0x312,(%rax)
    2c85:	48 8d 83 98 18 00 00 	lea    0x1898(%rbx),%rax
    2c8c:	48 c7 00 13 03 00 00 	movq   $0x313,(%rax)
    2c93:	48 8d 83 a0 18 00 00 	lea    0x18a0(%rbx),%rax
    2c9a:	48 c7 00 14 03 00 00 	movq   $0x314,(%rax)
    2ca1:	48 8d 83 a8 18 00 00 	lea    0x18a8(%rbx),%rax
    2ca8:	48 c7 00 15 03 00 00 	movq   $0x315,(%rax)
    2caf:	48 8d 83 b0 18 00 00 	lea    0x18b0(%rbx),%rax
    2cb6:	48 c7 00 16 03 00 00 	movq   $0x316,(%rax)
    2cbd:	48 8d 83 b8 18 00 00 	lea    0x18b8(%rbx),%rax
    2cc4:	48 c7 00 17 03 00 00 	movq   $0x317,(%rax)
    2ccb:	48 8d 83 c0 18 00 00 	lea    0x18c0(%rbx),%rax
    2cd2:	48 c7 00 18 03 00 00 	movq   $0x318,(%rax)
    2cd9:	48 8d 83 c8 18 00 00 	lea    0x18c8(%rbx),%rax
    2ce0:	48 c7 00 19 03 00 00 	movq   $0x319,(%rax)
    2ce7:	48 8d 83 d0 18 00 00 	lea    0x18d0(%rbx),%rax
    2cee:	48 c7 00 1a 03 00 00 	movq   $0x31a,(%rax)
    2cf5:	48 8d 83 d8 18 00 00 	lea    0x18d8(%rbx),%rax
    2cfc:	48 c7 00 1b 03 00 00 	movq   $0x31b,(%rax)
    2d03:	48 8d 83 e0 18 00 00 	lea    0x18e0(%rbx),%rax
    2d0a:	48 c7 00 1c 03 00 00 	movq   $0x31c,(%rax)
    2d11:	48 8d 83 e8 18 00 00 	lea    0x18e8(%rbx),%rax
    2d18:	48 c7 00 1d 03 00 00 	movq   $0x31d,(%rax)
    2d1f:	48 8d 83 f0 18 00 00 	lea    0x18f0(%rbx),%rax
    2d26:	48 c7 00 1e 03 00 00 	movq   $0x31e,(%rax)
    2d2d:	48 8d 83 f8 18 00 00 	lea    0x18f8(%rbx),%rax
    2d34:	48 c7 00 1f 03 00 00 	movq   $0x31f,(%rax)
    2d3b:	48 8d 83 00 19 00 00 	lea    0x1900(%rbx),%rax
    2d42:	48 c7 00 20 03 00 00 	movq   $0x320,(%rax)
    2d49:	48 8d 83 08 19 00 00 	lea    0x1908(%rbx),%rax
    2d50:	48 c7 00 21 03 00 00 	movq   $0x321,(%rax)
    2d57:	48 8d 83 10 19 00 00 	lea    0x1910(%rbx),%rax
    2d5e:	48 c7 00 22 03 00 00 	movq   $0x322,(%rax)
    2d65:	48 8d 83 18 19 00 00 	lea    0x1918(%rbx),%rax
    2d6c:	48 c7 00 23 03 00 00 	movq   $0x323,(%rax)
    2d73:	48 8d 83 20 19 00 00 	lea    0x1920(%rbx),%rax
    2d7a:	48 c7 00 24 03 00 00 	movq   $0x324,(%rax)
    2d81:	48 8d 83 28 19 00 00 	lea    0x1928(%rbx),%rax
    2d88:	48 c7 00 25 03 00 00 	movq   $0x325,(%rax)
    2d8f:	48 8d 83 30 19 00 00 	lea    0x1930(%rbx),%rax
    2d96:	48 c7 00 26 03 00 00 	movq   $0x326,(%rax)
    2d9d:	48 8d 83 38 19 00 00 	lea    0x1938(%rbx),%rax
    2da4:	48 c7 00 27 03 00 00 	movq   $0x327,(%rax)
    2dab:	48 8d 83 40 19 00 00 	lea    0x1940(%rbx),%rax
    2db2:	48 c7 00 28 03 00 00 	movq   $0x328,(%rax)
    2db9:	48 8d 83 48 19 00 00 	lea    0x1948(%rbx),%rax
    2dc0:	48 c7 00 29 03 00 00 	movq   $0x329,(%rax)
    2dc7:	48 8d 83 50 19 00 00 	lea    0x1950(%rbx),%rax
    2dce:	48 c7 00 2a 03 00 00 	movq   $0x32a,(%rax)
    2dd5:	48 8d 83 58 19 00 00 	lea    0x1958(%rbx),%rax
    2ddc:	48 c7 00 2b 03 00 00 	movq   $0x32b,(%rax)
    2de3:	48 8d 83 60 19 00 00 	lea    0x1960(%rbx),%rax
    2dea:	48 c7 00 2c 03 00 00 	movq   $0x32c,(%rax)
    2df1:	48 8d 83 68 19 00 00 	lea    0x1968(%rbx),%rax
    2df8:	48 c7 00 2d 03 00 00 	movq   $0x32d,(%rax)
    2dff:	48 8d 83 70 19 00 00 	lea    0x1970(%rbx),%rax
    2e06:	48 c7 00 2e 03 00 00 	movq   $0x32e,(%rax)
    2e0d:	48 8d 83 78 19 00 00 	lea    0x1978(%rbx),%rax
    2e14:	48 c7 00 2f 03 00 00 	movq   $0x32f,(%rax)
    2e1b:	48 8d 83 80 19 00 00 	lea    0x1980(%rbx),%rax
    2e22:	48 c7 00 30 03 00 00 	movq   $0x330,(%rax)
    2e29:	48 8d 83 88 19 00 00 	lea    0x1988(%rbx),%rax
    2e30:	48 c7 00 31 03 00 00 	movq   $0x331,(%rax)
    2e37:	48 8d 83 90 19 00 00 	lea    0x1990(%rbx),%rax
    2e3e:	48 c7 00 32 03 00 00 	movq   $0x332,(%rax)
    2e45:	48 8d 83 98 19 00 00 	lea    0x1998(%rbx),%rax
    2e4c:	48 c7 00 33 03 00 00 	movq   $0x333,(%rax)
    2e53:	48 8d 83 a0 19 00 00 	lea    0x19a0(%rbx),%rax
    2e5a:	48 c7 00 34 03 00 00 	movq   $0x334,(%rax)
    2e61:	48 8d 83 a8 19 00 00 	lea    0x19a8(%rbx),%rax
    2e68:	48 c7 00 35 03 00 00 	movq   $0x335,(%rax)
    2e6f:	48 8d 83 b0 19 00 00 	lea    0x19b0(%rbx),%rax
    2e76:	48 c7 00 36 03 00 00 	movq   $0x336,(%rax)
    2e7d:	48 8d 83 b8 19 00 00 	lea    0x19b8(%rbx),%rax
    2e84:	48 c7 00 37 03 00 00 	movq   $0x337,(%rax)
    2e8b:	48 8d 83 c0 19 00 00 	lea    0x19c0(%rbx),%rax
    2e92:	48 c7 00 38 03 00 00 	movq   $0x338,(%rax)
    2e99:	48 8d 83 c8 19 00 00 	lea    0x19c8(%rbx),%rax
    2ea0:	48 c7 00 39 03 00 00 	movq   $0x339,(%rax)
    2ea7:	48 8d 83 d0 19 00 00 	lea    0x19d0(%rbx),%rax
    2eae:	48 c7 00 3a 03 00 00 	movq   $0x33a,(%rax)
    2eb5:	48 8d 83 d8 19 00 00 	lea    0x19d8(%rbx),%rax
    2ebc:	48 c7 00 3b 03 00 00 	movq   $0x33b,(%rax)
    2ec3:	48 8d 83 e0 19 00 00 	lea    0x19e0(%rbx),%rax
    2eca:	48 c7 00 3c 03 00 00 	movq   $0x33c,(%rax)
    2ed1:	48 8d 83 e8 19 00 00 	lea    0x19e8(%rbx),%rax
    2ed8:	48 c7 00 3d 03 00 00 	movq   $0x33d,(%rax)
    2edf:	48 8d 83 f0 19 00 00 	lea    0x19f0(%rbx),%rax
    2ee6:	48 c7 00 3e 03 00 00 	movq   $0x33e,(%rax)
    2eed:	48 8d 83 f8 19 00 00 	lea    0x19f8(%rbx),%rax
    2ef4:	48 c7 00 3f 03 00 00 	movq   $0x33f,(%rax)
    2efb:	48 8d 83 00 1a 00 00 	lea    0x1a00(%rbx),%rax
    2f02:	48 c7 00 40 03 00 00 	movq   $0x340,(%rax)
    2f09:	48 8d 83 08 1a 00 00 	lea    0x1a08(%rbx),%rax
    2f10:	48 c7 00 41 03 00 00 	movq   $0x341,(%rax)
    2f17:	48 8d 83 10 1a 00 00 	lea    0x1a10(%rbx),%rax
    2f1e:	48 c7 00 42 03 00 00 	movq   $0x342,(%rax)
    2f25:	48 8d 83 18 1a 00 00 	lea    0x1a18(%rbx),%rax
    2f2c:	48 c7 00 43 03 00 00 	movq   $0x343,(%rax)
    2f33:	48 8d 83 20 1a 00 00 	lea    0x1a20(%rbx),%rax
    2f3a:	48 c7 00 44 03 00 00 	movq   $0x344,(%rax)
    2f41:	48 8d 83 28 1a 00 00 	lea    0x1a28(%rbx),%rax
    2f48:	48 c7 00 45 03 00 00 	movq   $0x345,(%rax)
    2f4f:	48 8d 83 30 1a 00 00 	lea    0x1a30(%rbx),%rax
    2f56:	48 c7 00 46 03 00 00 	movq   $0x346,(%rax)
    2f5d:	48 8d 83 38 1a 00 00 	lea    0x1a38(%rbx),%rax
    2f64:	48 c7 00 47 03 00 00 	movq   $0x347,(%rax)
    2f6b:	48 8d 83 40 1a 00 00 	lea    0x1a40(%rbx),%rax
    2f72:	48 c7 00 48 03 00 00 	movq   $0x348,(%rax)
    2f79:	48 8d 83 48 1a 00 00 	lea    0x1a48(%rbx),%rax
    2f80:	48 c7 00 49 03 00 00 	movq   $0x349,(%rax)
    2f87:	48 8d 83 50 1a 00 00 	lea    0x1a50(%rbx),%rax
    2f8e:	48 c7 00 4a 03 00 00 	movq   $0x34a,(%rax)
    2f95:	48 8d 83 58 1a 00 00 	lea    0x1a58(%rbx),%rax
    2f9c:	48 c7 00 4b 03 00 00 	movq   $0x34b,(%rax)
    2fa3:	48 8d 83 60 1a 00 00 	lea    0x1a60(%rbx),%rax
    2faa:	48 c7 00 4c 03 00 00 	movq   $0x34c,(%rax)
    2fb1:	48 8d 83 68 1a 00 00 	lea    0x1a68(%rbx),%rax
    2fb8:	48 c7 00 4d 03 00 00 	movq   $0x34d,(%rax)
    2fbf:	48 8d 83 70 1a 00 00 	lea    0x1a70(%rbx),%rax
    2fc6:	48 c7 00 4e 03 00 00 	movq   $0x34e,(%rax)
    2fcd:	48 8d 83 78 1a 00 00 	lea    0x1a78(%rbx),%rax
    2fd4:	48 c7 00 4f 03 00 00 	movq   $0x34f,(%rax)
    2fdb:	48 8d 83 80 1a 00 00 	lea    0x1a80(%rbx),%rax
    2fe2:	48 c7 00 50 03 00 00 	movq   $0x350,(%rax)
    2fe9:	48 8d 83 88 1a 00 00 	lea    0x1a88(%rbx),%rax
    2ff0:	48 c7 00 51 03 00 00 	movq   $0x351,(%rax)
    2ff7:	48 8d 83 90 1a 00 00 	lea    0x1a90(%rbx),%rax
    2ffe:	48 c7 00 52 03 00 00 	movq   $0x352,(%rax)
    3005:	48 8d 83 98 1a 00 00 	lea    0x1a98(%rbx),%rax
    300c:	48 c7 00 53 03 00 00 	movq   $0x353,(%rax)
    3013:	48 8d 83 a0 1a 00 00 	lea    0x1aa0(%rbx),%rax
    301a:	48 c7 00 54 03 00 00 	movq   $0x354,(%rax)
    3021:	48 8d 83 a8 1a 00 00 	lea    0x1aa8(%rbx),%rax
    3028:	48 c7 00 55 03 00 00 	movq   $0x355,(%rax)
    302f:	48 8d 83 b0 1a 00 00 	lea    0x1ab0(%rbx),%rax
    3036:	48 c7 00 56 03 00 00 	movq   $0x356,(%rax)
    303d:	48 8d 83 b8 1a 00 00 	lea    0x1ab8(%rbx),%rax
    3044:	48 c7 00 57 03 00 00 	movq   $0x357,(%rax)
    304b:	48 8d 83 c0 1a 00 00 	lea    0x1ac0(%rbx),%rax
    3052:	48 c7 00 58 03 00 00 	movq   $0x358,(%rax)
    3059:	48 8d 83 c8 1a 00 00 	lea    0x1ac8(%rbx),%rax
    3060:	48 c7 00 59 03 00 00 	movq   $0x359,(%rax)
    3067:	48 8d 83 d0 1a 00 00 	lea    0x1ad0(%rbx),%rax
    306e:	48 c7 00 5a 03 00 00 	movq   $0x35a,(%rax)
    3075:	48 8d 83 d8 1a 00 00 	lea    0x1ad8(%rbx),%rax
    307c:	48 c7 00 5b 03 00 00 	movq   $0x35b,(%rax)
    3083:	48 8d 83 e0 1a 00 00 	lea    0x1ae0(%rbx),%rax
    308a:	48 c7 00 5c 03 00 00 	movq   $0x35c,(%rax)
    3091:	48 8d 83 e8 1a 00 00 	lea    0x1ae8(%rbx),%rax
    3098:	48 c7 00 5d 03 00 00 	movq   $0x35d,(%rax)
    309f:	48 8d 83 f0 1a 00 00 	lea    0x1af0(%rbx),%rax
    30a6:	48 c7 00 5e 03 00 00 	movq   $0x35e,(%rax)
    30ad:	48 8d 83 f8 1a 00 00 	lea    0x1af8(%rbx),%rax
    30b4:	48 c7 00 5f 03 00 00 	movq   $0x35f,(%rax)
    30bb:	48 8d 83 00 1b 00 00 	lea    0x1b00(%rbx),%rax
    30c2:	48 c7 00 60 03 00 00 	movq   $0x360,(%rax)
    30c9:	48 8d 83 08 1b 00 00 	lea    0x1b08(%rbx),%rax
    30d0:	48 c7 00 61 03 00 00 	movq   $0x361,(%rax)
    30d7:	48 8d 83 10 1b 00 00 	lea    0x1b10(%rbx),%rax
    30de:	48 c7 00 62 03 00 00 	movq   $0x362,(%rax)
    30e5:	48 8d 83 18 1b 00 00 	lea    0x1b18(%rbx),%rax
    30ec:	48 c7 00 63 03 00 00 	movq   $0x363,(%rax)
    30f3:	48 8d 83 20 1b 00 00 	lea    0x1b20(%rbx),%rax
    30fa:	48 c7 00 64 03 00 00 	movq   $0x364,(%rax)
    3101:	48 8d 83 28 1b 00 00 	lea    0x1b28(%rbx),%rax
    3108:	48 c7 00 65 03 00 00 	movq   $0x365,(%rax)
    310f:	48 8d 83 30 1b 00 00 	lea    0x1b30(%rbx),%rax
    3116:	48 c7 00 66 03 00 00 	movq   $0x366,(%rax)
    311d:	48 8d 83 38 1b 00 00 	lea    0x1b38(%rbx),%rax
    3124:	48 c7 00 67 03 00 00 	movq   $0x367,(%rax)
    312b:	48 8d 83 40 1b 00 00 	lea    0x1b40(%rbx),%rax
    3132:	48 c7 00 68 03 00 00 	movq   $0x368,(%rax)
    3139:	48 8d 83 48 1b 00 00 	lea    0x1b48(%rbx),%rax
    3140:	48 c7 00 69 03 00 00 	movq   $0x369,(%rax)
    3147:	48 8d 83 50 1b 00 00 	lea    0x1b50(%rbx),%rax
    314e:	48 c7 00 6a 03 00 00 	movq   $0x36a,(%rax)
    3155:	48 8d 83 58 1b 00 00 	lea    0x1b58(%rbx),%rax
    315c:	48 c7 00 6b 03 00 00 	movq   $0x36b,(%rax)
    3163:	48 8d 83 60 1b 00 00 	lea    0x1b60(%rbx),%rax
    316a:	48 c7 00 6c 03 00 00 	movq   $0x36c,(%rax)
    3171:	48 8d 83 68 1b 00 00 	lea    0x1b68(%rbx),%rax
    3178:	48 c7 00 6d 03 00 00 	movq   $0x36d,(%rax)
    317f:	48 8d 83 70 1b 00 00 	lea    0x1b70(%rbx),%rax
    3186:	48 c7 00 6e 03 00 00 	movq   $0x36e,(%rax)
    318d:	48 8d 83 78 1b 00 00 	lea    0x1b78(%rbx),%rax
    3194:	48 c7 00 6f 03 00 00 	movq   $0x36f,(%rax)
    319b:	48 8d 83 80 1b 00 00 	lea    0x1b80(%rbx),%rax
    31a2:	48 c7 00 70 03 00 00 	movq   $0x370,(%rax)
    31a9:	48 8d 83 88 1b 00 00 	lea    0x1b88(%rbx),%rax
    31b0:	48 c7 00 71 03 00 00 	movq   $0x371,(%rax)
    31b7:	48 8d 83 90 1b 00 00 	lea    0x1b90(%rbx),%rax
    31be:	48 c7 00 72 03 00 00 	movq   $0x372,(%rax)
    31c5:	48 8d 83 98 1b 00 00 	lea    0x1b98(%rbx),%rax
    31cc:	48 c7 00 73 03 00 00 	movq   $0x373,(%rax)
    31d3:	48 8d 83 a0 1b 00 00 	lea    0x1ba0(%rbx),%rax
    31da:	48 c7 00 74 03 00 00 	movq   $0x374,(%rax)
    31e1:	48 8d 83 a8 1b 00 00 	lea    0x1ba8(%rbx),%rax
    31e8:	48 c7 00 75 03 00 00 	movq   $0x375,(%rax)
    31ef:	48 8d 83 b0 1b 00 00 	lea    0x1bb0(%rbx),%rax
    31f6:	48 c7 00 76 03 00 00 	movq   $0x376,(%rax)
    31fd:	48 8d 83 b8 1b 00 00 	lea    0x1bb8(%rbx),%rax
    3204:	48 c7 00 77 03 00 00 	movq   $0x377,(%rax)
    320b:	48 8d 83 c0 1b 00 00 	lea    0x1bc0(%rbx),%rax
    3212:	48 c7 00 78 03 00 00 	movq   $0x378,(%rax)
    3219:	48 8d 83 c8 1b 00 00 	lea    0x1bc8(%rbx),%rax
    3220:	48 c7 00 79 03 00 00 	movq   $0x379,(%rax)
    3227:	48 8d 83 d0 1b 00 00 	lea    0x1bd0(%rbx),%rax
    322e:	48 c7 00 7a 03 00 00 	movq   $0x37a,(%rax)
    3235:	48 8d 83 d8 1b 00 00 	lea    0x1bd8(%rbx),%rax
    323c:	48 c7 00 7b 03 00 00 	movq   $0x37b,(%rax)
    3243:	48 8d 83 e0 1b 00 00 	lea    0x1be0(%rbx),%rax
    324a:	48 c7 00 7c 03 00 00 	movq   $0x37c,(%rax)
    3251:	48 8d 83 e8 1b 00 00 	lea    0x1be8(%rbx),%rax
    3258:	48 c7 00 7d 03 00 00 	movq   $0x37d,(%rax)
    325f:	48 8d 83 f0 1b 00 00 	lea    0x1bf0(%rbx),%rax
    3266:	48 c7 00 7e 03 00 00 	movq   $0x37e,(%rax)
    326d:	48 8d 83 f8 1b 00 00 	lea    0x1bf8(%rbx),%rax
    3274:	48 c7 00 7f 03 00 00 	movq   $0x37f,(%rax)
    327b:	48 8d 83 00 1c 00 00 	lea    0x1c00(%rbx),%rax
    3282:	48 c7 00 80 03 00 00 	movq   $0x380,(%rax)
    3289:	48 8d 83 08 1c 00 00 	lea    0x1c08(%rbx),%rax
    3290:	48 c7 00 81 03 00 00 	movq   $0x381,(%rax)
    3297:	48 8d 83 10 1c 00 00 	lea    0x1c10(%rbx),%rax
    329e:	48 c7 00 82 03 00 00 	movq   $0x382,(%rax)
    32a5:	48 8d 83 18 1c 00 00 	lea    0x1c18(%rbx),%rax
    32ac:	48 c7 00 83 03 00 00 	movq   $0x383,(%rax)
    32b3:	48 8d 83 20 1c 00 00 	lea    0x1c20(%rbx),%rax
    32ba:	48 c7 00 84 03 00 00 	movq   $0x384,(%rax)
    32c1:	48 8d 83 28 1c 00 00 	lea    0x1c28(%rbx),%rax
    32c8:	48 c7 00 85 03 00 00 	movq   $0x385,(%rax)
    32cf:	48 8d 83 30 1c 00 00 	lea    0x1c30(%rbx),%rax
    32d6:	48 c7 00 86 03 00 00 	movq   $0x386,(%rax)
    32dd:	48 8d 83 38 1c 00 00 	lea    0x1c38(%rbx),%rax
    32e4:	48 c7 00 87 03 00 00 	movq   $0x387,(%rax)
    32eb:	48 8d 83 40 1c 00 00 	lea    0x1c40(%rbx),%rax
    32f2:	48 c7 00 88 03 00 00 	movq   $0x388,(%rax)
    32f9:	48 8d 83 48 1c 00 00 	lea    0x1c48(%rbx),%rax
    3300:	48 c7 00 89 03 00 00 	movq   $0x389,(%rax)
    3307:	48 8d 83 50 1c 00 00 	lea    0x1c50(%rbx),%rax
    330e:	48 c7 00 8a 03 00 00 	movq   $0x38a,(%rax)
    3315:	48 8d 83 58 1c 00 00 	lea    0x1c58(%rbx),%rax
    331c:	48 c7 00 8b 03 00 00 	movq   $0x38b,(%rax)
    3323:	48 8d 83 60 1c 00 00 	lea    0x1c60(%rbx),%rax
    332a:	48 c7 00 8c 03 00 00 	movq   $0x38c,(%rax)
    3331:	48 8d 83 68 1c 00 00 	lea    0x1c68(%rbx),%rax
    3338:	48 c7 00 8d 03 00 00 	movq   $0x38d,(%rax)
    333f:	48 8d 83 70 1c 00 00 	lea    0x1c70(%rbx),%rax
    3346:	48 c7 00 8e 03 00 00 	movq   $0x38e,(%rax)
    334d:	48 8d 83 78 1c 00 00 	lea    0x1c78(%rbx),%rax
    3354:	48 c7 00 8f 03 00 00 	movq   $0x38f,(%rax)
    335b:	48 8d 83 80 1c 00 00 	lea    0x1c80(%rbx),%rax
    3362:	48 c7 00 90 03 00 00 	movq   $0x390,(%rax)
    3369:	48 8d 83 88 1c 00 00 	lea    0x1c88(%rbx),%rax
    3370:	48 c7 00 91 03 00 00 	movq   $0x391,(%rax)
    3377:	48 8d 83 90 1c 00 00 	lea    0x1c90(%rbx),%rax
    337e:	48 c7 00 92 03 00 00 	movq   $0x392,(%rax)
    3385:	48 8d 83 98 1c 00 00 	lea    0x1c98(%rbx),%rax
    338c:	48 c7 00 93 03 00 00 	movq   $0x393,(%rax)
    3393:	48 8d 83 a0 1c 00 00 	lea    0x1ca0(%rbx),%rax
    339a:	48 c7 00 94 03 00 00 	movq   $0x394,(%rax)
    33a1:	48 8d 83 a8 1c 00 00 	lea    0x1ca8(%rbx),%rax
    33a8:	48 c7 00 95 03 00 00 	movq   $0x395,(%rax)
    33af:	48 8d 83 b0 1c 00 00 	lea    0x1cb0(%rbx),%rax
    33b6:	48 c7 00 96 03 00 00 	movq   $0x396,(%rax)
    33bd:	48 8d 83 b8 1c 00 00 	lea    0x1cb8(%rbx),%rax
    33c4:	48 c7 00 97 03 00 00 	movq   $0x397,(%rax)
    33cb:	48 8d 83 c0 1c 00 00 	lea    0x1cc0(%rbx),%rax
    33d2:	48 c7 00 98 03 00 00 	movq   $0x398,(%rax)
    33d9:	48 8d 83 c8 1c 00 00 	lea    0x1cc8(%rbx),%rax
    33e0:	48 c7 00 99 03 00 00 	movq   $0x399,(%rax)
    33e7:	48 8d 83 d0 1c 00 00 	lea    0x1cd0(%rbx),%rax
    33ee:	48 c7 00 9a 03 00 00 	movq   $0x39a,(%rax)
    33f5:	48 8d 83 d8 1c 00 00 	lea    0x1cd8(%rbx),%rax
    33fc:	48 c7 00 9b 03 00 00 	movq   $0x39b,(%rax)
    3403:	48 8d 83 e0 1c 00 00 	lea    0x1ce0(%rbx),%rax
    340a:	48 c7 00 9c 03 00 00 	movq   $0x39c,(%rax)
    3411:	48 8d 83 e8 1c 00 00 	lea    0x1ce8(%rbx),%rax
    3418:	48 c7 00 9d 03 00 00 	movq   $0x39d,(%rax)
    341f:	48 8d 83 f0 1c 00 00 	lea    0x1cf0(%rbx),%rax
    3426:	48 c7 00 9e 03 00 00 	movq   $0x39e,(%rax)
    342d:	48 8d 83 f8 1c 00 00 	lea    0x1cf8(%rbx),%rax
    3434:	48 c7 00 9f 03 00 00 	movq   $0x39f,(%rax)
    343b:	48 8d 83 00 1d 00 00 	lea    0x1d00(%rbx),%rax
    3442:	48 c7 00 a0 03 00 00 	movq   $0x3a0,(%rax)
    3449:	48 8d 83 08 1d 00 00 	lea    0x1d08(%rbx),%rax
    3450:	48 c7 00 a1 03 00 00 	movq   $0x3a1,(%rax)
    3457:	48 8d 83 10 1d 00 00 	lea    0x1d10(%rbx),%rax
    345e:	48 c7 00 a2 03 00 00 	movq   $0x3a2,(%rax)
    3465:	48 8d 83 18 1d 00 00 	lea    0x1d18(%rbx),%rax
    346c:	48 c7 00 a3 03 00 00 	movq   $0x3a3,(%rax)
    3473:	48 8d 83 20 1d 00 00 	lea    0x1d20(%rbx),%rax
    347a:	48 c7 00 a4 03 00 00 	movq   $0x3a4,(%rax)
    3481:	48 8d 83 28 1d 00 00 	lea    0x1d28(%rbx),%rax
    3488:	48 c7 00 a5 03 00 00 	movq   $0x3a5,(%rax)
    348f:	48 8d 83 30 1d 00 00 	lea    0x1d30(%rbx),%rax
    3496:	48 c7 00 a6 03 00 00 	movq   $0x3a6,(%rax)
    349d:	48 8d 83 38 1d 00 00 	lea    0x1d38(%rbx),%rax
    34a4:	48 c7 00 a7 03 00 00 	movq   $0x3a7,(%rax)
    34ab:	48 8d 83 40 1d 00 00 	lea    0x1d40(%rbx),%rax
    34b2:	48 c7 00 a8 03 00 00 	movq   $0x3a8,(%rax)
    34b9:	48 8d 83 48 1d 00 00 	lea    0x1d48(%rbx),%rax
    34c0:	48 c7 00 a9 03 00 00 	movq   $0x3a9,(%rax)
    34c7:	48 8d 83 50 1d 00 00 	lea    0x1d50(%rbx),%rax
    34ce:	48 c7 00 aa 03 00 00 	movq   $0x3aa,(%rax)
    34d5:	48 8d 83 58 1d 00 00 	lea    0x1d58(%rbx),%rax
    34dc:	48 c7 00 ab 03 00 00 	movq   $0x3ab,(%rax)
    34e3:	48 8d 83 60 1d 00 00 	lea    0x1d60(%rbx),%rax
    34ea:	48 c7 00 ac 03 00 00 	movq   $0x3ac,(%rax)
    34f1:	48 8d 83 68 1d 00 00 	lea    0x1d68(%rbx),%rax
    34f8:	48 c7 00 ad 03 00 00 	movq   $0x3ad,(%rax)
    34ff:	48 8d 83 70 1d 00 00 	lea    0x1d70(%rbx),%rax
    3506:	48 c7 00 ae 03 00 00 	movq   $0x3ae,(%rax)
    350d:	48 8d 83 78 1d 00 00 	lea    0x1d78(%rbx),%rax
    3514:	48 c7 00 af 03 00 00 	movq   $0x3af,(%rax)
    351b:	48 8d 83 80 1d 00 00 	lea    0x1d80(%rbx),%rax
    3522:	48 c7 00 b0 03 00 00 	movq   $0x3b0,(%rax)
    3529:	48 8d 83 88 1d 00 00 	lea    0x1d88(%rbx),%rax
    3530:	48 c7 00 b1 03 00 00 	movq   $0x3b1,(%rax)
    3537:	48 8d 83 90 1d 00 00 	lea    0x1d90(%rbx),%rax
    353e:	48 c7 00 b2 03 00 00 	movq   $0x3b2,(%rax)
    3545:	48 8d 83 98 1d 00 00 	lea    0x1d98(%rbx),%rax
    354c:	48 c7 00 b3 03 00 00 	movq   $0x3b3,(%rax)
    3553:	48 8d 83 a0 1d 00 00 	lea    0x1da0(%rbx),%rax
    355a:	48 c7 00 b4 03 00 00 	movq   $0x3b4,(%rax)
    3561:	48 8d 83 a8 1d 00 00 	lea    0x1da8(%rbx),%rax
    3568:	48 c7 00 b5 03 00 00 	movq   $0x3b5,(%rax)
    356f:	48 8d 83 b0 1d 00 00 	lea    0x1db0(%rbx),%rax
    3576:	48 c7 00 b6 03 00 00 	movq   $0x3b6,(%rax)
    357d:	48 8d 83 b8 1d 00 00 	lea    0x1db8(%rbx),%rax
    3584:	48 c7 00 b7 03 00 00 	movq   $0x3b7,(%rax)
    358b:	48 8d 83 c0 1d 00 00 	lea    0x1dc0(%rbx),%rax
    3592:	48 c7 00 b8 03 00 00 	movq   $0x3b8,(%rax)
    3599:	48 8d 83 c8 1d 00 00 	lea    0x1dc8(%rbx),%rax
    35a0:	48 c7 00 b9 03 00 00 	movq   $0x3b9,(%rax)
    35a7:	48 8d 83 d0 1d 00 00 	lea    0x1dd0(%rbx),%rax
    35ae:	48 c7 00 ba 03 00 00 	movq   $0x3ba,(%rax)
    35b5:	48 8d 83 d8 1d 00 00 	lea    0x1dd8(%rbx),%rax
    35bc:	48 c7 00 bb 03 00 00 	movq   $0x3bb,(%rax)
    35c3:	48 8d 83 e0 1d 00 00 	lea    0x1de0(%rbx),%rax
    35ca:	48 c7 00 bc 03 00 00 	movq   $0x3bc,(%rax)
    35d1:	48 8d 83 e8 1d 00 00 	lea    0x1de8(%rbx),%rax
    35d8:	48 c7 00 bd 03 00 00 	movq   $0x3bd,(%rax)
    35df:	48 8d 83 f0 1d 00 00 	lea    0x1df0(%rbx),%rax
    35e6:	48 c7 00 be 03 00 00 	movq   $0x3be,(%rax)
    35ed:	48 8d 83 f8 1d 00 00 	lea    0x1df8(%rbx),%rax
    35f4:	48 c7 00 bf 03 00 00 	movq   $0x3bf,(%rax)
    35fb:	48 8d 83 00 1e 00 00 	lea    0x1e00(%rbx),%rax
    3602:	48 c7 00 c0 03 00 00 	movq   $0x3c0,(%rax)
    3609:	48 8d 83 08 1e 00 00 	lea    0x1e08(%rbx),%rax
    3610:	48 c7 00 c1 03 00 00 	movq   $0x3c1,(%rax)
    3617:	48 8d 83 10 1e 00 00 	lea    0x1e10(%rbx),%rax
    361e:	48 c7 00 c2 03 00 00 	movq   $0x3c2,(%rax)
    3625:	48 8d 83 18 1e 00 00 	lea    0x1e18(%rbx),%rax
    362c:	48 c7 00 c3 03 00 00 	movq   $0x3c3,(%rax)
    3633:	48 8d 83 20 1e 00 00 	lea    0x1e20(%rbx),%rax
    363a:	48 c7 00 c4 03 00 00 	movq   $0x3c4,(%rax)
    3641:	48 8d 83 28 1e 00 00 	lea    0x1e28(%rbx),%rax
    3648:	48 c7 00 c5 03 00 00 	movq   $0x3c5,(%rax)
    364f:	48 8d 83 30 1e 00 00 	lea    0x1e30(%rbx),%rax
    3656:	48 c7 00 c6 03 00 00 	movq   $0x3c6,(%rax)
    365d:	48 8d 83 38 1e 00 00 	lea    0x1e38(%rbx),%rax
    3664:	48 c7 00 c7 03 00 00 	movq   $0x3c7,(%rax)
    366b:	48 8d 83 40 1e 00 00 	lea    0x1e40(%rbx),%rax
    3672:	48 c7 00 c8 03 00 00 	movq   $0x3c8,(%rax)
    3679:	48 8d 83 48 1e 00 00 	lea    0x1e48(%rbx),%rax
    3680:	48 c7 00 c9 03 00 00 	movq   $0x3c9,(%rax)
    3687:	48 8d 83 50 1e 00 00 	lea    0x1e50(%rbx),%rax
    368e:	48 c7 00 ca 03 00 00 	movq   $0x3ca,(%rax)
    3695:	48 8d 83 58 1e 00 00 	lea    0x1e58(%rbx),%rax
    369c:	48 c7 00 cb 03 00 00 	movq   $0x3cb,(%rax)
    36a3:	48 8d 83 60 1e 00 00 	lea    0x1e60(%rbx),%rax
    36aa:	48 c7 00 cc 03 00 00 	movq   $0x3cc,(%rax)
    36b1:	48 8d 83 68 1e 00 00 	lea    0x1e68(%rbx),%rax
    36b8:	48 c7 00 cd 03 00 00 	movq   $0x3cd,(%rax)
    36bf:	48 8d 83 70 1e 00 00 	lea    0x1e70(%rbx),%rax
    36c6:	48 c7 00 ce 03 00 00 	movq   $0x3ce,(%rax)
    36cd:	48 8d 83 78 1e 00 00 	lea    0x1e78(%rbx),%rax
    36d4:	48 c7 00 cf 03 00 00 	movq   $0x3cf,(%rax)
    36db:	48 8d 83 80 1e 00 00 	lea    0x1e80(%rbx),%rax
    36e2:	48 c7 00 d0 03 00 00 	movq   $0x3d0,(%rax)
    36e9:	48 8d 83 88 1e 00 00 	lea    0x1e88(%rbx),%rax
    36f0:	48 c7 00 d1 03 00 00 	movq   $0x3d1,(%rax)
    36f7:	48 8d 83 90 1e 00 00 	lea    0x1e90(%rbx),%rax
    36fe:	48 c7 00 d2 03 00 00 	movq   $0x3d2,(%rax)
    3705:	48 8d 83 98 1e 00 00 	lea    0x1e98(%rbx),%rax
    370c:	48 c7 00 d3 03 00 00 	movq   $0x3d3,(%rax)
    3713:	48 8d 83 a0 1e 00 00 	lea    0x1ea0(%rbx),%rax
    371a:	48 c7 00 d4 03 00 00 	movq   $0x3d4,(%rax)
    3721:	48 8d 83 a8 1e 00 00 	lea    0x1ea8(%rbx),%rax
    3728:	48 c7 00 d5 03 00 00 	movq   $0x3d5,(%rax)
    372f:	48 8d 83 b0 1e 00 00 	lea    0x1eb0(%rbx),%rax
    3736:	48 c7 00 d6 03 00 00 	movq   $0x3d6,(%rax)
    373d:	48 8d 83 b8 1e 00 00 	lea    0x1eb8(%rbx),%rax
    3744:	48 c7 00 d7 03 00 00 	movq   $0x3d7,(%rax)
    374b:	48 8d 83 c0 1e 00 00 	lea    0x1ec0(%rbx),%rax
    3752:	48 c7 00 d8 03 00 00 	movq   $0x3d8,(%rax)
    3759:	48 8d 83 c8 1e 00 00 	lea    0x1ec8(%rbx),%rax
    3760:	48 c7 00 d9 03 00 00 	movq   $0x3d9,(%rax)
    3767:	48 8d 83 d0 1e 00 00 	lea    0x1ed0(%rbx),%rax
    376e:	48 c7 00 da 03 00 00 	movq   $0x3da,(%rax)
    3775:	48 8d 83 d8 1e 00 00 	lea    0x1ed8(%rbx),%rax
    377c:	48 c7 00 db 03 00 00 	movq   $0x3db,(%rax)
    3783:	48 8d 83 e0 1e 00 00 	lea    0x1ee0(%rbx),%rax
    378a:	48 c7 00 dc 03 00 00 	movq   $0x3dc,(%rax)
    3791:	48 8d 83 e8 1e 00 00 	lea    0x1ee8(%rbx),%rax
    3798:	48 c7 00 dd 03 00 00 	movq   $0x3dd,(%rax)
    379f:	48 8d 83 f0 1e 00 00 	lea    0x1ef0(%rbx),%rax
    37a6:	48 c7 00 de 03 00 00 	movq   $0x3de,(%rax)
    37ad:	48 8d 83 f8 1e 00 00 	lea    0x1ef8(%rbx),%rax
    37b4:	48 c7 00 df 03 00 00 	movq   $0x3df,(%rax)
    37bb:	48 8d 83 00 1f 00 00 	lea    0x1f00(%rbx),%rax
    37c2:	48 c7 00 e0 03 00 00 	movq   $0x3e0,(%rax)
    37c9:	48 8d 83 08 1f 00 00 	lea    0x1f08(%rbx),%rax
    37d0:	48 c7 00 e1 03 00 00 	movq   $0x3e1,(%rax)
    37d7:	48 8d 83 10 1f 00 00 	lea    0x1f10(%rbx),%rax
    37de:	48 c7 00 e2 03 00 00 	movq   $0x3e2,(%rax)
    37e5:	48 8d 83 18 1f 00 00 	lea    0x1f18(%rbx),%rax
    37ec:	48 c7 00 e3 03 00 00 	movq   $0x3e3,(%rax)
    37f3:	48 8d 83 20 1f 00 00 	lea    0x1f20(%rbx),%rax
    37fa:	48 c7 00 e4 03 00 00 	movq   $0x3e4,(%rax)
    3801:	48 8d 83 28 1f 00 00 	lea    0x1f28(%rbx),%rax
    3808:	48 c7 00 e5 03 00 00 	movq   $0x3e5,(%rax)
    380f:	48 8d 83 30 1f 00 00 	lea    0x1f30(%rbx),%rax
    3816:	48 c7 00 e6 03 00 00 	movq   $0x3e6,(%rax)
    381d:	48 8d 83 38 1f 00 00 	lea    0x1f38(%rbx),%rax
    3824:	48 c7 00 e7 03 00 00 	movq   $0x3e7,(%rax)
    382b:	48 8d 83 40 1f 00 00 	lea    0x1f40(%rbx),%rax
    3832:	48 c7 00 e8 03 00 00 	movq   $0x3e8,(%rax)
    3839:	48 8d 83 48 1f 00 00 	lea    0x1f48(%rbx),%rax
    3840:	48 c7 00 e9 03 00 00 	movq   $0x3e9,(%rax)
    3847:	48 8d 83 50 1f 00 00 	lea    0x1f50(%rbx),%rax
    384e:	48 c7 00 ea 03 00 00 	movq   $0x3ea,(%rax)
    3855:	48 8d 83 58 1f 00 00 	lea    0x1f58(%rbx),%rax
    385c:	48 c7 00 eb 03 00 00 	movq   $0x3eb,(%rax)
    3863:	48 8d 83 60 1f 00 00 	lea    0x1f60(%rbx),%rax
    386a:	48 c7 00 ec 03 00 00 	movq   $0x3ec,(%rax)
    3871:	48 8d 83 68 1f 00 00 	lea    0x1f68(%rbx),%rax
    3878:	48 c7 00 ed 03 00 00 	movq   $0x3ed,(%rax)
    387f:	48 8d 83 70 1f 00 00 	lea    0x1f70(%rbx),%rax
    3886:	48 c7 00 ee 03 00 00 	movq   $0x3ee,(%rax)
    388d:	48 8d 83 78 1f 00 00 	lea    0x1f78(%rbx),%rax
    3894:	48 c7 00 ef 03 00 00 	movq   $0x3ef,(%rax)
    389b:	48 8d 83 80 1f 00 00 	lea    0x1f80(%rbx),%rax
    38a2:	48 c7 00 f0 03 00 00 	movq   $0x3f0,(%rax)
    38a9:	48 8d 83 88 1f 00 00 	lea    0x1f88(%rbx),%rax
    38b0:	48 c7 00 f1 03 00 00 	movq   $0x3f1,(%rax)
    38b7:	48 8d 83 90 1f 00 00 	lea    0x1f90(%rbx),%rax
    38be:	48 c7 00 f2 03 00 00 	movq   $0x3f2,(%rax)
    38c5:	48 8d 83 98 1f 00 00 	lea    0x1f98(%rbx),%rax
    38cc:	48 c7 00 f3 03 00 00 	movq   $0x3f3,(%rax)
    38d3:	48 8d 83 a0 1f 00 00 	lea    0x1fa0(%rbx),%rax
    38da:	48 c7 00 f4 03 00 00 	movq   $0x3f4,(%rax)
    38e1:	48 8d 83 a8 1f 00 00 	lea    0x1fa8(%rbx),%rax
    38e8:	48 c7 00 f5 03 00 00 	movq   $0x3f5,(%rax)
    38ef:	48 8d 83 b0 1f 00 00 	lea    0x1fb0(%rbx),%rax
    38f6:	48 c7 00 f6 03 00 00 	movq   $0x3f6,(%rax)
    38fd:	48 8d 83 b8 1f 00 00 	lea    0x1fb8(%rbx),%rax
    3904:	48 c7 00 f7 03 00 00 	movq   $0x3f7,(%rax)
    390b:	48 8d 83 c0 1f 00 00 	lea    0x1fc0(%rbx),%rax
    3912:	48 c7 00 f8 03 00 00 	movq   $0x3f8,(%rax)
    3919:	48 8d 83 c8 1f 00 00 	lea    0x1fc8(%rbx),%rax
    3920:	48 c7 00 f9 03 00 00 	movq   $0x3f9,(%rax)
    3927:	48 8d 83 d0 1f 00 00 	lea    0x1fd0(%rbx),%rax
    392e:	48 c7 00 fa 03 00 00 	movq   $0x3fa,(%rax)
    3935:	48 8d 83 d8 1f 00 00 	lea    0x1fd8(%rbx),%rax
    393c:	48 c7 00 fb 03 00 00 	movq   $0x3fb,(%rax)
    3943:	48 8d 83 e0 1f 00 00 	lea    0x1fe0(%rbx),%rax
    394a:	48 c7 00 fc 03 00 00 	movq   $0x3fc,(%rax)
    3951:	48 8d 83 e8 1f 00 00 	lea    0x1fe8(%rbx),%rax
    3958:	48 c7 00 fd 03 00 00 	movq   $0x3fd,(%rax)
    395f:	48 8d 83 f0 1f 00 00 	lea    0x1ff0(%rbx),%rax
    3966:	48 c7 00 fe 03 00 00 	movq   $0x3fe,(%rax)
    396d:	48 8d 83 f8 1f 00 00 	lea    0x1ff8(%rbx),%rax
    3974:	48 c7 00 ff 03 00 00 	movq   $0x3ff,(%rax)
    397b:	48 81 c3 00 20 00 00 	add    $0x2000,%rbx
    3982:	48 3b 5d d8          	cmp    -0x28(%rbp),%rbx
    3986:	0f 82 23 c8 ff ff    	jb     1af <main+0x154>
		//memCopyTest(src, dst);
		//memcpy(dst, src, DATA_SIZE);
		tick(tick2);
    398c:	0f 31                	rdtsc  
    398e:	89 d3                	mov    %edx,%ebx
    3990:	41 89 c4             	mov    %eax,%r12d
    3993:	44 89 65 90          	mov    %r12d,-0x70(%rbp)
    3997:	89 5d 94             	mov    %ebx,-0x6c(%rbp)
    399a:	8b 45 90             	mov    -0x70(%rbp),%eax
    399d:	8b 55 94             	mov    -0x6c(%rbp),%edx
    39a0:	48 c1 e2 20          	shl    $0x20,%rdx
    39a4:	48 09 d0             	or     %rdx,%rax
    39a7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)

		diff = tick_diff_loop(tick1, tick2, LOOP_SIZE_INNER);
    39ab:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    39af:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    39b3:	48 89 d1             	mov    %rdx,%rcx
    39b6:	48 29 c1             	sub    %rax,%rcx
    39b9:	48 89 c8             	mov    %rcx,%rax
    39bc:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
    39c0:	48 2d 70 3d 2a 00    	sub    $0x2a3d70,%rax
    39c6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
		
		bandwidth = (double)DATA_SIZE / ((double)diff / (double)CPU_FREQUENCY * 1e-3) / (double)(1 << 30);
    39ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    39ce:	48 85 c0             	test   %rax,%rax
    39d1:	78 07                	js     39da <main+0x397f>
    39d3:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
    39d8:	eb 15                	jmp    39ef <main+0x3994>
    39da:	48 89 c2             	mov    %rax,%rdx
    39dd:	48 d1 ea             	shr    %rdx
    39e0:	83 e0 01             	and    $0x1,%eax
    39e3:	48 09 c2             	or     %rax,%rdx
    39e6:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
    39eb:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
    39ef:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 39f7 <main+0x399c>
    39f6:	00 
    39f7:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    39fb:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 3a03 <main+0x39a8>
    3a02:	00 
    3a03:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
    3a07:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 3a0f <main+0x39b4>
    3a0e:	00 
    3a0f:	66 0f 28 d1          	movapd %xmm1,%xmm2
    3a13:	f2 0f 5e d0          	divsd  %xmm0,%xmm2
    3a17:	66 0f 28 c2          	movapd %xmm2,%xmm0
    3a1b:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 3a23 <main+0x39c8>
    3a22:	00 
    3a23:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    3a27:	f2 0f 11 45 c0       	movsd  %xmm0,-0x40(%rbp)
		sum += bandwidth;
    3a2c:	f2 0f 10 45 98       	movsd  -0x68(%rbp),%xmm0
    3a31:	f2 0f 58 45 c0       	addsd  -0x40(%rbp),%xmm0
    3a36:	f2 0f 11 45 98       	movsd  %xmm0,-0x68(%rbp)
		sqSum += bandwidth * bandwidth;
    3a3b:	f2 0f 10 45 c0       	movsd  -0x40(%rbp),%xmm0
    3a40:	f2 0f 59 45 c0       	mulsd  -0x40(%rbp),%xmm0
    3a45:	f2 0f 10 4d a0       	movsd  -0x60(%rbp),%xmm1
    3a4a:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    3a4e:	f2 0f 11 45 a0       	movsd  %xmm0,-0x60(%rbp)

		//reset memory
		memset(src, 1, DATA_SIZE);
    3a53:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3a57:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
    3a5c:	be 01 00 00 00       	mov    $0x1,%esi
    3a61:	48 89 c7             	mov    %rax,%rdi
    3a64:	e8 00 00 00 00       	callq  3a69 <main+0x3a0e>
		//memset(dst, 0, DATA_SIZE);

		printf("%d\n", i);
    3a69:	8b 45 8c             	mov    -0x74(%rbp),%eax
    3a6c:	89 c6                	mov    %eax,%esi
    3a6e:	bf 00 00 00 00       	mov    $0x0,%edi
    3a73:	b8 00 00 00 00       	mov    $0x0,%eax
    3a78:	e8 00 00 00 00       	callq  3a7d <main+0x3a22>
	char c;
	printf("Memory allocated. Check TOP and press any key.");	
	scanf("%c", &c);

	int i;
	for (i = 0; i < LOOP_SIZE_OUTER; i++)
    3a7d:	83 45 8c 01          	addl   $0x1,-0x74(%rbp)
    3a81:	83 7d 8c 09          	cmpl   $0x9,-0x74(%rbp)
    3a85:	0f 8e ec c6 ff ff    	jle    177 <main+0x11c>

		printf("%d\n", i);
	}
	
	
	printf("avg=%.2fGB/s, std=%.2e\n", sum / LOOP_SIZE_OUTER, sqrt(sqSum / LOOP_SIZE_OUTER - (sum / LOOP_SIZE_OUTER * sum / LOOP_SIZE_OUTER)));
    3a8b:	f2 0f 10 45 a0       	movsd  -0x60(%rbp),%xmm0
    3a90:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 3a98 <main+0x3a3d>
    3a97:	00 
    3a98:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    3a9c:	f2 0f 10 4d 98       	movsd  -0x68(%rbp),%xmm1
    3aa1:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 3aa9 <main+0x3a4e>
    3aa8:	00 
    3aa9:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
    3aad:	f2 0f 59 4d 98       	mulsd  -0x68(%rbp),%xmm1
    3ab2:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 3aba <main+0x3a5f>
    3ab9:	00 
    3aba:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
    3abe:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
    3ac2:	e8 00 00 00 00       	callq  3ac7 <main+0x3a6c>
    3ac7:	f2 0f 11 85 68 ff ff 	movsd  %xmm0,-0x98(%rbp)
    3ace:	ff 
    3acf:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    3ad6:	f2 0f 10 45 98       	movsd  -0x68(%rbp),%xmm0
    3adb:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 3ae3 <main+0x3a88>
    3ae2:	00 
    3ae3:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    3ae7:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
    3aee:	f2 0f 10 8d 68 ff ff 	movsd  -0x98(%rbp),%xmm1
    3af5:	ff 
    3af6:	bf 00 00 00 00       	mov    $0x0,%edi
    3afb:	b8 02 00 00 00       	mov    $0x2,%eax
    3b00:	e8 00 00 00 00       	callq  3b05 <main+0x3aaa>

	free(src);
    3b05:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3b09:	48 89 c7             	mov    %rax,%rdi
    3b0c:	e8 00 00 00 00       	callq  3b11 <main+0x3ab6>
	//free(dst);

	return 0;
    3b11:	b8 00 00 00 00       	mov    $0x0,%eax
}		
    3b16:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
    3b1d:	5b                   	pop    %rbx
    3b1e:	41 5c                	pop    %r12
    3b20:	5d                   	pop    %rbp
    3b21:	c3                   	retq   
