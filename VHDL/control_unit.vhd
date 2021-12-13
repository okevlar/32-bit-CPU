-- ALU
-- Orion Kevlar, 40099465
-- COEN316 lab5, 23/10/2021

library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
port( -- opcode & func inputs
	op, func_i: in std_logic_vector(5 downto 0);	 
	-- single bit control signal outputs
	reg_write, reg_dst, reg_in_src, 
	alu_src, add_sub, data_write   : out std_logic;  
	-- Two bit control signal outputs
	logic_func, func_o, branch_type, pc_sel	: out std_logic_vector(1 downto 0));
end control_unit;

architecture structural of control_unit is
begin
	control : PROCESS(op, func_i) IS
	BEGIN
	  if op = "000000" then
	  	-- output selected from func 
	  	case func_i is  
	  		-- add
	  		when "100000" => 
				reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0';  
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "10";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- sub
	  		when "100010" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "10";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00"; 
	  	    -- slt
	  		when "101010" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "01";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- and
	  		when "100100" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- or
	  		when "100101" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "01";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";  
	  		-- xor
	  		when "100110" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "10";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00"; 
	  		-- nor
	  		when "100111" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "11";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- jr
	  		when "001000" => 
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "10";	   	 
	  		-- op = 000000, func not listed = invalid instruction
	  		when others => 
	  		-- these are not valid instructions, set everything to 0
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";	
	  	end case;
	 
	   -- other opcodes
	  else 
	  	case op is
	  		-- lui
	  		when "001111" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- addi
	  		when "001000" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "10";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00"; 
	  		-- slti
	  		when "001010" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '1'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "01";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00"; 
	  		-- andi
	  		when "001100" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";   
	  		-- ori
	  		when "001101" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "01";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- xori
	  		when "001110" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0';  
	  			reg_in_src 		<= '1'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '1'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "10";
	  		   	func_o  		<= "11";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- lw
	  		when "100011" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "10";
	  		   	func_o  		<= "10";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- sw
	  		when "101011" => 
	  			reg_write 		<= '1'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '1'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '1'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";
	  		-- j
	  		when "000010" => 
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "01";
	  		-- bltz
	  		when "000001" => 
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "11";
	  		   	pc_sel  		<= "00";
	  		-- beq
	  		when "000100" => 
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "01";
	  		   	pc_sel  		<= "00";  
	  		-- bne
	  		when "000101" => 
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "10";
	  		   	pc_sel  		<= "00";
	  		   		  		
	  		-- make sure this will not overwrite op = 000000
	  		when others => 
	  		-- these are not valid instructions, set everything to 0
	  			reg_write 		<= '0'; 
	  			reg_dst 		<= '0'; 
	  			reg_in_src 		<= '0'; 
	  			alu_src 		<= '0'; 
	  		   	add_sub 		<= '0'; 
	  		   	data_write  		<= '0'; 
	  		   	logic_func  		<= "00";
	  		   	func_o  		<= "00";
	  		   	branch_type  		<= "00";
	  		   	pc_sel  		<= "00";	
		end case;
	  end if;  
	END PROCESS control;		
end structural;
