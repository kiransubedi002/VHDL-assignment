all: result.vcd

result.vcd: jk.vhdl jk_tb.vhdl
	ghdl -a jk.vhdl
	ghdl -a jk_tb.vhdl
	ghdl -e jk_tb
	ghdl -r jk_tb --vcd=result.vcd --stop-time=5us

clean:
	rm -rf result.vcd
