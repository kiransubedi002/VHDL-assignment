library ieee;
use ieee.std_logic_1164.all;

entity tff is
	port(
		T, CLK, CLR: in std_logic;
		Q: out std_logic
	);
end tff;

architecture behaviour of tff is
	signal state: std_logic;
begin
	process(CLK, CLR)
	begin
		if CLR='1' then
			state <= '0';
		elsif rising_edge(CLK) then
			if T = '1' then
				state <= not state;
			else
				state <= state;
			end if;
		end if;
	end process;

	Q <= state;
end behaviour;

library ieee;
use ieee.std_logic_1164.all;

entity AND_G is
    Port ( A, B : in STD_LOGIC;
           Z : out STD_LOGIC);
end AND_G;

architecture AND_G of AND_G is
BEGIN
	Z <= A and B;

end AND_G;



-- Upcounter 3bit
library ieee;
use ieee.std_logic_1164.all;

entity Upcounter3bit is
	port(
		CLK, CLR: in std_logic;
		Q: out std_logic_vector (2 downto 0)
	);
end Upcounter3bit;

architecture structure of Upcounter3bit is
	
	component AND_G
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;


	component TFF
		port(
			T, CLK, CLR: in std_logic;
			Q: out std_logic
		);
	end component;
	
	signal QA, QB, QC, TC: std_logic;

begin
	T1: TFF port map(T=>'1', CLK=> CLK, CLR=>CLR, Q=>QA);
	T2: TFF port map(T=>QA, CLK=>CLK, CLR=>CLR, Q=>QB);
	T3: TFF port map(T=>TC, CLK=> CLK, CLR=>CLR, Q=>Q(2));
	A1: AND_G port map(A=> QA, B=>QB, Z=>TC);
	Q(0)<= '1' when QA = '1' else '0';
	Q(1)<= '1' when QB = '1' else '0';

end structure;
