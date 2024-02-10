library ieee;
use ieee.std_logic_1164.all;

entity seq_det_tb is
end seq_det_tb;

architecture behaviour of seq_det_tb is
	signal clk, reset, seq, det: std_logic := '0';
	constant clk_period: time := 50 ns;

begin
	uut: entity work.seq_det port map(
		clk => clk,
		reset => reset,
		seq => seq,
		det => det
	);

	clk_proc:
	process
	begin
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period;
	end process;

	stim_proc:
	process
	begin
		seq <= '1';           	--1
      		wait for clk_period;
        	
		seq <= '1';             --11
      		wait for clk_period;
        	
		seq <= '0';             --110
      		wait for clk_period;
        	
		seq <= '1';             --1101
      		wait for clk_period;
        	
		seq <= '1';             --11011
     		wait for clk_period;
      	  	
		seq <= '1';             --110111
      		wait for clk_period;
        	
		seq <= '0';             --1101110
      		wait for clk_period;
        	
		seq <= '1';             --11011101
      		wait for clk_period;
        	
		seq <= '0';             --110111010
      		wait for clk_period;
        	
		seq <= '1';             --1101110101
      		wait for clk_period;
      		wait;
	end process;
end behaviour;
