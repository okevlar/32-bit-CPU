-- ALU
-- Orion Kevlar, 40099465
-- COEN316 lab1, 28/09/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu is
port(x, y: in std_logic_vector(31 downto 0);
	add_sub	   : in std_logic;
	-- two input operands
	logic_func : in std_logic_vector(1 downto 0);
	-- 00 = AND, 01 = OR, 10 = XOR, 11 = NOR
	func 	   : in std_logic_vector(1 downto 0);
	-- 00 = lui, 01 = setless, 10 = arith, 11 = logic
	output	   : out std_logic_vector(31 downto 0);
	overflow   : out std_logic;
	zero	   : out std_logic);
end alu;

architecture structural of alu is
	signal mux_output	: std_logic_vector (31 downto 0) := (others => '0');
	signal MSB		: std_logic := '0';
	signal logic_result	: std_logic_vector(31 downto 0) := (others => '0');
	signal arith_result	: unsigned(31 downto 0) := (others => '0');

begin
	-- adder_subtract: arithmetic unit
	process(x, y, add_sub)
	-- we assume that X and Y are already 2s compliment
	begin
		if add_sub = '0' then		-- then x+y in 2s compliment
		arith_result <= unsigned(x) + unsigned(y);
		elsif add_sub = '1' then	-- then x-y in 2s compliment
		arith_result <= unsigned(x) - unsigned(y);
		end if;
	end process;

	-- logic unit	
	process(logic_func, x, y)	
	begin 
		if logic_func = "00" then
		logic_result <= x AND y;
		elsif logic_func = "01" then
		logic_result <= x OR y;
		elsif logic_func = "10"	then
		logic_result <= x XOR y; 
		elsif logic_func = "11"	then
		logic_result <= x NOR y;
		end if;
	end process;
	
	-- zero detection				-- not working
	process(arith_result)			
	variable zeros : unsigned(31 downto 0);
	begin
		zeros := (others => '0');
		if arith_result = zeros then	-- result is all 0
		zero <= '1';
		else 
		zero <= '0';		-- result is all 0s
		end if;
	end process;

	-- 4to1 mux
	process(y, arith_result, logic_result, func, mux_output)
	begin
		if func = "00" then	-- lui
		mux_output <= y;
		elsif func = "01" then	-- slt
		mux_output <= "0000000000000000000000000000000"&arith_result(31);
		elsif func = "10" then	-- add_sub
		mux_output <= std_logic_vector(arith_result);
		elsif func = "11" then	-- logic
		mux_output <= logic_result;
		end if;
		output <= mux_output; 	-- final result
	end process;

	-- overflow detection circuit
	process(x, y, add_sub, arith_result)
	begin
		if (arith_result(31) = '0' and x(31)='1' and y(31)='1') or (arith_result(31) = '1'and x(31)='0' and y(31)='0') then
		overflow <= '1';
		else 
		overflow <= '0';
		end if;
	end process;
end structural;
