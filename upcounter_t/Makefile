all: result.vcd

result.vcd: t_flipflop.vhdl t_flipflop_tb.vhdl
	ghdl -a t_flipflop.vhdl
	ghdl -a t_flipflop_tb.vhdl
	ghdl -e t_flipflop_tb
	ghdl -r t_flipflop_tb --vcd=result.vcd --stop-time=5us

clean:
	rm -rf result.vcd
