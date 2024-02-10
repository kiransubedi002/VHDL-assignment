library ieee;
use ieee.std_logic_1164.all;

entity fsmgcd is
	port(
		clk, reset: in std_logic;
		A, B: in integer;
		GCD: out integer
	);
end fsmgcd;

architecture behaviour of fsmgcd is
	type state is (start, input, output, check, updatex, updatey);
	signal current_state, next_state: state;

begin
	state_register: process (clk, reset)
	begin
		if reset = '1' then
			current_state <= start;
		elsif rising_edge(clk) then
			current_state <= next_state;
		end if;
	end process;

	compute: process(a, b, current_state)
		variable x, y: integer;
	begin
		case current_state is
			when start =>
				next_state <= input;
			when input =>
				x := a;
				y := b;
				next_state <= check;
			when check =>
				if x < y then
					next_state <= updatey;
				elsif y < x then
					next_state <= updatex;
				else
					next_state <= output;
				end if;
			when updatex =>
				x := x - y;
				next_state <= check;
			when updatey =>
				y := y - x;
				next_state <= check;
			when output =>
				gcd <= x;
				next_state <= start;
			when others =>
				next_state <= start;
		end case;
	end process compute;
end behaviour;
