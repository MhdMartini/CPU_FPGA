library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.ALL;



Entity CpuEntity is
	port (
			SW: 	in std_logic_vector	(17 downto 0);	-- S A B W' MUX JIMPZ JIFN JIFP JIFZ
			
			HEX0: out std_logic_vector	(6 downto 0);	-- ACC
			HEX2: out std_logic_vector	(6 downto 0);	-- PC
			
			KEY: in std_logic_vector	(0 downto 0)	-- KEY(0) as CLOCK
	);

	end CpuEntity;

	

	
Architecture CpuEntity_beh of CpuEntity is

	component InstReg
		port(
				input:   in std_logic_vector    (5 downto 0);  
				output: out std_logic_vector   (5 downto 0);
				
				CLOCK:	in std_logic
		);
	end  component;
	
	
	component Controller
		port(
				ACC: 	in std_logic_vector	(3 downto 0);  -- ACC value
				
				JMPZ: in std_logic;	-- JUMP to Zero
				JIFN: in std_logic;	-- JUMP to Zero if ACC = 1111
				JIFP: in std_logic;	-- JUMP to Zero if ACC = 0001
				JIFZ: in std_logic;	-- JUMP to Zero if ACC = 0000
				
				CLEAR: out std_logic
		);
	end  component;

	
	component ClockEntity
		port(
				BTN:   	in std_logic;  
				CLK: 		out std_logic;
				CLK_INV:	out std_logic
		);
	end  component;
	
	
	component ALU
		port(
				A:	in std_logic_vector    (3 downto 0);	-- A operand
				B:	in std_logic_vector    (3 downto 0);	-- B operand
				S:	in std_logic_vector    (3 downto 0);	-- OpCode
				Q:	out std_logic_vector    (3 downto 0)	-- answer
		);
	end  component;
	
	
	component MUX
		port(
				A: 	in		std_logic_vector	(3 downto 0);	-- Input A
				B: 	in		std_logic_vector	(3 downto 0);	-- Input B
				
				Y: 	out 	std_logic_vector	(3 downto 0);  -- Output
				SEL:	in		std_logic	-- SELECT A or B
					
		);
	end  component;


	component ACC
		port(
				input:	in std_logic_vector    (3 downto 0);
				output:	out std_logic_vector   (3 downto 0);

				CLOCK: 	in std_logic
		);
	end  component;
	
	
	component Display
		port(
			  int:		in	std_logic_vector	(3 downto 0);	--|=> Lowest three switches as input
			  decoded:	out std_logic_vector (6 downto 0)	--|	7-bit decoded output
		);
	end  component;
	
	
	component PC
		port(
				CLOCK	: in std_logic;
				output: out std_logic_vector(3 downto 0);
				RST	: in std_logic
		);
	end  component;	
	
	
	component RAM is
		port(
				Din:	in		std_logic_vector (3 downto 0);	-- Data in
				Dout:	out	std_logic_vector (3 downto 0);	-- Data out

				add: 	in 	std_logic_vector (3 downto 0);
				WE:   in   	std_logic					-- Read (1) Write (0)

--				CLOCK: in   std_logic
		);
	end component;
	
	
	signal acc_output, ram_dout, mux_y, alu_q, pc_out: std_logic_vector (3 downto 0);
	signal mux_b, cpu_clock, cpu_clock_inv, pc_rst: std_logic;
	signal instreg_output: std_logic_vector (5 downto 0);


	BEGIN
		p0: ClockEntity 	port map(KEY(0), cpu_clock, cpu_clock_inv);
--		p1: RAM 				port map(acc_output, ram_dout, SW(11 downto 8), instreg_output(4), cpu_clock);
		p1: RAM 				port map(acc_output, ram_dout, SW(11 downto 8), instreg_output(4));
		P2: PC 				port map(cpu_clock, pc_out, pc_rst);
		P3: Controller 	port map(acc_output, SW(14), SW(15), SW(16), SW(17), pc_rst);
		p4: MUX 				port map(SW(7 downto 4), ram_dout, mux_y, SW(13));
		
		p5: InstReg			port map(SW(13) & SW(12)& SW(3 downto 0), instreg_output, cpu_clock);
		p6: ALU				port map(acc_output, mux_y, instreg_output(3 downto 0), alu_q);
		p7: ACC				port map(alu_q, acc_output, cpu_clock_inv);
		
		p8: Display			port map(acc_output, HEX0);
		p9: Display			port map(pc_out, HEX2);
	
	END CpuEntity_beh;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	