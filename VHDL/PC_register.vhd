-- PC register
-- Orion Kevlar, 40099465
-- COEN316 lab3, 09/11/2021

library ieee;
use ieee.std_logic_1164.all;

entity PC_register is
port(next_PC	: in std_logic_vector(31 downto 0); -- input is output of next_addres_unit
	clk, reset	: in std_logic;
	PC_Icache	: out std_logic_vector(4 downto 0); -- input to Icaches
	PC_out		: out std_logic_vector(31 downto 0)); -- input for next_addres_unit
end PC_register;

architecture behavioural of PC_register is
 
begin 	
--==========================================================================================
-- PC
	pc_register: process(clk,reset,next_PC)
	begin
		if reset = '1' then
			pc_out <= (others => '0');
		elsif rising_edge(clk) then
			 PC_out 	<= next_PC;	
			 PC_Icache	<= next_PC(4 downto 0);
		end if;
	end process;
--==========================================================================================
end behavioural;
