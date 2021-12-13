-- Sign-Extend
-- Orion Kevlar, 40099465
-- COEN316 lab4, 09/11/2021

library ieee;
use ieee.std_logic_1164.all;

entity Sign_extend is
port(func			: in std_logic_vector(1 downto 0); -- comes from control unit
	immediate		: in std_logic_vector(15 downto 0); -- imediate data
	Sign_extend_out		: out std_logic_vector(31 downto 0)); -- input to PC_register
end Sign_extend;

architecture behavioural of Sign_extend is 
begin 	
--------------------------------------------------------------------------------------
-- Sign_extend    
	sign_extend : PROCESS(func, immediate) IS
	  -- Put declarations here.
	BEGIN
	  -- Put sequential statements here. 
	  if func = "00" then
	  	-- pad lower 16 eith 0s 
	  	Sign_extend_out(31 downto 16)	<= immediate(15 downto 0); 
	  	Sign_extend_out(15 downto 0)	<= (others => '0');
	  	
	  elsif func = "11" then
	  	-- pad upper 16 with 0s  
	  	Sign_extend_out(31 downto 16)	<= (others => '0');
	  	Sign_extend_out(15 downto 0)	<= immediate(15 downto 0); 
	  
	  else -- func = 01 or 10
	  	-- pad high order with MSB
	  	Sign_extend_out(31 downto 16)	<= (others => immediate(15)); 
	  	Sign_extend_out(15 downto 0)	<= immediate(15 downto 0); 
	  end if;  
	END PROCESS sign_extend;
--------------------------------------------------------------------------------------
end behavioural;           
