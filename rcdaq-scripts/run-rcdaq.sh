rcdaq_client load librcdaqplugin_drs.so
sleep 4
rcdaq_client create_device device_drs -- 1 1001 0x21 60 positive 438 2
sleep 4
rcdaq_control.pl &
sleep 4
rcdaq_client daq_open
for i in {0..3..1}
	do
		rcdaq_client daq_begin
		sleep 4
		rcdaq_client daq_end
	done
rcdaq_client daq_close

