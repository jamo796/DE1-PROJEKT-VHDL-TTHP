LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
ENTITY tb_mct IS
	-- Entity of testbench is always empty
END ENTITY tb_mct;
------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
ARCHITECTURE testbench OF tb_mct IS
	-- Local constants
	CONSTANT c_CLK_100MHZ_PERIOD : TIME := 10 ns;
	-- Local signals
	SIGNAL s_clk_100MHz : std_logic;
	SIGNAL s_reset      : std_logic;
	SIGNAL s_data       : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_dpout      : std_logic;
	SIGNAL s_seg        : std_logic_vector(6 DOWNTO 0);
	SIGNAL s_dig        : std_logic_vector(7 DOWNTO 0);
	SIGNAL s_start      : std_logic;
	SIGNAL s_rled       : std_logic_vector(2 DOWNTO 0);
	SIGNAL s_lled       : std_logic_vector(2 DOWNTO 0);

BEGIN
	uut_dri : ENTITY work.mct
		PORT MAP
		(

			CLK100MHZ => s_clk_100MHz,
			BTNC      => s_reset,




			SW        => s_data,

			CA        => s_seg(6),
			CB        => s_seg(5),
			CC        => s_seg(4),
			CD        => s_seg(3),
			CE        => s_seg(2),
			CF        => s_seg(1),
			CG        => s_seg(0),

			DP        => s_dpout,

			AN        => s_dig,



			BTNR      => s_start, --start button
			LED16_R   => s_rled(2), --RGB LEDs
			LED16_G   => s_rled(1),
			LED16_B   => s_rled(0),

			LED17_R   => s_lled(2),
			LED17_G   => s_lled(1),
			LED17_B   => s_lled(0)



		);
			--------------------------------------------------------
			-- Clock generation process
			--------------------------------------------------------
			p_clk_gen : PROCESS
			BEGIN
				WHILE now < 10000 ns LOOP -- 10 usec of simulation
				s_clk_100MHz <= '0';
				WAIT FOR c_CLK_100MHZ_PERIOD / 2;
				s_clk_100MHz <= '1';
				WAIT FOR c_CLK_100MHZ_PERIOD / 2;
			END LOOP;
			WAIT;
			END PROCESS p_clk_gen;


			--------------------------------------------------------
			-- Reset generation process
			--------------------------------------------------------
			p_reset_gen : PROCESS
			BEGIN
				s_reset <= '1';
				WAIT FOR 70 ns;
				s_reset <= '0';
				WAIT;
			END PROCESS p_reset_gen;
			--------------------------------------------------------
			-- Start transmitting
			--------------------------------------------------------
			p_start : PROCESS
			BEGIN
				s_start <= '0';
				WAIT FOR 100 ns;
				s_start <= '1';
				WAIT FOR 20 ns;
				s_start <= '0';
				WAIT FOR 300 ns;
				s_start <= '1';
				WAIT FOR 20 ns;
				s_start <= '0';
				WAIT;
			END PROCESS p_start;
			--------------------------------------------------------
			-- Data generation process
			--------------------------------------------------------
			p_stimulus : PROCESS
			BEGIN
				s_data <= "000000";--a
				WAIT FOR 360 ns;

				s_data <= "000001";--b
				WAIT;
			END PROCESS p_stimulus;
END ARCHITECTURE testbench;