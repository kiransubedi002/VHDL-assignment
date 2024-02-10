all: result.vcd

result.vcd: bcd.vhdl bcd_tb.vhdl
	ghdl -a bcd.vhdl
	ghdl -a bcd_tb.vhdl
	ghdl -e bcd_tb
	ghdl -r bcd_tb --vcd=result.vcd --stop-time=5us

clean:
	rm -rf result.vcd
