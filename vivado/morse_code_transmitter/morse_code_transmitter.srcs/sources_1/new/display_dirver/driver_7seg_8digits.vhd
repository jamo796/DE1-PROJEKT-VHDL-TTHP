library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for display driver
--
--             +------------------+
--        -----|> clk             |
--        -----| reset       dp_o |-----
--             |       seg_o(6:0) |--/--
--			   |				  |  7
--        --/--| data_i(5:0)      |
--          6  |                  |
--             |                  |
--             |                  |
--             |                  |
--             |        dig_o(7:0)|--/--
--             |                  |  8
--             +------------------+
--
-- Inputs:
--   clk
--   reset
--   dataX_i(5:0) -- Data values for individual digits
--   dp_i(7:0)    -- Decimal points for individual digits
--
-- Outputs:
--   dp_o:        -- Decimal point for specific digit
--   seg_o(6:0)   -- Cathode values for individual segments
--   dig_o(7:0)   -- Common anode signals to individual digits
--
------------------------------------------------------------
ENTITY driver_7seg_8digits IS
	PORT
	(
		clk    : IN std_logic;
		reset  : IN std_logic;
		data_i : IN std_logic_vector(5 DOWNTO 0);
		dp_o   : OUT std_logic;
		seg_o  : OUT std_logic_vector(6 DOWNTO 0);
		dig_o  : OUT std_logic_vector(7 DOWNTO 0)
	);
END ENTITY driver_7seg_8digits;
------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------
ARCHITECTURE Behavioral OF driver_7seg_8digits IS
	-- Internal clock enable
	SIGNAL s_en : std_logic;
	-- Internal 4-bit counter for multiplexing 8 digits
	SIGNAL s_cnt : std_logic_vector(2 DOWNTO 0);
	-- Internal 4-bit value for 7-segment decoder
	SIGNAL s_hex   : std_logic_vector(5 DOWNTO 0);

	SIGNAL s_data0 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data1 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data2 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data3 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data4 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data5 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data6 : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_data7 : std_logic_vector(5 DOWNTO 0);

	SIGNAL s_dp    : std_logic_vector(7 DOWNTO 0);





BEGIN
	--------------------------------------------------------
	-- Instance (copy) of clock_enable entity generates
	-- an enable pulse every 4 ms
	--------------------------------------------------------
	clk_en0 : ENTITY work.clock_enable
			GENERIC MAP
			(
			-- FOR SIMULATION, CHANGE THIS VALUE TO 4
			-- FOR IMPLEMENTATION, KEEP THIS VALUE TO 400,000
			g_MAX => 4
			)
			PORT MAP
			(
				clk   => clk,
				reset => reset,
				ce_o  => s_en
			);
				--------------------------------------------------------
				-- Instance (copy) of cnt_up_down entity performs a 4-bit
				-- down counter
				--------------------------------------------------------
				bin_cnt0 : ENTITY work.cnt_up_down
						GENERIC MAP
						(
						g_CNT_WIDTH => 3
						)
						PORT MAP
						(
							en_i     => s_en,
							cnt_up_i => '0',
							reset    => reset,
							clk      => clk,
							cnt_o    => s_cnt
						);
							--------------------------------------------------------
							-- Instance (copy) of hex_7seg entity performs a 7-segment
							-- display decoder
							--------------------------------------------------------
							hex2seg : ENTITY work.hex_7seg
								PORT MAP
								(
									hex_i => s_hex,
									seg_o => seg_o
								);

									--------------------------------------------------------
									-- Instance (copy) of data divider entity 
									--------------------------------------------------------
									dataDiv : ENTITY work.data_divider
										PORT MAP
										(
											data_i  => data_i,

											data7_o => s_data7,
											data6_o => s_data6,
											data5_o => s_data5,
											data4_o => s_data4,
											data3_o => s_data3,
											data2_o => s_data2,
											data1_o => s_data1,
											data0_o => s_data0,

											decp_o  => s_dp
										);


											--------------------------------------------------------
											-- p_mux:
											-- A sequential process that implements a multiplexer for
											-- selecting data for a single digit, a decimal point
											-- signal, and switches the common anodes of each display.
											--------------------------------------------------------
											p_mux : PROCESS (clk)
											BEGIN
												IF rising_edge(clk) THEN
													IF (reset = '1') THEN
														s_hex <= "010001";
														dp_o  <= s_dp(0);
														dig_o <= "11111110";
													ELSE
														CASE s_cnt IS
															--MORESEOVA ABECEDA NA SEGMENTOVKACH
															WHEN "111" =>
																s_hex <= s_data7;
																dp_o  <= s_dp(7);
																dig_o <= "01111111"; --PRVA SEGMENTOVKA
															WHEN "110" =>
																s_hex <= s_data6;
																dp_o  <= s_dp(6);
																dig_o <= "10111111"; --DRUHA SEGMENTOVKA
															WHEN "101" =>
																s_hex <= s_data5;
																dp_o  <= s_dp(5);
																dig_o <= "11011111"; --TRETIA SEGMENTOVKA
															WHEN "100" =>
																s_hex <= s_data4;
																dp_o  <= s_dp(4);
																dig_o <= "11101111"; --STVRTA SEGMENTOVKA
															WHEN "011" =>
																s_hex <= s_data3;
																dp_o  <= s_dp(3);
																dig_o <= "11110111"; --PIATA SEGMENTOVKA
															WHEN "010" =>
																s_hex <= s_data2;
																dp_o  <= s_dp(2);
																dig_o <= "11111011"; --SIESTA SEGMENTOVKA
																--PRAZDNA SEGMENTOVKA
															WHEN "001" =>
																s_hex <= s_data1;
																dp_o  <= s_dp(1); --decimal point tu nikdy nesvieti
																dig_o <= "11111101"; --SIEDMA SEGMENTOVKA
																--PISMENO ABECEDY NA POSLEDNEJ SEGMENTOVKE
															WHEN OTHERS =>
																s_hex <= s_data0;
																dp_o  <= s_dp(0); --decimal point tu nikdy nesvieti
																dig_o <= "11111110"; --OSMA SEGMENTOVKA
														END CASE;
													END IF;
												END IF;
											END PROCESS p_mux;
END ARCHITECTURE Behavioral;