(sleep 2; echo "hi") | python StepperMotor/move.py -100,0
rcdaq_client load librcdaqplugin_drs.so
sleep 2
rcdaq_client create_device device_drs -- 1 1001 0x22 100 positive 550 0 0 1024 0
sleep 2
rcdaq_control.pl &
sleep 2
rcdaq_client daq_open

for i in {0..3000..100}
	do
		for j in {0..3000..100}
			do
				echo "moving to $i,$j"
				(sleep 2; echo "hi") | python StepperMotor/move.py 100,0
				sleep 3
				rcdaq_client daq_begin
				sleep 2
				rcdaq_client daq_end
			done
		
		(sleep 2; echo "hi") | python StepperMotor/move.py -3000,100
                sleep 10
		(sleep 2; echo "hi") | python StepperMotor/move.py -100,0
		sleep 3

	done 
rcdaq_client daq_close
sleep 2
rcdaq_client daq_shutdown
cd data
bash ConvertToTxt.sh
