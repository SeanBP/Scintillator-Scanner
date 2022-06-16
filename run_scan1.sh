(sleep 2; echo "hi") | python StepperMotor/move.py -60,0
rcdaq_client load librcdaqplugin_drs.so
sleep 2
rcdaq_client create_device device_drs -- 1 1001 0x21 -15 negative 550 0 0 1024 0
sleep 2
rcdaq_control.pl &
sleep 2
rcdaq_client daq_open

for i in {0..1800..60}
	do
		for j in {0..1800..60}
			do
				echo "moving to $i,$j"
				(sleep 2; echo "hi") | python StepperMotor/move.py 60,0
				sleep 3
				rcdaq_client daq_begin
				sleep 2
				rcdaq_client daq_end
			done
		
		(sleep 2; echo "hi") | python StepperMotor/move.py -1800,60
                sleep 10
		(sleep 2; echo "hi") | python StepperMotor/move.py -60,0
		sleep 3

	done 
rcdaq_client daq_close
sleep 2
rcdaq_client daq_shutdown
cd data
bash ConvertToTxt.sh
