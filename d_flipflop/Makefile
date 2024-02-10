all: result.vcd

result.vcd: d_flipflop.vhdl d_flipflop_tb.vhdl
	ghdl -a d_flipflop.vhdl
	ghdl -a d_flipflop_tb.vhdl
	ghdl -e d_flipflop_tb
	ghdl -r d_flipflop_tb --vcd=result.vcd --stop-time=5us

clean:
	rm -rf result.vcd
