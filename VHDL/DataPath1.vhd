-- data_path
-- Orion Kevlar, 40099465
-- Data path
-- COEN316 lab4, 26/10/2021
-- Create instances of the components:
-- And port map them together

library ieee;
use ieee.std_logic_1164.all;

entity DataPath1 is
port(   
--= Inputs ============================================================================================================
	clk, reset		: in std_logic;			
--= Outputs ============================================================================================================	
-- changed pc to pc_o     
	overflow, zero		: out std_logic;	
	rs, rt, pc_o		: out std_logic_vector(31 downto 0)	
	);
end DataPath1;

architecture behavioural of DataPath1 is

-- next_address_unit
	COMPONENT next_address_unit is
	port(rt, rs			: in std_logic_vector(31 downto 0); 	-- two register inputs
		pc			: in std_logic_vector(31 downto 0);
		target_address 		: in std_logic_vector(25 downto 0);
		branch_type		: in std_logic_vector(1 downto 0);
		pc_sel			: in std_logic_vector(1 downto 0);
		next_pc			: out std_logic_vector(31 downto 0)); 
	END COMPONENT next_address_unit;     

-- I_cache	
	COMPONENT I_cache is
	port(I_cache_in			: in std_logic_vector(4 downto 0); 	-- address input to Icache from PC_register
		I_cache_out		: out std_logic_vector(31 downto 0)); 	-- input to PC_register
	END COMPONENT I_cache;  

-- PC_register	
	COMPONENT PC_register is
	port(next_PC			: in std_logic_vector(31 downto 0); 	-- input is output of next_addres_unit
		clk, reset		: in std_logic;
		PC_Icache		: out std_logic_vector(4 downto 0); 	-- input to Icache
		PC_out			: out std_logic_vector(31 downto 0)); 	-- input for next_addres_unit
	END COMPONENT PC_register;   

-- ALU 
	COMPONENT alu
	port(x, y	   	: in std_logic_vector(31 downto 0);
		add_sub	   	: in std_logic;
		logic_func 	: in std_logic_vector(1 downto 0);
   		func 	   	: in std_logic_vector(1 downto 0);
		output	   	: out std_logic_vector(31 downto 0);
		overflow   	: out std_logic;
		zero	   	: out std_logic);  
	END COMPONENT alu;	

-- sign_extend
	COMPONENT sign_extend is 
	port(func		: in std_logic_vector(1 downto 0); 	-- comes from control unit
		immediate	: in std_logic_vector(15 downto 0); 	-- imediate data
		Sign_extend_out	: out std_logic_vector(31 downto 0)); 	-- input to PC_register
	END COMPONENT sign_extend;	

-- Regfile 
	COMPONENT regfile is 
	port(din			: in std_logic_vector(31 downto 0); 
	  	reset   		: in std_logic; 
	  	clk    			: in std_logic; 
	  	write   		: in std_logic;
	  	read_a  		: in std_logic_vector(4 downto 0); 
	  	read_b 			: in std_logic_vector(4 downto 0); 
	  	write_address 		: in std_logic_vector(4 downto 0); 
	  	out_a 			: out std_logic_vector(31 downto 0); 
	  	out_b 			: out std_logic_vector(31 downto 0));
	END COMPONENT regfile;

-- D_Cache 
	COMPONENT D_cache is
	port(d_in   		: in std_logic_vector(31 downto 0);	-- this is connected to out_b (rt) of regfile 
		reset  		: in std_logic;				-- asynchronous reset 
		clk    		: in std_logic; 
		data_write  	: in std_logic;   			-- synchronous write enable
		read_d 		: in std_logic_vector(4 downto 0);	-- lower 5-bits of alu output acting as address index for d-cache
		out_d 		: out std_logic_vector(31 downto 0));
	END COMPONENT;

-- Mux	1
	COMPONENT mux5 is 
	PORT( x,y 	: in STD_LOGIC_vector(4 downto 0);
		s	: in STD_LOGIC;
		z	: out STD_LOGIC_vector(4 downto 0));
	END COMPONENT;	

-- Mux	2/3
	COMPONENT mux32 is 
	PORT( x,y 	: in STD_LOGIC_vector(31 downto 0);
		s	: in STD_LOGIC;
		z	: out STD_LOGIC_vector(31 downto 0));
	END COMPONENT;   

-- Control_unit ...	PENDING TESTS
	COMPONENT control_unit is
	port(op, func_i	: in std_logic_vector(5 downto 0);	 
		reg_write, reg_dst, reg_in_src, 
		alu_src, add_sub, data_write   		: out std_logic;  
		logic_func, func_o, branch_type, pc_sel	: out std_logic_vector(1 downto 0));
	END COMPONENT; 

--= Intermediate Signals ===================================================================================
-- control signals
signal pc_sel_i, branch_type_i,
	logic_func_i, func_o	: std_logic_vector(1 downto 0);
signal reg_dst_i, alu_src_i, reg_in_src_i,
	d_write_i, r_write_i, add_sub_i		:  std_logic;

-- pc
signal pc_o_5			: std_logic_vector(4 downto 0);
signal pc_o_32			: std_logic_vector(31 downto 0);

-- next address
signal next_pc_o_32		: std_logic_vector(31 downto 0);

-- I cache
signal I_cache_o_32		: std_logic_vector(31 downto 0);
signal rs_5, rt_5, rd_5		: std_logic_vector(4 downto 0);		-- split off of I_cache_o_32
signal ta			: std_logic_vector(25 downto 0);	-- split off of I_cache_o_32
signal op, fn			: std_logic_vector(5 downto 0);
	
-- Regfile
signal rs_32, rt_32		: std_logic_vector(31 downto 0);

-- Sign Extend
signal immediate_i		: std_logic_vector(15 downto 0);
signal se_out			: std_logic_vector(31 downto 0);

-- Alu
signal alu_o_32			: std_logic_vector(31 downto 0);
signal alu_o_5			: std_logic_vector(4 downto 0);
signal overflow_out, zero_out	: std_logic;

-- D Cache
signal data_o			: std_logic_vector(31 downto 0);

-- mux outputs
signal mux1_o			: std_logic_vector(4 downto 0);	-- write address input of regfile
signal mux2_o, mux3_o		: std_logic_vector(31 downto 0); -- Y of alu and d_in of regfile

--==========================================================================================================

begin 
-- Connections
	op <= I_cache_o_32(31 downto 26); 	-- control units input
	rs_5 <= I_cache_o_32(25 downto 21);	-- this is fed to read_a of regfile
	rt_5 <= I_cache_o_32(20 downto 16);	-- this is fed to read_b of regfile
	rd_5 <= I_cache_o_32(15 downto 11);	
	fn <= I_cache_o_32(5 downto 0);  	-- control units input
	ta <= I_cache_o_32(25 downto 0);	-- jump target from instruction

	alu_o_5 <= alu_o_32(4 downto 0);	-- low order 5 bits of alu output is address input of d-cache
	immediate_i <=  I_cache_o_32(15 downto 0);	

	-- CPU outputs (from regfie)
	rs <=	rs_32;
	rt <=	rt_32;
	pc_o <= pc_o_32;
	overflow <= overflow_out;
	zero <= zero_out;

--= Port Maps ==========================================================================================     
-- An instance of next_address_unit
	i_next_address_unit: next_address_unit 
	port map(
		rt   			=> rt_32,
		rs			=> rs_32,
		pc			=> pc_o_32,
		target_address		=> ta,
		branch_type		=> branch_type_i,	
		pc_sel			=> pc_sel_i,	
		next_pc			=> next_pc_o_32  -- goes from PC to Next_address
		);	

-- An instance of I_cache_out 
	i_I_cache: I_cache
	port map(   
		I_cache_in => pc_o_5, 
		I_cache_out => I_cache_o_32
		);

-- An instance of PC_register
	i_PC_register: PC_register
	port map(
		next_PC 	=> next_pc_o_32,
	 	clk		=> clk,  
  		reset		=> reset,
		PC_Icache	=> pc_o_5,
		PC_out 		=> pc_o_32
		);	

-- An instance of ALU
	i_ALU: alu
	port map( 
		x		=> rs_32,
		y		=> mux2_o,
		add_sub	   	=> add_sub_i,
		logic_func 	=> logic_func_i,
		func		=> func_o,
		output		=> alu_o_32,
		overflow 	=> overflow_out,
		zero 		=> zero_out
		);		

-- An instance of Sign_Extend 
	i_sign_extend: sign_extend
	port map(  
		func 		=> func_o,
		immediate 	=> immediate_i, 
		Sign_extend_out => se_out
		);

-- An instance of Regfile
	i_regfile: regfile
	port map(
		din		=> mux3_o,
	  	reset		=> reset,
	  	clk  		=> clk,
	  	write 		=> r_write_i,
	  	read_a		=> rs_5,
	  	read_b		=> rt_5,
	  	write_address 	=> mux1_o,
	  	out_a		=> rs_32,	
	  	out_b 		=> rt_32
		);

-- An instance of D_cache
    i_D_cache: D_cache   
    port map(
	 	d_in		=> rt_32,
	  	reset		=> reset,
		clk		=> clk,
		data_write	=> d_write_i,
		read_d		=> alu_o_5,
		out_d		=> data_o
    		);   

-- Instance of mux1
	i_mux1: mux5                            
	port map( x => rt_5,  y => rd_5, s => reg_dst_i, z => mux1_o);	  

-- Instance of mux2
	i_mux2: mux32      
	port map(x => rt_32, y => se_out, s => alu_src_i, z => mux2_o);

-- Instance of mux3
	i_mux3: mux32
	port map(x => data_o, y => alu_o_32, s => reg_in_src_i, z => mux3_o);  
	
-- Instance of Control Unit 
   i_control_unit: control_unit
   port map(  
   		op		=> op, 
   		func_i		=> fn,
   		reg_write	=> r_write_i,
   		reg_dst   	=> reg_dst_i,
		reg_in_src 	=> reg_in_src_i,
		alu_src		=> alu_src_i,
		add_sub 	=> add_sub_i,
		data_write	=> d_write_i,
		logic_func 	=> logic_func_i,
		func_o      	=> func_o,
		branch_type	=> branch_type_i,
		pc_sel		=> pc_sel_i
   		);	
--=====================================================================================================		
end behavioural;
