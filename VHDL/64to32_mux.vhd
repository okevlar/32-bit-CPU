-- 2 to 1 mux
-- Orion Kevlar, 40099465
-- COEN316 lab4, 09/11/2021
-- used for mux 2 and 3 in datapath

library ieee;
use ieee.std_logic_1164.all;
 
entity mux32 is
port(x,y : in STD_LOGIC_vector(31 downto 0);
s: in STD_LOGIC;
z: out STD_LOGIC_vector(31 downto 0));
end mux32 ;
 
architecture Behavioral of mux32 is
begin
	process (x,y,s) is
	begin
		if (s ='0') then
			z <= x;
		else
			z <= y;
		end if;
	end process;
end Behavioral;          
