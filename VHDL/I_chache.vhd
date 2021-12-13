-- Instruction Cache
-- Orion Kevlar, 40099465
-- COEN316 lab3, 09/11/2021

library ieee;
use ieee.std_logic_1164.all;

entity I_cache is
port(I_cache_in		: in std_logic_vector(4 downto 0); -- address input to Icache from PC_register
	I_cache_out	: out std_logic_vector(31 downto 0)); -- input to PC_register
end I_cache;

architecture behavioural of I_cache is 
begin 	
--==========================================================================================
-- I_cache
	I_cache: process(I_cache_in)
	begin
		case I_cache_in is
		-- hard coded programs go here
		--	when "address" => I_cache_out <= "instruction"
						--	| op | rs | rt | rd |  0  |func|	
			when "00000" => I_cache_out <= "00100000000000110000000000000000";
			when "00001" => I_cache_out <= "00100000000000010000000000000000"; 
			when "00010" => I_cache_out <= "00100000000000100000000000000101";
			when "00011" => I_cache_out <= "00000000001000100000100000100000";
			when "00100" => I_cache_out <= "00100000010000101111111111111111";
			when "00101" => I_cache_out <= "00010000010000110000000000000001";
			when "00110" => I_cache_out <= "00001000000000000000000000000011";
			when "00111" => I_cache_out <= "10101100000000010000000000000000";
			when "01000" => I_cache_out <= "10001100000001000000000000000000";
			when "01001" => I_cache_out <= "00110000100001000000000000001010";
			when "01010" => I_cache_out <= "00110100100001000000000000000001";
			when "01011" => I_cache_out <= "00111000100001000000000000001011";
			when "01100" => I_cache_out <= "00111000100001000000000000000000";
			when others => I_cache_out <= (others => '0');
		end case;
	end process;

--==========================================================================================
end behavioural;
              
