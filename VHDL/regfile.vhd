-- ALU
-- Orion Kevlar, 40099465
-- COEN316 lab1, 28/09/2021

-- 32 x 32 register file 
-- two read ports, one write port with write enable 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regfile is 
port( 	  din    : in std_logic_vector(31 downto 0); 
	  reset  : in std_logic; 
	  clk    : in std_logic; 
	  write  : in std_logic;
	  read_a : in std_logic_vector(4 downto 0); 
	  read_b : in std_logic_vector(4 downto 0); 
	  write_address : in std_logic_vector(4 downto 0); 
	  out_a : out std_logic_vector(31 downto 0); 
	  out_b : out std_logic_vector(31 downto 0));
end regfile ; 

architecture behavioural of regfile is
	-- signals to represent the 32x32 bit regfile
	signal 	R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,
		R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,
		R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31 : std_logic_vector(31 downto 0);
		   
begin 
--------------------------------------------------------------------------------------
	-- read_a using mux with select for register
    with read_a select out_a <=
	R0 when "00000",
	R1 when "00001",
	R2 when "00010",
	R3 when "00011",
	R4 when "00100",
	R5 when "00101",
	R6 when "00110",
	R7 when "00111",
	R8 when "01000",
	R9 when "01001",
	R10 when "01010",
	R11 when "01011",
	R12 when "01100",
	R13 when "01101",
	R14 when "01110",
	R15 when "01111",
	R16 when "10000",
	R17 when "10001",
	R18 when "10010",
	R19 when "10011",
	R20 when "10100",
	R21 when "10101",
	R22 when "10110",
	R23 when "10111",
	R24 when "11000",
	R25 when "11001",
	R26 when "11010",
	R27 when "11011",
 	R28 when "11100",
	R29 when "11101",
	R30 when "11110",
	R31 when "11111",
	(others => '0') when others;  
    
    -- read_b using mux with select for register
    with read_b select out_b <=
	R0 when "00000",
	R1 when "00001",
	R2 when "00010",
	R3 when "00011",
	R4 when "00100",
	R5 when "00101",
	R6 when "00110",
	R7 when "00111",
	R8 when "01000",
	R9 when "01001",
	R10 when "01010",
	R11 when "01011",
	R12 when "01100",
	R13 when "01101",
	R14 when "01110",
	R15 when "01111",
	R16 when "10000",
	R17 when "10001",
	R18 when "10010",
	R19 when "10011",
	R20 when "10100",
	R21 when "10101",
	R22 when "10110",
	R23 when "10111",
	R24 when "11000",
	R25 when "11001",
	R26 when "11010",
	R27 when "11011",
 	R28 when "11100",
	R29 when "11101",
	R30 when "11110",
	R31 when "11111",
	(others => '0') when others;      

--------------------------------------------------------------------------------------		
	--processes to reset or write to any specified register if reset or clk is high and write is enabled   
        reg0: process(clk,reset)
        begin
        if reset = '1' then
                R0 <= (others => '0');
	end if;
        if rising_edge(clk) then
                if write = '1' then
                        if write_address = "00000" then R0 <= din;
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
                if write = '1' then
                        if write_address = "00001" then R1 <= din;
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
                if write = '1' then
                        if write_address = "00010" then R2 <= din;
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
                if write = '1' then
                        if write_address = "00011" then R3 <= din;
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
                if write = '1' then
                        if write_address = "00100" then R4 <= din;
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
                if write = '1' then
                        if write_address = "00101" then R5 <= din;
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
                if write = '1' then
                        if write_address = "00110" then R6 <= din;
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
                if write = '1' then
                        if write_address = "00111" then R7 <= din;
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
                if write = '1' then
                        if write_address = "01000" then R8 <= din;
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
                if write = '1' then
                        if write_address = "01001" then R9 <= din;
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
                if write = '1' then
                        if write_address = "01010" then R10 <= din;
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
                if write = '1' then
                        if write_address = "01011" then R11 <= din;
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
                if write = '1' then
                        if write_address = "01100" then R12 <= din;
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
                if write = '1' then
                        if write_address = "01101" then R13 <= din;
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
                if write = '1' then
                        if write_address = "01110" then R14 <= din;
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
                if write = '1' then
                        if write_address = "01111" then R15 <= din;
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
                if write = '1' then
                        if write_address = "10000" then R16 <= din;
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
                if write = '1' then
                        if write_address = "10001" then R17 <= din;
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
                if write = '1' then
                        if write_address = "10010" then R18 <= din;
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
                if write = '1' then
                        if write_address = "10011" then R19 <= din;
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
                if write = '1' then
                        if write_address = "10100" then R20 <= din;
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
                if write = '1' then
                        if write_address = "10101" then R21 <= din;
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
                if write = '1' then
                        if write_address = "10110" then R22 <= din;
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
                if write = '1' then
                        if write_address = "10111" then R23 <= din;
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
                if write = '1' then
                        if write_address = "11000" then R24 <= din;
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
                if write = '1' then
                        if write_address = "11001" then R25 <= din;
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
                if write = '1' then
                        if write_address = "11010" then R26 <= din;
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
                if write = '1' then
                        if write_address = "11011" then R27 <= din;
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
                if write = '1' then
                        if write_address = "11100" then R28 <= din;
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
                if write = '1' then
                        if write_address = "11101" then R29 <= din;
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
                if write = '1' then
                        if write_address = "11110" then R30 <= din;
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
                if write = '1' then
                        if write_address = "11111" then R31 <= din;
                        end if;
                end if;
        end if;
        end process;
--------------------------------------------------------------------------------------
end behavioural;
              
