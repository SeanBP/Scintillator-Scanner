rcdaq_client load librcdaqplugin_drs.so
sleep 2
rcdaq_client create_device device_drs -- 1 1001 0x21 -5 positive 550 0 0 1024 0
sleep 2
rcdaq_control.pl &
sleep 2
rcdaq_client daq_open

INT1=0
for i in {0..500..50}
	do
		for j in {0..500..50}
			do
			
				echo "moving to $i,$j"
				python StepperMotor/move.py $i,$j <<< "hi"
				sleep 2
				if [ $j -eq $INT1 ]
				then
					sleep 2
				fi
				rcdaq_client daq_begin
                                sleep 60
                                rcdaq_client daq_end

			done

	done 
python StepperMotor/move.py 0,0 <<< "hi"
rcdaq_client daq_close
rcdaq_client daq_shutdown
