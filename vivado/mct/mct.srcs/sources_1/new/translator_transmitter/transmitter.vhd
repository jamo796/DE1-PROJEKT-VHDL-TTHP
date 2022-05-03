LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
------------------------------------------------------------
-- Entity declaration for morse transmitter
------------------------------------------------------------
ENTITY transmitter IS
	PORT
	(
		--clock & reset
		clk   : IN std_logic;
		reset : IN std_logic;
		--data input & start button
		data_i  : IN std_logic_vector (5 DOWNTO 0);
		start_i : IN std_logic;
		--State & output
		state_o       : OUT std_logic_vector(2 DOWNTO 0);
		transmitter_o : OUT std_logic_vector(2 DOWNTO 0)
	);
END ENTITY transmitter;
------------------------------------------------------------
-- Architecture declaration for transmitter
------------------------------------------------------------
ARCHITECTURE Behavioral OF transmitter IS
	--Define the states
	TYPE t_state IS (INPUTTING, TRANSMITTING);
	TYPE led_state IS (START, CHAR0, CHAR1, CHAR2, CHAR3, CHAR4, CHAR5, PAUSE0, PAUSE1, PAUSE2, PAUSE3, PAUSE4, PAUSE5);

	--Define the signal that uses different states
	SIGNAL s_t_state   : t_state;
	SIGNAL s_led_state : led_state;
	--Internal clock enable
	SIGNAL s_en          : std_logic;
	SIGNAL s_data        : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data_length : std_logic_vector(5 DOWNTO 0);
	--Local delay counter
	SIGNAL s_cnt : unsigned(4 DOWNTO 0);
	--Specific values for local counter
	CONSTANT c_DELAY_1SEC : unsigned(4 DOWNTO 0) := b"0_0100";--(START,DOT,PAUSE)
	CONSTANT c_DELAY_2SEC : unsigned(4 DOWNTO 0) := b"0_1000";--(DASH)
	CONSTANT c_DELAY_3SEC : unsigned(4 DOWNTO 0) := b"0_1000";
	CONSTANT c_DELAY_4SEC : unsigned(4 DOWNTO 0) := b"1_0000";
	CONSTANT c_ZERO       : unsigned(4 DOWNTO 0) := b"0_0000";
	--Output values
	CONSTANT c_OFF    : std_logic_vector(2 DOWNTO 0) := b"000"; --off(START,PAUSE)
	CONSTANT c_RED    : std_logic_vector(2 DOWNTO 0) := b"100"; --RED(STATE)
	CONSTANT c_GREEN  : std_logic_vector(2 DOWNTO 0) := b"010"; --GREEN shines green(DOT,DASH)
	CONSTANT c_BLUE   : std_logic_vector(2 DOWNTO 0) := b"001"; --BLUE(UNUSED)
	CONSTANT c_YELLOW : std_logic_vector(2 DOWNTO 0) := b"110"; --YELLOW(STATE)

BEGIN
	--------------------------------------------------------
	-- Instance (copy) of clock_enable entity generates
	-- an enable pulse every 250 ms (4 Hz). Remember that
	-- the frequency of the clock signal is 100 MHz.
	--------------------------------------------------------
	clk_en0 : ENTITY work.clock_enable
			GENERIC MAP
			(
			g_MAX => 1 -- 1 FOR SIMULATION PURPOSE ONLY !!!
			-- FOR IMPLEMENTATION: g_MAX = 250 ms(25000000) / (1/100 MHz)
			)
			PORT MAP
			(
				clk   => clk,
				reset => reset,
				ce_o  => s_en
			);
				translator : ENTITY work.translator
					PORT MAP
					(

						data_i   => data_i,

						data_o   => s_data,
						length_o => s_data_length
					);
						--------------------------------------------------------
						-- p_transmitter_FSM:
						-- The sequential process with synchronous reset and
						-- clock_enable entirely controls the s_t_state signal by
						-- CASE statement.
						--------------------------------------------------------
						p_transmitter_FSM : PROCESS (clk)
						BEGIN
							IF rising_edge(clk) THEN
								IF (reset = '1') THEN -- Synchronous reset
									s_t_state   <= INPUTTING; -- Set initial state
									s_led_state <= START;
									s_cnt       <= c_ZERO; -- Clear delay counter
								ELSIF (s_en = '1') THEN
									-- Every 250 ms, CASE checks the value of the s_t_state
									-- variable and changes to the next state according
									-- to the delay value.
									CASE s_t_state IS
										-- If the current state is INPUTTING, then wait for start_i
										-- to become '1' and move to state TRANSMITTING.
										WHEN INPUTTING =>

											IF (start_i /= '1') THEN
											ELSE
												s_t_state <= TRANSMITTING;
												s_cnt     <= c_ZERO;
											END IF;
										WHEN TRANSMITTING =>


											-- DOT=1, DASH=0
											CASE s_led_state IS

												WHEN START =>

													IF (s_cnt < c_DELAY_1SEC) THEN
														s_cnt <= s_cnt + 1;
													ELSE
														-- Move to the next state if next length bit is '1' else end transmission
														IF (s_data_length(5) = '1') THEN
															s_led_state <= CHAR0;
														ELSE
															-- END OF TRANSMISSION
															s_led_state <= START;
															s_t_state   <= INPUTTING;
														END IF;
														-- Reset local counter value
														s_cnt <= c_ZERO;
													END IF;


													--FIRST CHARACTER
												WHEN CHAR0 =>

													IF (s_data(5) = '1') THEN
														IF (s_cnt < c_DELAY_1SEC) THEN
															s_cnt <= s_cnt + 1;
														ELSE
															-- Move to the next state if next length bit is '1' else end transmission
															IF (s_data_length(4) = '1') THEN
																s_led_state <= PAUSE0;
															ELSE
																-- END OF TRANSMISSION
																s_led_state <= START;
																s_t_state   <= INPUTTING;
															END IF;
															-- Reset local counter value
															s_cnt <= c_ZERO;
														END IF;

													ELSIF (s_data(5) = '0') THEN
														IF (s_cnt < c_DELAY_2SEC) THEN
															s_cnt <= s_cnt + 1;
														ELSE
															-- Move to the next state if next length bit is '1' else end transmission
															IF (s_data_length(4) = '1') THEN
																s_led_state <= PAUSE0;
															ELSE
																-- END OF TRANSMISSION
																s_led_state <= START;
																s_t_state   <= INPUTTING;
															END IF;
															-- Reset local counter value
															s_cnt <= c_ZERO;
														END IF;
													END IF;


												WHEN PAUSE0 =>

													IF (s_cnt < c_DELAY_1SEC) THEN
														s_cnt <= s_cnt + 1;
													ELSE
														-- Move to the next state if next length bit is '1' else end transmission
														IF (s_data_length(4) = '1') THEN

															s_led_state <= CHAR1;
														ELSE
															-- END OF TRANSMISSION
															s_led_state <= START;
															s_t_state   <= INPUTTING;
														END IF;
														-- Reset local counter value
														s_cnt <= c_ZERO;
													END IF;



													--SECOND CHARACTER
												WHEN CHAR1 =>

													IF (s_data(4) = '1') THEN
														IF (s_cnt < c_DELAY_1SEC) THEN
															s_cnt <= s_cnt + 1;
														ELSE
															-- Move to the next state if next length bit is '1' else end transmission
															IF (s_data_length(3) = '1') THEN
																s_led_state <= PAUSE1;
															ELSE
																-- END OF TRANSMISSION
																s_led_state <= START;
																s_t_state   <= INPUTTING;
															END IF;
															-- Reset local counter value
															s_cnt <= c_ZERO;
														END IF;

													ELSIF (s_data(4) = '0') THEN
														IF (s_cnt < c_DELAY_2SEC) THEN
															s_cnt <= s_cnt + 1;
														ELSE
															-- Move to the next state if next length bit is '1' else end transmission
															IF (s_data_length(3) = '1') THEN
																s_led_state <= PAUSE1;
															ELSE
																-- END OF TRANSMISSION
																s_led_state <= START;
																s_t_state   <= INPUTTING;
															END IF;
															-- Reset local counter value
															s_cnt <= c_ZERO;
														END IF;
													END IF;
												WHEN PAUSE1 =>

													IF (s_cnt < c_DELAY_1SEC) THEN
														s_cnt <= s_cnt + 1;
													ELSE
														-- Move to the next state if next length bit is '1' else end transmission
														IF (s_data_length(3) = '1') THEN

															s_led_state <= CHAR2;
														ELSE
															-- END OF TRANSMISSION
															s_led_state <= START;
															s_t_state   <= INPUTTING;
														END IF;
														-- Reset local counter value
														s_cnt <= c_ZERO;
													END IF;

													--THIRD CHARACTER
												WHEN CHAR2 =>

													IF (s_data_length(3) = '1') THEN
														IF (s_data(3) = '1') THEN
															IF (s_cnt < c_DELAY_1SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- Move to the next state if next length bit is '1' else end transmission
																IF (s_data_length(2) = '1') THEN
																	s_led_state <= PAUSE2;
																ELSE
																	-- END OF TRANSMISSION
																	s_led_state <= START;
																	s_t_state   <= INPUTTING;
																END IF;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;

														ELSIF (s_data(3) = '0') THEN
															IF (s_cnt < c_DELAY_2SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- Move to the next state if next length bit is '1' else end transmission
																IF (s_data_length(2) = '1') THEN
																	s_led_state <= PAUSE2;
																ELSE
																	-- END OF TRANSMISSION
																	s_led_state <= START;
																	s_t_state   <= INPUTTING;
																END IF;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;
														END IF;
													ELSE
														-- END OF TRANSMISSION
														s_led_state <= START;
														s_t_state   <= INPUTTING;
														-- Reset local counter value
														s_cnt <= c_ZERO;

													END IF;


												WHEN PAUSE2 =>

													IF (s_cnt < c_DELAY_1SEC) THEN
														s_cnt <= s_cnt + 1;
													ELSE
														-- Move to the next state if next length bit is '1' else end transmission
														IF (s_data_length(3) = '1') THEN

															s_led_state <= CHAR3;
														ELSE
															-- END OF TRANSMISSION
															s_led_state <= START;
															s_t_state   <= INPUTTING;
														END IF;
														-- Reset local counter value
														s_cnt <= c_ZERO;
													END IF;







													--FOURTH CHARACTER
												WHEN CHAR3 =>

													IF (s_data_length(2) = '1') THEN
														IF (s_data(2) = '1') THEN
															IF (s_cnt < c_DELAY_1SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- Move to the next state if next length bit is '1' else end transmission
																IF (s_data_length(1) = '1') THEN
																	s_led_state <= PAUSE3;
																ELSE
																	-- END OF TRANSMISSION
																	s_led_state <= START;
																	s_t_state   <= INPUTTING;
																END IF;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;

														ELSIF (s_data(2) = '0') THEN
															IF (s_cnt < c_DELAY_2SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- Move to the next state if next length bit is '1' else end transmission
																IF (s_data_length(1) = '1') THEN
																	s_led_state <= PAUSE3;
																ELSE
																	-- END OF TRANSMISSION
																	s_led_state <= START;
																	s_t_state   <= INPUTTING;
																END IF;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;
														END IF;
													ELSE
														-- END OF TRANSMISSION
														s_led_state <= START;
														s_t_state   <= INPUTTING;
														-- Reset local counter value
														s_cnt <= c_ZERO;

													END IF;

												WHEN PAUSE3 =>

													IF (s_cnt < c_DELAY_1SEC) THEN
														s_cnt <= s_cnt + 1;
													ELSE
														-- Move to the next state if next length bit is '1' else end transmission
														IF (s_data_length(3) = '1') THEN

															s_led_state <= CHAR4;
														ELSE
															-- END OF TRANSMISSION
															s_led_state <= START;
															s_t_state   <= INPUTTING;
														END IF;
														-- Reset local counter value
														s_cnt <= c_ZERO;
													END IF;






													--FIFTH CHARACTER
												WHEN CHAR4 =>


													IF (s_data_length(1) = '1') THEN
														IF (s_data(1) = '1') THEN
															IF (s_cnt < c_DELAY_1SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- Move to the next state if next length bit is '1' else end transmission
																IF (s_data_length(0) = '1') THEN
																	s_led_state <= PAUSE4;
																ELSE
																	-- END OF TRANSMISSION
																	s_led_state <= START;
																	s_t_state   <= INPUTTING;
																END IF;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;

														ELSIF (s_data(1) = '0') THEN
															IF (s_cnt < c_DELAY_2SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- Move to the next state if next length bit is '1' else end transmission
																IF (s_data_length(0) = '1') THEN
																	s_led_state <= PAUSE4;
																ELSE
																	-- END OF TRANSMISSION
																	s_led_state <= START;
																	s_t_state   <= INPUTTING;
																END IF;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;
														END IF;
													END IF;

												WHEN PAUSE4 =>

													IF (s_cnt < c_DELAY_1SEC) THEN
														s_cnt <= s_cnt + 1;
													ELSE
														-- Move to the next state if next length bit is '1' else end transmission
														IF (s_data_length(3) = '1') THEN

															s_led_state <= CHAR5;
														ELSE
															-- END OF TRANSMISSION
															s_led_state <= START;
															s_t_state   <= INPUTTING;
														END IF;
														-- Reset local counter value
														s_cnt <= c_ZERO;
													END IF;




													--SIXTH CHARACTER
												WHEN CHAR5 =>

													IF (s_data_length(0) = '1') THEN
														IF (s_data(0) = '1') THEN
															IF (s_cnt < c_DELAY_1SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- END OF TRANSMISSION
																s_led_state <= START;
																s_t_state   <= INPUTTING;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;

														ELSIF (s_data(0) = '0') THEN
															IF (s_cnt < c_DELAY_2SEC) THEN
																s_cnt <= s_cnt + 1;
															ELSE
																-- END OF TRANSMISSION
																s_led_state <= START;
																s_t_state   <= INPUTTING;
																-- Reset local counter value
																s_cnt <= c_ZERO;
															END IF;
														END IF;
													END IF;




												WHEN OTHERS =>
													s_t_state   <= INPUTTING;
													s_led_state <= START;
													s_cnt       <= c_ZERO;


										END CASE;


										-- It is a good programming practice to use the
										-- OTHERS clause, even if all CASE choices have
										-- been made.
										WHEN OTHERS =>
											s_t_state   <= INPUTTING;
											s_led_state <= CHAR0;
											s_cnt       <= c_ZERO;

									END CASE;
								END IF; -- Synchronous reset
							END IF; -- Rising edge
						END PROCESS p_transmitter_FSM;
						
						
						
						--LLED
						p_transmitter_output : PROCESS (s_led_state)
						BEGIN
							CASE s_led_state IS
								WHEN START =>

									transmitter_o <= c_OFF;

								WHEN CHAR0 =>

									transmitter_o <= c_GREEN;
								WHEN CHAR1 =>

									transmitter_o <= c_GREEN;
								WHEN CHAR2 =>

									transmitter_o <= c_GREEN;
								WHEN CHAR3 =>

									transmitter_o <= c_GREEN;
								WHEN CHAR4 =>

									transmitter_o <= c_GREEN;
								WHEN CHAR5 =>

									transmitter_o <= c_GREEN;
								WHEN OTHERS =>

									transmitter_o <= c_OFF;

							END CASE;
						END PROCESS p_transmitter_output;
						
						
						
						
						--RLED
						p_transmitter_state_output : PROCESS (s_t_state)
						BEGIN
							CASE s_t_state IS
								WHEN INPUTTING =>

									state_o <= c_RED;
								WHEN TRANSMITTING =>

									state_o <= c_YELLOW;
								WHEN OTHERS =>

									state_o <= c_OFF;
							END CASE;
						END PROCESS p_transmitter_state_output;
END ARCHITECTURE Behavioral;