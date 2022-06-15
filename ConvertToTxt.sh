mkdir Jun14Scan/
for i in {00000001..00000961}
	do
		new=$(echo $i | sed 's/^0*//')
		ddump -i -n 1000 evt_data/rcdaq-$i-0000.evt > Jun14Scan/$new.txt
		echo $i
	done
