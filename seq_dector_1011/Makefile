all: result.vcd

result.vcd: seq_det.vhdl seq_det_tb.vhdl
	ghdl -a seq_det.vhdl
	ghdl -a seq_det_tb.vhdl
	ghdl -e seq_det_tb
	ghdl -r seq_det_tb --vcd=result.vcd --stop-time=5us

clean:
	rm -rf result.vcd
