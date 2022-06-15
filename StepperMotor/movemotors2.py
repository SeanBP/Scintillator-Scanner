(sleep 2; echo "hi") | python move.py 100,0
sleep 4
for i in {0..-100..-100}
	do
		for j in {0..-100..-100}
			do
				echo "moving to $i,$j"
				(sleep 2; echo "hi") | python move.py -100,0
				sleep 2
			done	
		(sleep 2; echo "hi") | python move.py 200,-100
                sleep 4

	done 
(sleep 2; echo "hi") | python move.py -100,100

