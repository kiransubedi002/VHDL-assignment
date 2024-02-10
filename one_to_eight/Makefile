all: result.vcd

result.vcd: one_eight.vhdl one_eight_tb.vhdl
	ghdl -a one_eight.vhdl
	ghdl -a one_eight_tb.vhdl
	ghdl -e one_eight_tb
	ghdl -r one_eight_tb --vcd=result.vcd --stop-time=10us

clean:
	rm -rf result.vcd
