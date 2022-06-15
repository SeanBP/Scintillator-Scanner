
INT1=0
for i in {0..-500..-100}
	do
		for j in {0..-500..-100}
			do
			
				echo "moving to $i,$j"
				python move.py $i,$j <<< "hi"
				sleep 2
				if [ $j -eq $INT1 ]
				then
					sleep 2
				fi
			done

	done 
python move.py 0,0 <<< "hi"
