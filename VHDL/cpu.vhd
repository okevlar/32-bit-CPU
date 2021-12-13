-- cpu
-- Orion Kevlar, 40099465
-- CPU
-- COEN316 30/10/2021
-- Create instances of the components:
-- And port map them together

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity  cpu  is
port(reset 		: in std_logic;
     clk   		: in std_logic;
     rs_out, rt_out 	: out std_logic_vector(3 downto 0); -- output ports from reg file
     pc_out 		: out std_logic_vector(3 downto 0);
     overflow, zero 	: out std_logic); 
end cpu;

architecture behavioural of cpu is
	-- data_path
	COMPONENT datapath1 is
	port(   
	--= Inputs ============================================================================================================
	clk, reset	: in std_logic;			
	--= Outputs ============================================================================================================
		-- changed pc to pc_o
	overflow, zero	: out std_logic;	
	rs, rt, pc_o		: out std_logic_vector(31 downto 0)
		); 
	END COMPONENT datapath1;      

	--= Intermediate Signals ===================================================================================
	-- MAKE A SIGNAL TO REPRESENT EACH INTERMEDIATE OUTPUT (DO NOT NAME IT SAME AS ABOVE)
	signal rs_o, rt_o, pc_s : std_logic_vector(31 downto 0);
	-- changed pc_o to pc_s 
	--==========================================================================================================
begin 
	-- Board wrapper 
	rs_out <= rs_o(3 downto 0);
	rs_o(31 downto 4) <= (others => '0');
	
	rt_out <= rt_o(3 downto 0);
	rt_o(31 downto 4) <= (others => '0');
	
	pc_out <= pc_s(3 downto 0);
	pc_s(31 downto 4) <= (others => '0');
	
	-- An instance of next_address_unit
	i_datapath1: datapath1 
	port map(
			clk 		=> clk,
			reset 		=> reset,
			overflow 	=> overflow,
			zero 		=> zero,
			rs 		=> rs_o,
			rt 		=> rt_o,
			pc_o 		=> pc_s
		);	

end behavioural;
