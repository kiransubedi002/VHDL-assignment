library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop is
	port(
		D: in std_logic; 
		CLK, RST: in std_logic;
		Q, Qnot: out std_logic
	);
end D_flipflop;

architecture behaviour of D_flipflop is
begin
	process(CLK, RST)
	begin
		if RST = '1' then
			Q <= '0';
			Qnot <= '1';
		elsif rising_edge(CLK) then
			Q <= D;
			Qnot <= not D;
		end if;
	end process;
end behaviour;
