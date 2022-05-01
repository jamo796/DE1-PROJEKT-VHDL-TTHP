LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
ENTITY tb_transmitter IS
	-- Entity of testbench is always empty
END ENTITY tb_transmitter;
------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
ARCHITECTURE testbench OF tb_transmitter IS
	-- Local constants
	CONSTANT c_CLK_100MHZ_PERIOD : TIME := 10 ns;
	--Local signals
	SIGNAL s_clk_100MHz : std_logic;
	SIGNAL s_reset      : std_logic;
	--data input & start button
	SIGNAL s_data  : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_start : std_logic;
	--State of transmitter & tansmitter output
	SIGNAL s_state       : std_logic_vector(2 DOWNTO 0);
	SIGNAL s_transmitter : std_logic_vector(2 DOWNTO 0);

BEGIN
	-- Connecting testbench signals with transmitter entity
	-- (Unit Under Test)
	uut_trans : ENTITY work.transmitter
		PORT MAP
		(
			clk           => s_clk_100MHz,
			reset         => s_reset,

			data_i        => s_data,
			start_i       => s_start,

			state_o       => s_state,
			transmitter_o => s_transmitter
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
				s_reset <= '0';
				--wait for 200 ns;
				-- Reset activated
				--s_reset <= '1';
				--wait for 200 ns;
				-- Reset deactivated
				--s_reset <= '0';
				WAIT;
			END PROCESS p_reset_gen;
			--------------------------------------------------------
			-- start signal generation process
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