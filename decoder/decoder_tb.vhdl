library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end decoder_tb;

architecture behaviour of decoder_tb is
	signal a1, a0, e, q3, q2, q1, q0: std_logic;

begin
	UUT: entity work.decoder port map(
		a1 => a1,
		a0 => a0,
		e => e,
		q3 => q3,
		q2 => q2,
		q1 => q1,
		q0 => q0
	);

	sti_process: process
	begin
		a0 <= '0';
		a1 <= '0';
		e <= '1';
		wait for 10 ns;

		a0 <= '1';
                a1 <= '0';
                e <= '1';
                wait for 10 ns;


		a0 <= '0';
                a1 <= '1';
                e <= '1';
                wait for 10 ns;

                a0 <= '1';
                a1 <= '1';
                e <= '1';
                wait for 10 ns;
		wait;
	end process sti_process;

end behaviour;
