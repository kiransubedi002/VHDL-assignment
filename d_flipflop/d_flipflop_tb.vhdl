library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop_tb is 
end D_flipflop_tb;

architecture behaviour of D_flipflop_tb is 
	signal D, CLK, RST, Q, Qnot: std_logic;

	component D_flipflop
		port(
			D: in std_logic;
			CLK, RST: in std_logic;
			Q, Qnot: out std_logic
		);
	end component;
begin
	DUT: D_flipflop port map(D => D, CLK => CLK, RST => RST, Q => Q, Qnot => Qnot);

	process begin
		D <= '0';
		CLK <= '0';
		RST <= '0';

		wait for 10 ns;
		RST <= '1';
		
		wait for 10 ns;
		RST <= '0';
		wait for 10 ns;
		D <= '1';

		wait for 10 ns;
		CLK <= '1';

		wait for 10 ns;
		CLK <= '0';

		wait;
	end process;
end behaviour;
