-- D-Cache
-- Orion Kevlar, 40099465
-- COEN316 lab4, 09/10/2021

-- 32 x 32 Data chache 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity D_cache is 
port(	d_in		: in std_logic_vector(31 downto 0);	-- this is connected to out_b (rt) of regfile 
	reset  		: in std_logic;				-- asynchronous reset 
	clk    		: in std_logic; 
	data_write  	: in std_logic;   			-- synchronous write enable
	read_d		: in std_logic_vector(4 downto 0);	-- lower 5-bits of alu output acting as address index for d-cache
	out_d 		: out std_logic_vector(31 downto 0)); 
end D_cache; 

architecture behavioural of D_cache is
	-- signals to represent the 32x32 bit D_cache
	signal 	R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,
		R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,
		R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31 : std_logic_vector(31 downto 0);
		   
begin 
-------------------------------------------------------------------------------------- 
read: process(data_write,read_d,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,
		R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,
		R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31)
		begin
		if data_write = '0' then
		case read_d is 
			when "00000" => out_d <= R0;
			when "00001" => out_d <= R1;
			when "00010" => out_d <= R2;
			when "00011" => out_d <= R3;
			when "00100" => out_d <= R4;
			when "00101" => out_d <= R5;
			when "00110" => out_d <= R6;
			when "00111" => out_d <= R7;
			when "01000" => out_d <= R8;
			when "01001" => out_d <= R9;
			when "01010" => out_d <= R10;
			when "01011" => out_d <= R11;
			when "01100" => out_d <= R12;
			when "01101" => out_d <= R13;
			when "01110" => out_d <= R14;
			when "01111" => out_d <= R15;
			when "10000" => out_d <= R16;
			when "10001" => out_d <= R17;
			when "10010" => out_d <= R18;
			when "10011" => out_d <= R19;
			when "10100" => out_d <= R20;
			when "10101" => out_d <= R21;
			when "10110" => out_d <= R22;
			when "10111" => out_d <= R23;
			when "11000" => out_d <= R24;
			when "11001" => out_d <= R25;
			when "11010" => out_d <= R26;
			when "11011" => out_d <= R27;
			when "11100" => out_d <= R28;
			when "11101" => out_d <= R29;
			when "11110" => out_d <= R30;
			when "11111" => out_d <= R31;
			when others => out_d <= (others => '0');  
		end case;
		end if;
	end process;
    
--------------------------------------------------------------------------------------		
	--processes to reset or write to any specified register if reset or clk is high and data_write is enabled   
        reg0: process(clk,reset)
        begin
        if reset = '1' then
                R0 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00000" then R0 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg1: process(clk,reset)
        begin
        if reset = '1' then
                R1 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00001" then R1 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg2: process(clk,reset)
        begin
        if reset = '1' then
                R2 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00010" then R2 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg3: process(clk,reset)
        begin
        if reset = '1' then
                R3 <= (others => '0');
  		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00011" then R3 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg4: process(clk,reset)
        begin
        if reset = '1' then
                R4 <= (others => '0');
  		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00100" then R4 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg5: process(clk,reset)
        begin
        if reset = '1' then
                R5 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00101" then R5 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg6: process(clk,reset)
        begin
        if reset = '1' then
                R6 <= (others => '0');
  		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00110" then R6 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg7: process(clk,reset)
        begin
        if reset = '1' then
                R7 <= (others => '0');
   		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "00111" then R7 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg8: process(clk,reset)
        begin
        if reset = '1' then
                R8 <= (others => '0');
   		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01000" then R8 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg9: process(clk,reset)
        begin
        if reset = '1' then
                R9 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01001" then R9 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg10: process(clk,reset)
        begin
        if reset = '1' then
                R10 <= (others => '0');
   		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01010" then R10 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg11: process(clk,reset)
        begin
        if reset = '1' then
                R11 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01011" then R11 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg12: process(clk,reset)
        begin
        if reset = '1' then
                R12 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01100" then R12 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg13: process(clk,reset)
        begin
        if reset = '1' then
                R13 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01101" then R13 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg14: process(clk,reset)
        begin
        if reset = '1' then
                R14 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01110" then R14 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg15: process(clk,reset)
        begin
        if reset = '1' then
                R15 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "01111" then R15 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg16: process(clk,reset)
        begin
        if reset = '1' then
                R16 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10000" then R16 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg17: process(clk,reset)
        begin
        if reset = '1' then
                R17 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10001" then R17 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg18: process(clk,reset)
        begin
        if reset = '1' then
                R18 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10010" then R18 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg19: process(clk,reset)
        begin
        if reset = '1' then
                R19 <= (others => '0');
   		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10011" then R19 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg20: process(clk,reset)
        begin
        if reset = '1' then
                R20 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10100" then R20 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg21: process(clk,reset)
        begin
        if reset = '1' then
                R21 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10101" then R21 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg22: process(clk,reset)
        begin
        if reset = '1' then
                R22 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10110" then R22 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg23: process(clk,reset)
        begin
        if reset = '1' then
                R23 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "10111" then R23 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg24: process(clk,reset)
        begin
        if reset = '1' then
                R24 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11000" then R24 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg25: process(clk,reset)
        begin
        if reset = '1' then
                R25 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11001" then R25 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg26: process(clk,reset)
        begin
        if reset = '1' then
                R26 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11010" then R26 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg27: process(clk,reset)
        begin
        if reset = '1' then
                R27 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11011" then R27 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg28: process(clk,reset)
        begin
        if reset = '1' then
                R28 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11100" then R28 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg29: process(clk,reset)
        begin
        if reset = '1' then
                R29 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11101" then R29 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg30: process(clk,reset)
        begin
        if reset = '1' then
                R30 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11110" then R30 <= d_in;
                        end if;
                end if;
        end if;
        end process;

        reg31: process(clk,reset)
        begin
        if reset = '1' then
                R31 <= (others => '0');
		end if;
        if rising_edge(clk) then
                if data_write = '1' then
                        if read_d = "11111" then R31 <= d_in;
                        end if;
                end if;
        end if;
        end process;
--------------------------------------------------------------------------------------
end behavioural;
