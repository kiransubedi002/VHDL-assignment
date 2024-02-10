library ieee;
use ieee.std_logic_1164.all;

entity seq_det is
	port(
		clk, reset, seq: in std_logic;
		det: out std_logic
	);
end seq_det;

architecture behaviour of seq_det is
	type state_type is (a, b, c, d); -- Defines the type for states in state machine
	signal state: state_type:= a;

begin
	process(clk)
	begin
		if reset = '1' then
			det <= '0';
			state <= a;
		elsif rising_edge(clk) then
			case state is
				when a =>
					det <= '0';
					if seq = '0' then 
						state <= a;
					else
						state <= b;
					end if;
				when c =>
					if seq ='0' then
						state <= a;
					else
						state <= d;
					end if;
				when d =>
					if seq = '0' then
						state <= c;
					else
						state <= a;
						det <= '1';
					end if;
				when others =>
					NULL;
			end case;
		end if;
	end process;
end behaviour;
