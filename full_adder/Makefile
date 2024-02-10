all: result.vcd

result.vcd: full_adder.vhdl full_adder_tb.vhdl
	ghdl -a full_adder.vhdl
	ghdl -a full_adder_tb.vhdl
	ghdl -e fa_test
	ghdl -r fa_test --vcd=result.vcd --stop-time=5us

clean:
	rm -rf result.vcd
