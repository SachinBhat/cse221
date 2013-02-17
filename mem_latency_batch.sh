#Measure all sizes and strides in batch

echo "size,stride,avg,std,time_avg,time_std"
for stride in 8 16 32 64 96 97 128 192 256
do
	for logSize in {10..30}
	do
		let size=2**$logSize
		taskset -c 0 nice -n -20 ./mem_latency $size $stride
		#echo $size
	done
done

