
proc.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <tick_find_overhead>:
#define tick_time_loop(tick1, tick2, loop_size) (tick_diff_loop((tick1), (tick2), (loop_size)) / CPU_FREQUENCY)

#define print_stat(sum, sqSum, n) printf("avg=%.2f, std=%.2e, avg_time=%.2ems\n", sum / n, sqrt(sqSum / n - (sum / n * sum / n)), sum / n / CPU_FREQUENCY) 

inline uint64 tick_find_overhead()
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	41 54                	push   %r12
       6:	53                   	push   %rbx
	unsigned tick_eax, tick_edx;
	uint64 tick1, tick2;
	tick(tick1);
       7:	0f a2                	cpuid  
       9:	0f 31                	rdtsc  
       b:	89 d3                	mov    %edx,%ebx
       d:	41 89 c4             	mov    %eax,%r12d
      10:	44 89 65 d8          	mov    %r12d,-0x28(%rbp)
      14:	89 5d dc             	mov    %ebx,-0x24(%rbp)
      17:	8b 45 d8             	mov    -0x28(%rbp),%eax
      1a:	8b 55 dc             	mov    -0x24(%rbp),%edx
      1d:	48 c1 e2 20          	shl    $0x20,%rdx
      21:	48 09 d0             	or     %rdx,%rax
      24:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
	tick(tick2);
      28:	0f a2                	cpuid  
      2a:	0f 31                	rdtsc  
      2c:	89 d3                	mov    %edx,%ebx
      2e:	41 89 c4             	mov    %eax,%r12d
      31:	44 89 65 d8          	mov    %r12d,-0x28(%rbp)
      35:	89 5d dc             	mov    %ebx,-0x24(%rbp)
      38:	8b 45 d8             	mov    -0x28(%rbp),%eax
      3b:	8b 55 dc             	mov    -0x24(%rbp),%edx
      3e:	48 c1 e2 20          	shl    $0x20,%rdx
      42:	48 09 d0             	or     %rdx,%rax
      45:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	return tick2 - tick1;
      49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      4d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
      51:	48 89 d1             	mov    %rdx,%rcx
      54:	48 29 c1             	sub    %rax,%rcx
      57:	48 89 c8             	mov    %rcx,%rax
}
      5a:	5b                   	pop    %rbx
      5b:	41 5c                	pop    %r12
      5d:	5d                   	pop    %rbp
      5e:	c3                   	retq   

000000000000005f <foo0>:
#include	"tick.h"

#define LOOP_SIZE_INNER 1e7
#define LOOP_SIZE_OUTER 100

void foo0() { }
      5f:	55                   	push   %rbp
      60:	48 89 e5             	mov    %rsp,%rbp
      63:	5d                   	pop    %rbp
      64:	c3                   	retq   

0000000000000065 <foo1>:
void foo1(int a) { }
      65:	55                   	push   %rbp
      66:	48 89 e5             	mov    %rsp,%rbp
      69:	89 7d fc             	mov    %edi,-0x4(%rbp)
      6c:	5d                   	pop    %rbp
      6d:	c3                   	retq   

000000000000006e <foo2>:
void foo2(int a, int b) { }
      6e:	55                   	push   %rbp
      6f:	48 89 e5             	mov    %rsp,%rbp
      72:	89 7d fc             	mov    %edi,-0x4(%rbp)
      75:	89 75 f8             	mov    %esi,-0x8(%rbp)
      78:	5d                   	pop    %rbp
      79:	c3                   	retq   

000000000000007a <foo3>:
void foo3(int a, int b, int c) { }
      7a:	55                   	push   %rbp
      7b:	48 89 e5             	mov    %rsp,%rbp
      7e:	89 7d fc             	mov    %edi,-0x4(%rbp)
      81:	89 75 f8             	mov    %esi,-0x8(%rbp)
      84:	89 55 f4             	mov    %edx,-0xc(%rbp)
      87:	5d                   	pop    %rbp
      88:	c3                   	retq   

0000000000000089 <foo4>:
void foo4(int a, int b, int c, int d) { }
      89:	55                   	push   %rbp
      8a:	48 89 e5             	mov    %rsp,%rbp
      8d:	89 7d fc             	mov    %edi,-0x4(%rbp)
      90:	89 75 f8             	mov    %esi,-0x8(%rbp)
      93:	89 55 f4             	mov    %edx,-0xc(%rbp)
      96:	89 4d f0             	mov    %ecx,-0x10(%rbp)
      99:	5d                   	pop    %rbp
      9a:	c3                   	retq   

000000000000009b <foo5>:
void foo5(int a, int b, int c, int d, int e) { }
      9b:	55                   	push   %rbp
      9c:	48 89 e5             	mov    %rsp,%rbp
      9f:	89 7d fc             	mov    %edi,-0x4(%rbp)
      a2:	89 75 f8             	mov    %esi,-0x8(%rbp)
      a5:	89 55 f4             	mov    %edx,-0xc(%rbp)
      a8:	89 4d f0             	mov    %ecx,-0x10(%rbp)
      ab:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
      af:	5d                   	pop    %rbp
      b0:	c3                   	retq   

00000000000000b1 <foo6>:
void foo6(int a, int b, int c, int d, int e, int f) { }
      b1:	55                   	push   %rbp
      b2:	48 89 e5             	mov    %rsp,%rbp
      b5:	89 7d fc             	mov    %edi,-0x4(%rbp)
      b8:	89 75 f8             	mov    %esi,-0x8(%rbp)
      bb:	89 55 f4             	mov    %edx,-0xc(%rbp)
      be:	89 4d f0             	mov    %ecx,-0x10(%rbp)
      c1:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
      c5:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
      c9:	5d                   	pop    %rbp
      ca:	c3                   	retq   

00000000000000cb <foo7>:
void foo7(int a, int b, int c, int d, int e, int f, int g) { }
      cb:	55                   	push   %rbp
      cc:	48 89 e5             	mov    %rsp,%rbp
      cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
      d2:	89 75 f8             	mov    %esi,-0x8(%rbp)
      d5:	89 55 f4             	mov    %edx,-0xc(%rbp)
      d8:	89 4d f0             	mov    %ecx,-0x10(%rbp)
      db:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
      df:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
      e3:	5d                   	pop    %rbp
      e4:	c3                   	retq   

00000000000000e5 <main>:
printf("%d args: ", id); \
print_stat(sum, sqSum, LOOP_SIZE_OUTER);
	

int main ( int argc, char *argv[] )
{
      e5:	55                   	push   %rbp
      e6:	48 89 e5             	mov    %rsp,%rbp
      e9:	41 54                	push   %r12
      eb:	53                   	push   %rbx
      ec:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
      f3:	89 7d 9c             	mov    %edi,-0x64(%rbp)
      f6:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
	tick_init();
      fa:	0f a2                	cpuid  
      fc:	0f 31                	rdtsc  
      fe:	89 d3                	mov    %edx,%ebx
     100:	41 89 c4             	mov    %eax,%r12d
     103:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     107:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     10a:	8b 45 a8             	mov    -0x58(%rbp),%eax
     10d:	8b 55 ac             	mov    -0x54(%rbp),%edx
     110:	48 c1 e2 20          	shl    $0x20,%rdx
     114:	48 09 d0             	or     %rdx,%rax
     117:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     11b:	0f a2                	cpuid  
     11d:	0f 31                	rdtsc  
     11f:	89 d3                	mov    %edx,%ebx
     121:	41 89 c4             	mov    %eax,%r12d
     124:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     128:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     12b:	8b 45 a8             	mov    -0x58(%rbp),%eax
     12e:	8b 55 ac             	mov    -0x54(%rbp),%edx
     131:	48 c1 e2 20          	shl    $0x20,%rdx
     135:	48 09 d0             	or     %rdx,%rax
     138:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     13c:	0f a2                	cpuid  
     13e:	0f 31                	rdtsc  
     140:	89 d3                	mov    %edx,%ebx
     142:	41 89 c4             	mov    %eax,%r12d
     145:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     149:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     14c:	8b 45 a8             	mov    -0x58(%rbp),%eax
     14f:	8b 55 ac             	mov    -0x54(%rbp),%edx
     152:	48 c1 e2 20          	shl    $0x20,%rdx
     156:	48 09 d0             	or     %rdx,%rax
     159:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     15d:	0f a2                	cpuid  
     15f:	0f 31                	rdtsc  
     161:	89 d3                	mov    %edx,%ebx
     163:	41 89 c4             	mov    %eax,%r12d
     166:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     16a:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     16d:	8b 45 a8             	mov    -0x58(%rbp),%eax
     170:	8b 55 ac             	mov    -0x54(%rbp),%edx
     173:	48 c1 e2 20          	shl    $0x20,%rdx
     177:	48 09 d0             	or     %rdx,%rax
     17a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     17e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     182:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     186:	48 89 d1             	mov    %rdx,%rcx
     189:	48 29 c1             	sub    %rax,%rcx
     18c:	48 89 c8             	mov    %rcx,%rax
     18f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
	
	uint64 tick1, tick2, diff;
	double sum, sqSum;
	int i, j;
	
	TEST_GEN(0, foo0());
     193:	b8 00 00 00 00       	mov    $0x0,%eax
     198:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     19c:	b8 00 00 00 00       	mov    $0x0,%eax
     1a1:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     1a5:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     1ac:	e9 fa 00 00 00       	jmpq   2ab <main+0x1c6>
     1b1:	0f a2                	cpuid  
     1b3:	0f 31                	rdtsc  
     1b5:	89 d3                	mov    %edx,%ebx
     1b7:	41 89 c4             	mov    %eax,%r12d
     1ba:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     1be:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     1c1:	8b 45 a8             	mov    -0x58(%rbp),%eax
     1c4:	8b 55 ac             	mov    -0x54(%rbp),%edx
     1c7:	48 c1 e2 20          	shl    $0x20,%rdx
     1cb:	48 09 d0             	or     %rdx,%rax
     1ce:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     1d2:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     1d9:	eb 0e                	jmp    1e9 <main+0x104>
     1db:	b8 00 00 00 00       	mov    $0x0,%eax
     1e0:	e8 00 00 00 00       	callq  1e5 <main+0x100>
     1e5:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     1e9:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     1ee:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 1f6 <main+0x111>
     1f5:	00 
     1f6:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     1fa:	77 df                	ja     1db <main+0xf6>
     1fc:	0f a2                	cpuid  
     1fe:	0f 31                	rdtsc  
     200:	89 d3                	mov    %edx,%ebx
     202:	41 89 c4             	mov    %eax,%r12d
     205:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     209:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     20c:	8b 45 a8             	mov    -0x58(%rbp),%eax
     20f:	8b 55 ac             	mov    -0x54(%rbp),%edx
     212:	48 c1 e2 20          	shl    $0x20,%rdx
     216:	48 09 d0             	or     %rdx,%rax
     219:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     21d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     221:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     225:	48 89 d1             	mov    %rdx,%rcx
     228:	48 29 c1             	sub    %rax,%rcx
     22b:	48 89 c8             	mov    %rcx,%rax
     22e:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     232:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     238:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     23c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     240:	48 85 c0             	test   %rax,%rax
     243:	78 07                	js     24c <main+0x167>
     245:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     24a:	eb 15                	jmp    261 <main+0x17c>
     24c:	48 89 c2             	mov    %rax,%rdx
     24f:	48 d1 ea             	shr    %rdx
     252:	83 e0 01             	and    $0x1,%eax
     255:	48 09 c2             	or     %rax,%rdx
     258:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     25d:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     261:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     266:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     26a:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     26f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     273:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     278:	48 85 c0             	test   %rax,%rax
     27b:	78 07                	js     284 <main+0x19f>
     27d:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     282:	eb 15                	jmp    299 <main+0x1b4>
     284:	48 89 c2             	mov    %rax,%rdx
     287:	48 d1 ea             	shr    %rdx
     28a:	83 e0 01             	and    $0x1,%eax
     28d:	48 09 c2             	or     %rax,%rdx
     290:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     295:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     299:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     29e:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     2a2:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     2a7:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     2ab:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     2af:	0f 8e fc fe ff ff    	jle    1b1 <main+0xcc>
     2b5:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     2ba:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 2c2 <main+0x1dd>
     2c1:	00 
     2c2:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     2c6:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     2cb:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     2d0:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 2d8 <main+0x1f3>
     2d7:	00 
     2d8:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     2dc:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 2e4 <main+0x1ff>
     2e3:	00 
     2e4:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     2e8:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     2ed:	be 00 00 00 00       	mov    $0x0,%esi
     2f2:	bf 00 00 00 00       	mov    $0x0,%edi
     2f7:	b8 00 00 00 00       	mov    $0x0,%eax
     2fc:	e8 00 00 00 00       	callq  301 <main+0x21c>
     301:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     306:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 30e <main+0x229>
     30d:	00 
     30e:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     312:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 31a <main+0x235>
     319:	00 
     31a:	66 0f 28 d0          	movapd %xmm0,%xmm2
     31e:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     322:	f2 0f 11 55 88       	movsd  %xmm2,-0x78(%rbp)
     327:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     32c:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 334 <main+0x24f>
     333:	00 
     334:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     338:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     33d:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 345 <main+0x260>
     344:	00 
     345:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     349:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
     34e:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 356 <main+0x271>
     355:	00 
     356:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     35a:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     35e:	e8 00 00 00 00       	callq  363 <main+0x27e>
     363:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
     36a:	ff 
     36b:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     372:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     377:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 37f <main+0x29a>
     37e:	00 
     37f:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     383:	f2 0f 10 55 88       	movsd  -0x78(%rbp),%xmm2
     388:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
     38f:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
     396:	ff 
     397:	bf 00 00 00 00       	mov    $0x0,%edi
     39c:	b8 03 00 00 00       	mov    $0x3,%eax
     3a1:	e8 00 00 00 00       	callq  3a6 <main+0x2c1>
	TEST_GEN(1, foo1(1));
     3a6:	b8 00 00 00 00       	mov    $0x0,%eax
     3ab:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     3af:	b8 00 00 00 00       	mov    $0x0,%eax
     3b4:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     3b8:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     3bf:	e9 fa 00 00 00       	jmpq   4be <main+0x3d9>
     3c4:	0f a2                	cpuid  
     3c6:	0f 31                	rdtsc  
     3c8:	89 d3                	mov    %edx,%ebx
     3ca:	41 89 c4             	mov    %eax,%r12d
     3cd:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     3d1:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     3d4:	8b 45 a8             	mov    -0x58(%rbp),%eax
     3d7:	8b 55 ac             	mov    -0x54(%rbp),%edx
     3da:	48 c1 e2 20          	shl    $0x20,%rdx
     3de:	48 09 d0             	or     %rdx,%rax
     3e1:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     3e5:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     3ec:	eb 0e                	jmp    3fc <main+0x317>
     3ee:	bf 01 00 00 00       	mov    $0x1,%edi
     3f3:	e8 00 00 00 00       	callq  3f8 <main+0x313>
     3f8:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     3fc:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     401:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 409 <main+0x324>
     408:	00 
     409:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     40d:	77 df                	ja     3ee <main+0x309>
     40f:	0f a2                	cpuid  
     411:	0f 31                	rdtsc  
     413:	89 d3                	mov    %edx,%ebx
     415:	41 89 c4             	mov    %eax,%r12d
     418:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     41c:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     41f:	8b 45 a8             	mov    -0x58(%rbp),%eax
     422:	8b 55 ac             	mov    -0x54(%rbp),%edx
     425:	48 c1 e2 20          	shl    $0x20,%rdx
     429:	48 09 d0             	or     %rdx,%rax
     42c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     430:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     434:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     438:	48 89 d1             	mov    %rdx,%rcx
     43b:	48 29 c1             	sub    %rax,%rcx
     43e:	48 89 c8             	mov    %rcx,%rax
     441:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     445:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     44b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     44f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     453:	48 85 c0             	test   %rax,%rax
     456:	78 07                	js     45f <main+0x37a>
     458:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     45d:	eb 15                	jmp    474 <main+0x38f>
     45f:	48 89 c2             	mov    %rax,%rdx
     462:	48 d1 ea             	shr    %rdx
     465:	83 e0 01             	and    $0x1,%eax
     468:	48 09 c2             	or     %rax,%rdx
     46b:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     470:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     474:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     479:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     47d:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     482:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     486:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     48b:	48 85 c0             	test   %rax,%rax
     48e:	78 07                	js     497 <main+0x3b2>
     490:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     495:	eb 15                	jmp    4ac <main+0x3c7>
     497:	48 89 c2             	mov    %rax,%rdx
     49a:	48 d1 ea             	shr    %rdx
     49d:	83 e0 01             	and    $0x1,%eax
     4a0:	48 09 c2             	or     %rax,%rdx
     4a3:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     4a8:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     4ac:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     4b1:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     4b5:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     4ba:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     4be:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     4c2:	0f 8e fc fe ff ff    	jle    3c4 <main+0x2df>
     4c8:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     4cd:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 4d5 <main+0x3f0>
     4d4:	00 
     4d5:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     4d9:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     4de:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     4e3:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 4eb <main+0x406>
     4ea:	00 
     4eb:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     4ef:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 4f7 <main+0x412>
     4f6:	00 
     4f7:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     4fb:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     500:	be 01 00 00 00       	mov    $0x1,%esi
     505:	bf 00 00 00 00       	mov    $0x0,%edi
     50a:	b8 00 00 00 00       	mov    $0x0,%eax
     50f:	e8 00 00 00 00       	callq  514 <main+0x42f>
     514:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     519:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 521 <main+0x43c>
     520:	00 
     521:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     525:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 52d <main+0x448>
     52c:	00 
     52d:	66 0f 28 d0          	movapd %xmm0,%xmm2
     531:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     535:	f2 0f 11 55 80       	movsd  %xmm2,-0x80(%rbp)
     53a:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     53f:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 547 <main+0x462>
     546:	00 
     547:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     54b:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     550:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 558 <main+0x473>
     557:	00 
     558:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     55c:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
     561:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 569 <main+0x484>
     568:	00 
     569:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     56d:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     571:	e8 00 00 00 00       	callq  576 <main+0x491>
     576:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
     57d:	ff 
     57e:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     585:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     58a:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 592 <main+0x4ad>
     591:	00 
     592:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     596:	f2 0f 10 55 80       	movsd  -0x80(%rbp),%xmm2
     59b:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
     5a2:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
     5a9:	ff 
     5aa:	bf 00 00 00 00       	mov    $0x0,%edi
     5af:	b8 03 00 00 00       	mov    $0x3,%eax
     5b4:	e8 00 00 00 00       	callq  5b9 <main+0x4d4>
	TEST_GEN(2, foo2(1,2));
     5b9:	b8 00 00 00 00       	mov    $0x0,%eax
     5be:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     5c2:	b8 00 00 00 00       	mov    $0x0,%eax
     5c7:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     5cb:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     5d2:	e9 ff 00 00 00       	jmpq   6d6 <main+0x5f1>
     5d7:	0f a2                	cpuid  
     5d9:	0f 31                	rdtsc  
     5db:	89 d3                	mov    %edx,%ebx
     5dd:	41 89 c4             	mov    %eax,%r12d
     5e0:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     5e4:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     5e7:	8b 45 a8             	mov    -0x58(%rbp),%eax
     5ea:	8b 55 ac             	mov    -0x54(%rbp),%edx
     5ed:	48 c1 e2 20          	shl    $0x20,%rdx
     5f1:	48 09 d0             	or     %rdx,%rax
     5f4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     5f8:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     5ff:	eb 13                	jmp    614 <main+0x52f>
     601:	be 02 00 00 00       	mov    $0x2,%esi
     606:	bf 01 00 00 00       	mov    $0x1,%edi
     60b:	e8 00 00 00 00       	callq  610 <main+0x52b>
     610:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     614:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     619:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 621 <main+0x53c>
     620:	00 
     621:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     625:	77 da                	ja     601 <main+0x51c>
     627:	0f a2                	cpuid  
     629:	0f 31                	rdtsc  
     62b:	89 d3                	mov    %edx,%ebx
     62d:	41 89 c4             	mov    %eax,%r12d
     630:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     634:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     637:	8b 45 a8             	mov    -0x58(%rbp),%eax
     63a:	8b 55 ac             	mov    -0x54(%rbp),%edx
     63d:	48 c1 e2 20          	shl    $0x20,%rdx
     641:	48 09 d0             	or     %rdx,%rax
     644:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     648:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     64c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     650:	48 89 d1             	mov    %rdx,%rcx
     653:	48 29 c1             	sub    %rax,%rcx
     656:	48 89 c8             	mov    %rcx,%rax
     659:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     65d:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     663:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     667:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     66b:	48 85 c0             	test   %rax,%rax
     66e:	78 07                	js     677 <main+0x592>
     670:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     675:	eb 15                	jmp    68c <main+0x5a7>
     677:	48 89 c2             	mov    %rax,%rdx
     67a:	48 d1 ea             	shr    %rdx
     67d:	83 e0 01             	and    $0x1,%eax
     680:	48 09 c2             	or     %rax,%rdx
     683:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     688:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     68c:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     691:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     695:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     69a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     69e:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     6a3:	48 85 c0             	test   %rax,%rax
     6a6:	78 07                	js     6af <main+0x5ca>
     6a8:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     6ad:	eb 15                	jmp    6c4 <main+0x5df>
     6af:	48 89 c2             	mov    %rax,%rdx
     6b2:	48 d1 ea             	shr    %rdx
     6b5:	83 e0 01             	and    $0x1,%eax
     6b8:	48 09 c2             	or     %rax,%rdx
     6bb:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     6c0:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     6c4:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     6c9:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     6cd:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     6d2:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     6d6:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     6da:	0f 8e f7 fe ff ff    	jle    5d7 <main+0x4f2>
     6e0:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     6e5:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 6ed <main+0x608>
     6ec:	00 
     6ed:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     6f1:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     6f6:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     6fb:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 703 <main+0x61e>
     702:	00 
     703:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     707:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 70f <main+0x62a>
     70e:	00 
     70f:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     713:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     718:	be 02 00 00 00       	mov    $0x2,%esi
     71d:	bf 00 00 00 00       	mov    $0x0,%edi
     722:	b8 00 00 00 00       	mov    $0x0,%eax
     727:	e8 00 00 00 00       	callq  72c <main+0x647>
     72c:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     731:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 739 <main+0x654>
     738:	00 
     739:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     73d:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 745 <main+0x660>
     744:	00 
     745:	66 0f 28 d0          	movapd %xmm0,%xmm2
     749:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     74d:	f2 0f 11 95 78 ff ff 	movsd  %xmm2,-0x88(%rbp)
     754:	ff 
     755:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     75a:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 762 <main+0x67d>
     761:	00 
     762:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     766:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     76b:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 773 <main+0x68e>
     772:	00 
     773:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     777:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
     77c:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 784 <main+0x69f>
     783:	00 
     784:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     788:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     78c:	e8 00 00 00 00       	callq  791 <main+0x6ac>
     791:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
     798:	ff 
     799:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     7a0:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     7a5:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 7ad <main+0x6c8>
     7ac:	00 
     7ad:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     7b1:	f2 0f 10 95 78 ff ff 	movsd  -0x88(%rbp),%xmm2
     7b8:	ff 
     7b9:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
     7c0:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
     7c7:	ff 
     7c8:	bf 00 00 00 00       	mov    $0x0,%edi
     7cd:	b8 03 00 00 00       	mov    $0x3,%eax
     7d2:	e8 00 00 00 00       	callq  7d7 <main+0x6f2>
	TEST_GEN(3, foo3(1,2,3));
     7d7:	b8 00 00 00 00       	mov    $0x0,%eax
     7dc:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     7e0:	b8 00 00 00 00       	mov    $0x0,%eax
     7e5:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     7e9:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     7f0:	e9 04 01 00 00       	jmpq   8f9 <main+0x814>
     7f5:	0f a2                	cpuid  
     7f7:	0f 31                	rdtsc  
     7f9:	89 d3                	mov    %edx,%ebx
     7fb:	41 89 c4             	mov    %eax,%r12d
     7fe:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     802:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     805:	8b 45 a8             	mov    -0x58(%rbp),%eax
     808:	8b 55 ac             	mov    -0x54(%rbp),%edx
     80b:	48 c1 e2 20          	shl    $0x20,%rdx
     80f:	48 09 d0             	or     %rdx,%rax
     812:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     816:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     81d:	eb 18                	jmp    837 <main+0x752>
     81f:	ba 03 00 00 00       	mov    $0x3,%edx
     824:	be 02 00 00 00       	mov    $0x2,%esi
     829:	bf 01 00 00 00       	mov    $0x1,%edi
     82e:	e8 00 00 00 00       	callq  833 <main+0x74e>
     833:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     837:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     83c:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 844 <main+0x75f>
     843:	00 
     844:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     848:	77 d5                	ja     81f <main+0x73a>
     84a:	0f a2                	cpuid  
     84c:	0f 31                	rdtsc  
     84e:	89 d3                	mov    %edx,%ebx
     850:	41 89 c4             	mov    %eax,%r12d
     853:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     857:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     85a:	8b 45 a8             	mov    -0x58(%rbp),%eax
     85d:	8b 55 ac             	mov    -0x54(%rbp),%edx
     860:	48 c1 e2 20          	shl    $0x20,%rdx
     864:	48 09 d0             	or     %rdx,%rax
     867:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     86b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     86f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     873:	48 89 d1             	mov    %rdx,%rcx
     876:	48 29 c1             	sub    %rax,%rcx
     879:	48 89 c8             	mov    %rcx,%rax
     87c:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     880:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     886:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     88a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     88e:	48 85 c0             	test   %rax,%rax
     891:	78 07                	js     89a <main+0x7b5>
     893:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     898:	eb 15                	jmp    8af <main+0x7ca>
     89a:	48 89 c2             	mov    %rax,%rdx
     89d:	48 d1 ea             	shr    %rdx
     8a0:	83 e0 01             	and    $0x1,%eax
     8a3:	48 09 c2             	or     %rax,%rdx
     8a6:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     8ab:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     8af:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     8b4:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     8b8:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     8bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     8c1:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     8c6:	48 85 c0             	test   %rax,%rax
     8c9:	78 07                	js     8d2 <main+0x7ed>
     8cb:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     8d0:	eb 15                	jmp    8e7 <main+0x802>
     8d2:	48 89 c2             	mov    %rax,%rdx
     8d5:	48 d1 ea             	shr    %rdx
     8d8:	83 e0 01             	and    $0x1,%eax
     8db:	48 09 c2             	or     %rax,%rdx
     8de:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     8e3:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     8e7:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     8ec:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     8f0:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     8f5:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     8f9:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     8fd:	0f 8e f2 fe ff ff    	jle    7f5 <main+0x710>
     903:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     908:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 910 <main+0x82b>
     90f:	00 
     910:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     914:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     919:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     91e:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 926 <main+0x841>
     925:	00 
     926:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     92a:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 932 <main+0x84d>
     931:	00 
     932:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     936:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     93b:	be 03 00 00 00       	mov    $0x3,%esi
     940:	bf 00 00 00 00       	mov    $0x0,%edi
     945:	b8 00 00 00 00       	mov    $0x0,%eax
     94a:	e8 00 00 00 00       	callq  94f <main+0x86a>
     94f:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     954:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 95c <main+0x877>
     95b:	00 
     95c:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     960:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 968 <main+0x883>
     967:	00 
     968:	66 0f 28 d0          	movapd %xmm0,%xmm2
     96c:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     970:	f2 0f 11 95 70 ff ff 	movsd  %xmm2,-0x90(%rbp)
     977:	ff 
     978:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     97d:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 985 <main+0x8a0>
     984:	00 
     985:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     989:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     98e:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 996 <main+0x8b1>
     995:	00 
     996:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     99a:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
     99f:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 9a7 <main+0x8c2>
     9a6:	00 
     9a7:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     9ab:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     9af:	e8 00 00 00 00       	callq  9b4 <main+0x8cf>
     9b4:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
     9bb:	ff 
     9bc:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     9c3:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     9c8:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 9d0 <main+0x8eb>
     9cf:	00 
     9d0:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     9d4:	f2 0f 10 95 70 ff ff 	movsd  -0x90(%rbp),%xmm2
     9db:	ff 
     9dc:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
     9e3:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
     9ea:	ff 
     9eb:	bf 00 00 00 00       	mov    $0x0,%edi
     9f0:	b8 03 00 00 00       	mov    $0x3,%eax
     9f5:	e8 00 00 00 00       	callq  9fa <main+0x915>
	TEST_GEN(4, foo4(1,2,3,4));
     9fa:	b8 00 00 00 00       	mov    $0x0,%eax
     9ff:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     a03:	b8 00 00 00 00       	mov    $0x0,%eax
     a08:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     a0c:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     a13:	e9 09 01 00 00       	jmpq   b21 <main+0xa3c>
     a18:	0f a2                	cpuid  
     a1a:	0f 31                	rdtsc  
     a1c:	89 d3                	mov    %edx,%ebx
     a1e:	41 89 c4             	mov    %eax,%r12d
     a21:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     a25:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     a28:	8b 45 a8             	mov    -0x58(%rbp),%eax
     a2b:	8b 55 ac             	mov    -0x54(%rbp),%edx
     a2e:	48 c1 e2 20          	shl    $0x20,%rdx
     a32:	48 09 d0             	or     %rdx,%rax
     a35:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     a39:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     a40:	eb 1d                	jmp    a5f <main+0x97a>
     a42:	b9 04 00 00 00       	mov    $0x4,%ecx
     a47:	ba 03 00 00 00       	mov    $0x3,%edx
     a4c:	be 02 00 00 00       	mov    $0x2,%esi
     a51:	bf 01 00 00 00       	mov    $0x1,%edi
     a56:	e8 00 00 00 00       	callq  a5b <main+0x976>
     a5b:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     a5f:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     a64:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # a6c <main+0x987>
     a6b:	00 
     a6c:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     a70:	77 d0                	ja     a42 <main+0x95d>
     a72:	0f a2                	cpuid  
     a74:	0f 31                	rdtsc  
     a76:	89 d3                	mov    %edx,%ebx
     a78:	41 89 c4             	mov    %eax,%r12d
     a7b:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     a7f:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     a82:	8b 45 a8             	mov    -0x58(%rbp),%eax
     a85:	8b 55 ac             	mov    -0x54(%rbp),%edx
     a88:	48 c1 e2 20          	shl    $0x20,%rdx
     a8c:	48 09 d0             	or     %rdx,%rax
     a8f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     a93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     a97:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     a9b:	48 89 d1             	mov    %rdx,%rcx
     a9e:	48 29 c1             	sub    %rax,%rcx
     aa1:	48 89 c8             	mov    %rcx,%rax
     aa4:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     aa8:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     aae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     ab2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     ab6:	48 85 c0             	test   %rax,%rax
     ab9:	78 07                	js     ac2 <main+0x9dd>
     abb:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     ac0:	eb 15                	jmp    ad7 <main+0x9f2>
     ac2:	48 89 c2             	mov    %rax,%rdx
     ac5:	48 d1 ea             	shr    %rdx
     ac8:	83 e0 01             	and    $0x1,%eax
     acb:	48 09 c2             	or     %rax,%rdx
     ace:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     ad3:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     ad7:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     adc:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     ae0:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     ae5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     ae9:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     aee:	48 85 c0             	test   %rax,%rax
     af1:	78 07                	js     afa <main+0xa15>
     af3:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     af8:	eb 15                	jmp    b0f <main+0xa2a>
     afa:	48 89 c2             	mov    %rax,%rdx
     afd:	48 d1 ea             	shr    %rdx
     b00:	83 e0 01             	and    $0x1,%eax
     b03:	48 09 c2             	or     %rax,%rdx
     b06:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     b0b:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     b0f:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     b14:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     b18:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     b1d:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     b21:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     b25:	0f 8e ed fe ff ff    	jle    a18 <main+0x933>
     b2b:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     b30:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # b38 <main+0xa53>
     b37:	00 
     b38:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     b3c:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     b41:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     b46:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # b4e <main+0xa69>
     b4d:	00 
     b4e:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     b52:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # b5a <main+0xa75>
     b59:	00 
     b5a:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     b5e:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     b63:	be 04 00 00 00       	mov    $0x4,%esi
     b68:	bf 00 00 00 00       	mov    $0x0,%edi
     b6d:	b8 00 00 00 00       	mov    $0x0,%eax
     b72:	e8 00 00 00 00       	callq  b77 <main+0xa92>
     b77:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     b7c:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # b84 <main+0xa9f>
     b83:	00 
     b84:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     b88:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # b90 <main+0xaab>
     b8f:	00 
     b90:	66 0f 28 d0          	movapd %xmm0,%xmm2
     b94:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     b98:	f2 0f 11 95 68 ff ff 	movsd  %xmm2,-0x98(%rbp)
     b9f:	ff 
     ba0:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     ba5:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # bad <main+0xac8>
     bac:	00 
     bad:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     bb1:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     bb6:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # bbe <main+0xad9>
     bbd:	00 
     bbe:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     bc2:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
     bc7:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # bcf <main+0xaea>
     bce:	00 
     bcf:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     bd3:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     bd7:	e8 00 00 00 00       	callq  bdc <main+0xaf7>
     bdc:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
     be3:	ff 
     be4:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     beb:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     bf0:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # bf8 <main+0xb13>
     bf7:	00 
     bf8:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     bfc:	f2 0f 10 95 68 ff ff 	movsd  -0x98(%rbp),%xmm2
     c03:	ff 
     c04:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
     c0b:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
     c12:	ff 
     c13:	bf 00 00 00 00       	mov    $0x0,%edi
     c18:	b8 03 00 00 00       	mov    $0x3,%eax
     c1d:	e8 00 00 00 00       	callq  c22 <main+0xb3d>
	TEST_GEN(5, foo5(1,2,3,4,5));
     c22:	b8 00 00 00 00       	mov    $0x0,%eax
     c27:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     c2b:	b8 00 00 00 00       	mov    $0x0,%eax
     c30:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     c34:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     c3b:	e9 0f 01 00 00       	jmpq   d4f <main+0xc6a>
     c40:	0f a2                	cpuid  
     c42:	0f 31                	rdtsc  
     c44:	89 d3                	mov    %edx,%ebx
     c46:	41 89 c4             	mov    %eax,%r12d
     c49:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     c4d:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     c50:	8b 45 a8             	mov    -0x58(%rbp),%eax
     c53:	8b 55 ac             	mov    -0x54(%rbp),%edx
     c56:	48 c1 e2 20          	shl    $0x20,%rdx
     c5a:	48 09 d0             	or     %rdx,%rax
     c5d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     c61:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     c68:	eb 23                	jmp    c8d <main+0xba8>
     c6a:	41 b8 05 00 00 00    	mov    $0x5,%r8d
     c70:	b9 04 00 00 00       	mov    $0x4,%ecx
     c75:	ba 03 00 00 00       	mov    $0x3,%edx
     c7a:	be 02 00 00 00       	mov    $0x2,%esi
     c7f:	bf 01 00 00 00       	mov    $0x1,%edi
     c84:	e8 00 00 00 00       	callq  c89 <main+0xba4>
     c89:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     c8d:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     c92:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # c9a <main+0xbb5>
     c99:	00 
     c9a:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     c9e:	77 ca                	ja     c6a <main+0xb85>
     ca0:	0f a2                	cpuid  
     ca2:	0f 31                	rdtsc  
     ca4:	89 d3                	mov    %edx,%ebx
     ca6:	41 89 c4             	mov    %eax,%r12d
     ca9:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     cad:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     cb0:	8b 45 a8             	mov    -0x58(%rbp),%eax
     cb3:	8b 55 ac             	mov    -0x54(%rbp),%edx
     cb6:	48 c1 e2 20          	shl    $0x20,%rdx
     cba:	48 09 d0             	or     %rdx,%rax
     cbd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     cc1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     cc5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     cc9:	48 89 d1             	mov    %rdx,%rcx
     ccc:	48 29 c1             	sub    %rax,%rcx
     ccf:	48 89 c8             	mov    %rcx,%rax
     cd2:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     cd6:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     cdc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     ce0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     ce4:	48 85 c0             	test   %rax,%rax
     ce7:	78 07                	js     cf0 <main+0xc0b>
     ce9:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     cee:	eb 15                	jmp    d05 <main+0xc20>
     cf0:	48 89 c2             	mov    %rax,%rdx
     cf3:	48 d1 ea             	shr    %rdx
     cf6:	83 e0 01             	and    $0x1,%eax
     cf9:	48 09 c2             	or     %rax,%rdx
     cfc:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     d01:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     d05:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     d0a:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     d0e:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     d13:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     d17:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     d1c:	48 85 c0             	test   %rax,%rax
     d1f:	78 07                	js     d28 <main+0xc43>
     d21:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     d26:	eb 15                	jmp    d3d <main+0xc58>
     d28:	48 89 c2             	mov    %rax,%rdx
     d2b:	48 d1 ea             	shr    %rdx
     d2e:	83 e0 01             	and    $0x1,%eax
     d31:	48 09 c2             	or     %rax,%rdx
     d34:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     d39:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     d3d:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     d42:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     d46:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     d4b:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     d4f:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     d53:	0f 8e e7 fe ff ff    	jle    c40 <main+0xb5b>
     d59:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     d5e:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # d66 <main+0xc81>
     d65:	00 
     d66:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     d6a:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     d6f:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     d74:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # d7c <main+0xc97>
     d7b:	00 
     d7c:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     d80:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # d88 <main+0xca3>
     d87:	00 
     d88:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     d8c:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     d91:	be 05 00 00 00       	mov    $0x5,%esi
     d96:	bf 00 00 00 00       	mov    $0x0,%edi
     d9b:	b8 00 00 00 00       	mov    $0x0,%eax
     da0:	e8 00 00 00 00       	callq  da5 <main+0xcc0>
     da5:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     daa:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # db2 <main+0xccd>
     db1:	00 
     db2:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     db6:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # dbe <main+0xcd9>
     dbd:	00 
     dbe:	66 0f 28 d0          	movapd %xmm0,%xmm2
     dc2:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     dc6:	f2 0f 11 95 60 ff ff 	movsd  %xmm2,-0xa0(%rbp)
     dcd:	ff 
     dce:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     dd3:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # ddb <main+0xcf6>
     dda:	00 
     ddb:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     ddf:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     de4:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # dec <main+0xd07>
     deb:	00 
     dec:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     df0:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
     df5:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # dfd <main+0xd18>
     dfc:	00 
     dfd:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
     e01:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     e05:	e8 00 00 00 00       	callq  e0a <main+0xd25>
     e0a:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
     e11:	ff 
     e12:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     e19:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     e1e:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # e26 <main+0xd41>
     e25:	00 
     e26:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     e2a:	f2 0f 10 95 60 ff ff 	movsd  -0xa0(%rbp),%xmm2
     e31:	ff 
     e32:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
     e39:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
     e40:	ff 
     e41:	bf 00 00 00 00       	mov    $0x0,%edi
     e46:	b8 03 00 00 00       	mov    $0x3,%eax
     e4b:	e8 00 00 00 00       	callq  e50 <main+0xd6b>
	TEST_GEN(6, foo6(1,2,3,4,5,6));
     e50:	b8 00 00 00 00       	mov    $0x0,%eax
     e55:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     e59:	b8 00 00 00 00       	mov    $0x0,%eax
     e5e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     e62:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
     e69:	e9 15 01 00 00       	jmpq   f83 <main+0xe9e>
     e6e:	0f a2                	cpuid  
     e70:	0f 31                	rdtsc  
     e72:	89 d3                	mov    %edx,%ebx
     e74:	41 89 c4             	mov    %eax,%r12d
     e77:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     e7b:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     e7e:	8b 45 a8             	mov    -0x58(%rbp),%eax
     e81:	8b 55 ac             	mov    -0x54(%rbp),%edx
     e84:	48 c1 e2 20          	shl    $0x20,%rdx
     e88:	48 09 d0             	or     %rdx,%rax
     e8b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     e8f:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
     e96:	eb 29                	jmp    ec1 <main+0xddc>
     e98:	41 b9 06 00 00 00    	mov    $0x6,%r9d
     e9e:	41 b8 05 00 00 00    	mov    $0x5,%r8d
     ea4:	b9 04 00 00 00       	mov    $0x4,%ecx
     ea9:	ba 03 00 00 00       	mov    $0x3,%edx
     eae:	be 02 00 00 00       	mov    $0x2,%esi
     eb3:	bf 01 00 00 00       	mov    $0x1,%edi
     eb8:	e8 00 00 00 00       	callq  ebd <main+0xdd8>
     ebd:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
     ec1:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
     ec6:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # ece <main+0xde9>
     ecd:	00 
     ece:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
     ed2:	77 c4                	ja     e98 <main+0xdb3>
     ed4:	0f a2                	cpuid  
     ed6:	0f 31                	rdtsc  
     ed8:	89 d3                	mov    %edx,%ebx
     eda:	41 89 c4             	mov    %eax,%r12d
     edd:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
     ee1:	89 5d ac             	mov    %ebx,-0x54(%rbp)
     ee4:	8b 45 a8             	mov    -0x58(%rbp),%eax
     ee7:	8b 55 ac             	mov    -0x54(%rbp),%edx
     eea:	48 c1 e2 20          	shl    $0x20,%rdx
     eee:	48 09 d0             	or     %rdx,%rax
     ef1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     ef5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ef9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     efd:	48 89 d1             	mov    %rdx,%rcx
     f00:	48 29 c1             	sub    %rax,%rcx
     f03:	48 89 c8             	mov    %rcx,%rax
     f06:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
     f0a:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
     f10:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     f14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f18:	48 85 c0             	test   %rax,%rax
     f1b:	78 07                	js     f24 <main+0xe3f>
     f1d:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     f22:	eb 15                	jmp    f39 <main+0xe54>
     f24:	48 89 c2             	mov    %rax,%rdx
     f27:	48 d1 ea             	shr    %rdx
     f2a:	83 e0 01             	and    $0x1,%eax
     f2d:	48 09 c2             	or     %rax,%rdx
     f30:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     f35:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     f39:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
     f3e:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     f42:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     f47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f4b:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
     f50:	48 85 c0             	test   %rax,%rax
     f53:	78 07                	js     f5c <main+0xe77>
     f55:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
     f5a:	eb 15                	jmp    f71 <main+0xe8c>
     f5c:	48 89 c2             	mov    %rax,%rdx
     f5f:	48 d1 ea             	shr    %rdx
     f62:	83 e0 01             	and    $0x1,%eax
     f65:	48 09 c2             	or     %rax,%rdx
     f68:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
     f6d:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
     f71:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
     f76:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
     f7a:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     f7f:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
     f83:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
     f87:	0f 8e e1 fe ff ff    	jle    e6e <main+0xd89>
     f8d:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     f92:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # f9a <main+0xeb5>
     f99:	00 
     f9a:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     f9e:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
     fa3:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
     fa8:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # fb0 <main+0xecb>
     faf:	00 
     fb0:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     fb4:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # fbc <main+0xed7>
     fbb:	00 
     fbc:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     fc0:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
     fc5:	be 06 00 00 00       	mov    $0x6,%esi
     fca:	bf 00 00 00 00       	mov    $0x0,%edi
     fcf:	b8 00 00 00 00       	mov    $0x0,%eax
     fd4:	e8 00 00 00 00       	callq  fd9 <main+0xef4>
     fd9:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
     fde:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # fe6 <main+0xf01>
     fe5:	00 
     fe6:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
     fea:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # ff2 <main+0xf0d>
     ff1:	00 
     ff2:	66 0f 28 d0          	movapd %xmm0,%xmm2
     ff6:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
     ffa:	f2 0f 11 95 58 ff ff 	movsd  %xmm2,-0xa8(%rbp)
    1001:	ff 
    1002:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
    1007:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 100f <main+0xf2a>
    100e:	00 
    100f:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    1013:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
    1018:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 1020 <main+0xf3b>
    101f:	00 
    1020:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
    1024:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
    1029:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 1031 <main+0xf4c>
    1030:	00 
    1031:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
    1035:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
    1039:	e8 00 00 00 00       	callq  103e <main+0xf59>
    103e:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
    1045:	ff 
    1046:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
    104d:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
    1052:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 105a <main+0xf75>
    1059:	00 
    105a:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    105e:	f2 0f 10 95 58 ff ff 	movsd  -0xa8(%rbp),%xmm2
    1065:	ff 
    1066:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
    106d:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
    1074:	ff 
    1075:	bf 00 00 00 00       	mov    $0x0,%edi
    107a:	b8 03 00 00 00       	mov    $0x3,%eax
    107f:	e8 00 00 00 00       	callq  1084 <main+0xf9f>
	TEST_GEN(7, foo7(1,2,3,4,5,6,7));
    1084:	b8 00 00 00 00       	mov    $0x0,%eax
    1089:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    108d:	b8 00 00 00 00       	mov    $0x0,%eax
    1092:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1096:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    109d:	e9 1c 01 00 00       	jmpq   11be <main+0x10d9>
    10a2:	0f a2                	cpuid  
    10a4:	0f 31                	rdtsc  
    10a6:	89 d3                	mov    %edx,%ebx
    10a8:	41 89 c4             	mov    %eax,%r12d
    10ab:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
    10af:	89 5d ac             	mov    %ebx,-0x54(%rbp)
    10b2:	8b 45 a8             	mov    -0x58(%rbp),%eax
    10b5:	8b 55 ac             	mov    -0x54(%rbp),%edx
    10b8:	48 c1 e2 20          	shl    $0x20,%rdx
    10bc:	48 09 d0             	or     %rdx,%rax
    10bf:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    10c3:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
    10ca:	eb 30                	jmp    10fc <main+0x1017>
    10cc:	c7 04 24 07 00 00 00 	movl   $0x7,(%rsp)
    10d3:	41 b9 06 00 00 00    	mov    $0x6,%r9d
    10d9:	41 b8 05 00 00 00    	mov    $0x5,%r8d
    10df:	b9 04 00 00 00       	mov    $0x4,%ecx
    10e4:	ba 03 00 00 00       	mov    $0x3,%edx
    10e9:	be 02 00 00 00       	mov    $0x2,%esi
    10ee:	bf 01 00 00 00       	mov    $0x1,%edi
    10f3:	e8 00 00 00 00       	callq  10f8 <main+0x1013>
    10f8:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
    10fc:	f2 0f 2a 45 a4       	cvtsi2sdl -0x5c(%rbp),%xmm0
    1101:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 1109 <main+0x1024>
    1108:	00 
    1109:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
    110d:	77 bd                	ja     10cc <main+0xfe7>
    110f:	0f a2                	cpuid  
    1111:	0f 31                	rdtsc  
    1113:	89 d3                	mov    %edx,%ebx
    1115:	41 89 c4             	mov    %eax,%r12d
    1118:	44 89 65 a8          	mov    %r12d,-0x58(%rbp)
    111c:	89 5d ac             	mov    %ebx,-0x54(%rbp)
    111f:	8b 45 a8             	mov    -0x58(%rbp),%eax
    1122:	8b 55 ac             	mov    -0x54(%rbp),%edx
    1125:	48 c1 e2 20          	shl    $0x20,%rdx
    1129:	48 09 d0             	or     %rdx,%rax
    112c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1130:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1134:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1138:	48 89 d1             	mov    %rdx,%rcx
    113b:	48 29 c1             	sub    %rax,%rcx
    113e:	48 89 c8             	mov    %rcx,%rax
    1141:	48 2b 45 d0          	sub    -0x30(%rbp),%rax
    1145:	48 2d 00 38 32 04    	sub    $0x4323800,%rax
    114b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    114f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1153:	48 85 c0             	test   %rax,%rax
    1156:	78 07                	js     115f <main+0x107a>
    1158:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
    115d:	eb 15                	jmp    1174 <main+0x108f>
    115f:	48 89 c2             	mov    %rax,%rdx
    1162:	48 d1 ea             	shr    %rdx
    1165:	83 e0 01             	and    $0x1,%eax
    1168:	48 09 c2             	or     %rax,%rdx
    116b:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
    1170:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
    1174:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
    1179:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    117d:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
    1182:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1186:	48 0f af 45 e8       	imul   -0x18(%rbp),%rax
    118b:	48 85 c0             	test   %rax,%rax
    118e:	78 07                	js     1197 <main+0x10b2>
    1190:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
    1195:	eb 15                	jmp    11ac <main+0x10c7>
    1197:	48 89 c2             	mov    %rax,%rdx
    119a:	48 d1 ea             	shr    %rdx
    119d:	83 e0 01             	and    $0x1,%eax
    11a0:	48 09 c2             	or     %rax,%rdx
    11a3:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
    11a8:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
    11ac:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
    11b1:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    11b5:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
    11ba:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    11be:	83 7d a0 63          	cmpl   $0x63,-0x60(%rbp)
    11c2:	0f 8e da fe ff ff    	jle    10a2 <main+0xfbd>
    11c8:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
    11cd:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 11d5 <main+0x10f0>
    11d4:	00 
    11d5:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    11d9:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
    11de:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
    11e3:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 11eb <main+0x1106>
    11ea:	00 
    11eb:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    11ef:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 11f7 <main+0x1112>
    11f6:	00 
    11f7:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    11fb:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
    1200:	be 07 00 00 00       	mov    $0x7,%esi
    1205:	bf 00 00 00 00       	mov    $0x0,%edi
    120a:	b8 00 00 00 00       	mov    $0x0,%eax
    120f:	e8 00 00 00 00       	callq  1214 <main+0x112f>
    1214:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
    1219:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 1221 <main+0x113c>
    1220:	00 
    1221:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    1225:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 122d <main+0x1148>
    122c:	00 
    122d:	66 0f 28 d0          	movapd %xmm0,%xmm2
    1231:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
    1235:	f2 0f 11 95 50 ff ff 	movsd  %xmm2,-0xb0(%rbp)
    123c:	ff 
    123d:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
    1242:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 124a <main+0x1165>
    1249:	00 
    124a:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    124e:	f2 0f 10 4d b0       	movsd  -0x50(%rbp),%xmm1
    1253:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 125b <main+0x1176>
    125a:	00 
    125b:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
    125f:	f2 0f 59 4d b0       	mulsd  -0x50(%rbp),%xmm1
    1264:	f2 0f 10 15 00 00 00 	movsd  0x0(%rip),%xmm2        # 126c <main+0x1187>
    126b:	00 
    126c:	f2 0f 5e ca          	divsd  %xmm2,%xmm1
    1270:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
    1274:	e8 00 00 00 00       	callq  1279 <main+0x1194>
    1279:	f2 0f 11 85 48 ff ff 	movsd  %xmm0,-0xb8(%rbp)
    1280:	ff 
    1281:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
    1288:	f2 0f 10 45 b0       	movsd  -0x50(%rbp),%xmm0
    128d:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 1295 <main+0x11b0>
    1294:	00 
    1295:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    1299:	f2 0f 10 95 50 ff ff 	movsd  -0xb0(%rbp),%xmm2
    12a0:	ff 
    12a1:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
    12a8:	f2 0f 10 8d 48 ff ff 	movsd  -0xb8(%rbp),%xmm1
    12af:	ff 
    12b0:	bf 00 00 00 00       	mov    $0x0,%edi
    12b5:	b8 03 00 00 00       	mov    $0x3,%eax
    12ba:	e8 00 00 00 00       	callq  12bf <main+0x11da>
	
	return 0;
    12bf:	b8 00 00 00 00       	mov    $0x0,%eax
}		
    12c4:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
    12cb:	5b                   	pop    %rbx
    12cc:	41 5c                	pop    %r12
    12ce:	5d                   	pop    %rbp
    12cf:	c3                   	retq   
