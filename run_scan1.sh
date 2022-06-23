(sleep 2; echo "hi") | python StepperMotor/move.py -65,0
rcdaq_client load librcdaqplugin_drs.so
sleep 2
rcdaq_client create_device device_drs -- 1 1001 0x28 400 positive 100 3
sleep 2
rcdaq_control.pl &
sleep 2
rcdaq_client daq_open

for i in {0..2600..65}
	do
		for j in {0..2600..65}
			do
				echo "moving to $i,$j"
				(sleep 2; echo "hi") | python StepperMotor/move.py 65,0
				sleep 3
				rcdaq_client daq_begin
				sleep 2
				rcdaq_client daq_end
			done
		
		(sleep 2; echo "hi") | python StepperMotor/move.py -2600,65
                sleep 10
		(sleep 2; echo "hi") | python StepperMotor/move.py -65,0
		sleep 3

	done 
rcdaq_client daq_close
sleep 2
rcdaq_client daq_shutdown
cd data
bash ConvertToTxt.sh
