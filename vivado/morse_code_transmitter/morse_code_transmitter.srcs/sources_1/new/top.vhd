----------------------------------------------------------------------------------
-- Company: Brno University of Technology
-- Engineer: David Hamran
--
-- Module Name: mct - Behavioral
-- Project Name: Morse code transmitter
-- Target Devices: Nexys A7-50T
--
-- Dependencies: transmitter, morse_display_driver
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY mct IS
	PORT
	(
		CLK100MHZ : IN STD_LOGIC; --clock
		SW        : IN STD_LOGIC_VECTOR (5 DOWNTO 0); --switches for data input
		CA        : OUT STD_LOGIC; --cathodes for 7-seg display
		CB        : OUT STD_LOGIC;
		CC        : OUT STD_LOGIC;
		CD        : OUT STD_LOGIC;
		CE        : OUT STD_LOGIC;
		CF        : OUT STD_LOGIC;
		CG        : OUT STD_LOGIC;
		DP        : OUT STD_LOGIC;
		AN        : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); --common anodes connection

		BTNR      : IN STD_LOGIC; --start button
		LED16_R   : OUT STD_LOGIC; --RGB LEDs
		LED16_G   : OUT STD_LOGIC;
		LED16_B   : OUT STD_LOGIC;
		LED17_R   : OUT STD_LOGIC;
		LED17_G   : OUT STD_LOGIC;
		LED17_B   : OUT STD_LOGIC;

		BTNC      : IN STD_LOGIC --reset button
	);
END mct;
ARCHITECTURE Behavioral OF mct IS
BEGIN
	-- Instance (copy) of transmitter entity
	transmitter : ENTITY work.transmitter
		PORT MAP
		(
			clk              => CLK100MHZ,
			reset            => BTNC,


			data_i(5)        => SW(5),
			data_i(4)        => SW(4),
			data_i(3)        => SW(3),
			data_i(2)        => SW(2),
			data_i(1)        => SW(1),
			data_i(0)        => SW(0),


			start_i          => BTNR,

			transmitter_o(2) => LED17_R,
			transmitter_o(1) => LED17_G,
			transmitter_o(0) => LED17_B,


			state_o(2)       => LED16_R,
			state_o(1)       => LED16_G,
			state_o(0)       => LED16_B
		);



			--------------------------------------------------------
			-- Instance (copy) of driver_7seg_8digits entity
			morse_display_driver : ENTITY work.driver_7seg_8digits
				PORT MAP
				(
					clk               => CLK100MHZ,
					reset             => BTNC,

					data_i(5)         => SW(5),
					data_i(4)         => SW(4),
					data_i(3)         => SW(3),
					data_i(2)         => SW(2),
					data_i(1)         => SW(1),
					data_i(0)         => SW(0),

					dp_o              => DP,



					seg_o(6)          => CA,
					seg_o(5)          => CB,
					seg_o(4)          => CC,
					seg_o(3)          => CD,
					seg_o(2)          => CE,
					seg_o(1)          => CF,
					seg_o(0)          => CG,

					dig_o(7 DOWNTO 0) => AN(7 DOWNTO 0)
				);
END Behavioral;