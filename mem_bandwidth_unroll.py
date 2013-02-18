dataSize = 3 * 2**30
unrollCount = 1024

assert dataSize % 8 == 0
dataCount = dataSize / 8
unrollSize = unrollCount * 8
assert dataSize % unrollSize == 0
loopSize = dataSize / unrollSize
assert loopSize < 2**31

f = open("mem_bandwidth.h","w")
f.write("//Auto-generated. Do not modify this file.\n")
f.write("#define DATA_SIZE " + str(dataSize) + "LL\n")
f.write("#define DATA_COUNT " + str(dataCount) + "LL\n")
f.write("#define UNROLL_SIZE " + str(unrollSize) + "\n")
f.write("#define UNROLL_COUNT " + str(unrollCount) + "\n")
f.write("#define LOOP_SIZE_INNER " + str(loopSize) + "\n")

#copy
f.write("#define memCopyTest(src, dst) \\\n")
f.write("register uint64 *pSrc = src;\\\nregister uint64 *pDst = dst;\\\nuint64 *pSrcEnd = src + DATA_COUNT;\\\n")
f.write("for (; pSrc < pSrcEnd; pSrc += UNROLL_COUNT, pDst += UNROLL_COUNT) { \\\n")

for i in range(unrollCount):
	f.write("\tpDst[" + str(i) + "] = pSrc[" + str(i) + "];\\\n")

#f.write("\tprintf(\"%llu - %llu done\\n\", (uint64)(pSrc - src), (uint64)(pSrc + UNROLL_COUNT - src));\\\n")
f.write("}\n")

#read
f.write("#define memReadTest(src) \\\n")
f.write("register uint64 *pSrc = src;\\\nregister uint64 dummySum = 0;\\\nuint64 *pSrcEnd = src + DATA_COUNT;\\\n")
f.write("for (; pSrc < pSrcEnd; pSrc += UNROLL_COUNT ) { \\\n")

for i in range(unrollCount):
	f.write("\tdummySum += pSrc[" + str(i) + "];\\\n")

#f.write("\tprintf(\"%llu - %llu done\\n\", (uint64)(pSrc - src), (uint64)(pSrc + UNROLL_COUNT - src));\\\n")
f.write("}\\\n")
f.write("printf(\"sum=%llu\\n\", dummySum);\n")

#write
f.write("#define memWriteTest(src) \\\n")
f.write("register uint64 *pSrc = src;\\\nuint64 *pSrcEnd = src + DATA_COUNT;\\\n")
f.write("for (; pSrc < pSrcEnd; pSrc += UNROLL_COUNT ) { \\\n")

for i in range(unrollCount):
	f.write("\tpSrc[" + str(i) + "] = " + str(i) + ";\\\n")

#f.write("\tprintf(\"%llu - %llu done\\n\", (uint64)(pSrc - src), (uint64)(pSrc + UNROLL_COUNT - src));\\\n")
f.write("}\n")




f.close()

f = open("mem_bandwidth.h", "r")
print f.read()
f.close()




