-- 2 to 1 mux
-- Orion Kevlar, 40099465
-- COEN316 lab4, 09/11/2021
-- used for mux 1 in datapath

library ieee;
use ieee.std_logic_1164.all;
 
entity mux5 is
port(x,y : in STD_LOGIC_vector(4 downto 0);
s: in STD_LOGIC;
z: out STD_LOGIC_vector(4 downto 0));
end mux5 ;
 
architecture Behavioral of mux5 is
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
