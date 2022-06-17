mkdir Jun14Finger/
for i in {00000001..00000001}
	do
		new=$(echo $i | sed 's/^0*//')
		ddump -i -n 1000 evt_data/rcdaq-$i-0000.evt > Jun14Finger/$new.txt
		echo $i
	done
