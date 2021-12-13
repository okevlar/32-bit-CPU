 -- Next_address_unit
-- Orion Kevlar, 40099465
-- COEN316 lab3, 26/10/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity next_address_unit is
port(rt, rs		: in std_logic_vector(31 downto 0); -- two register inputs
	pc		: in std_logic_vector(31 downto 0);
	target_address 	: in std_logic_vector(25 downto 0);
	branch_type	: in std_logic_vector(1 downto 0);
	pc_sel		: in std_logic_vector(1 downto 0);
	next_pc		: out std_logic_vector(31 downto 0)); 
end next_address_unit;

architecture behavioural of next_address_unit is
signal	jump_target	: std_logic_vector(31 downto 0) := (others => '0'); -- this is target_address extended to 32 bits 
signal	branch_offset	: std_logic_vector(31 downto 0) := (others => '0'); -- this offset extended to 32 bits 
 
begin 	
		jump_target(25 downto 0)    <= target_address(25 downto 0);
		branch_offset(31 downto 16) <= (others => target_address(15));
		branch_offset(15 downto 0)  <= target_address(15 downto 0);
--------------------------------------------------------------------------------------
-- PC_sel
	pc_select: process(pc_sel,jump_target,rs,rt,branch_type,branch_offset) 
	variable pc_offset : signed(31 downto 0);
	variable rs_signed : signed(31 downto 0);
	begin	
	rs_signed := signed(rs);
	if pc_sel = "01" then		-- jump
		next_pc <= jump_target;
	elsif pc_sel = "10" then	-- jump register
		next_pc <= rs;
	--elsif pc_sel = "11" then		-- not used		
	else 	-- pc_sel = 00
	-- branch_type
		if branch_type = "01" then	-- branch on equal	-- might go signed cast?
			if rt = rs then
				pc_offset := signed(pc+1+branch_offset);
				next_pc <= std_logic_vector(pc_offset);
			else 
				next_pc <= pc+1;
			end if;
		elsif branch_type = "10" then	-- branch on not equal
			if rt /= rs then
				pc_offset := signed(pc+1+branch_offset);
				next_pc <= std_logic_vector(pc_offset);
			else 
				next_pc <= pc+1;
			end if;
		elsif branch_type = "11" then	-- branch on less than
			if rs_signed < 0 then
				pc_offset := signed(pc+1+branch_offset);
				next_pc <= std_logic_vector(pc_offset);
			else 
				next_pc <= pc+1;
			end if;
		else 	-- default case is No jump (when branch_type = 00)
			next_pc <= pc+1;
		end if;
	end if;
	end process;
--------------------------------------------------------------------------------------
end behavioural;
              
