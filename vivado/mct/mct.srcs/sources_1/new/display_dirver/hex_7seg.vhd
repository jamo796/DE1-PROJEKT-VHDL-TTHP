LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------
ENTITY hex_7seg IS
	PORT
	(
		hex_i : IN std_logic_vector(5 DOWNTO 0);
		seg_o : OUT std_logic_vector(6 DOWNTO 0)
	);
END ENTITY hex_7seg;
------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
ARCHITECTURE Behavioral OF hex_7seg IS
BEGIN
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "hex_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------
p_7seg_decoder : PROCESS (hex_i)
	BEGIN
		CASE hex_i IS
			WHEN "100101" =>
				seg_o <= "1111110"; -- ciarka

			WHEN "100110" =>
				seg_o <= "1111111"; -- prazdno
			WHEN "000000" =>
				seg_o <= "0000010"; -- a
			WHEN "000001" =>
				seg_o <= "1100000"; -- b
			WHEN "000010" =>
				seg_o <= "1110010"; -- c
			WHEN "000011" =>
				seg_o <= "1000010"; -- d
			WHEN "000100" =>
				seg_o <= "0110000"; -- E
			WHEN "000101" =>
				seg_o <= "0111000"; -- F
			WHEN "000110" =>
				seg_o <= "0100001"; -- G
			WHEN "000111" =>
				seg_o <= "1101000"; -- H
			WHEN "001000" =>
				seg_o <= "0111011"; -- I
			WHEN "001001" =>
				seg_o <= "0100111"; -- J
			WHEN "001010" =>
				seg_o <= "0101000"; -- K
			WHEN "001011" =>
				seg_o <= "1110001"; -- L
			WHEN "001100" =>
				seg_o <= "0101010"; -- M
			WHEN "001101" =>
				seg_o <= "1101010"; -- N
			WHEN "001110" =>
				seg_o <= "1100010"; -- O
			WHEN "001111" =>
				seg_o <= "0011000"; -- P
			WHEN "010000" =>
				seg_o <= "0001100"; -- Q
			WHEN "010001" =>
				seg_o <= "1111010"; -- R
			WHEN "010010" =>
				seg_o <= "0100101"; -- S
			WHEN "010011" =>
				seg_o <= "1110000"; -- T
			WHEN "010100" =>
				seg_o <= "1100011"; -- U
			WHEN "010101" =>
				seg_o <= "1010101"; -- V
			WHEN "010110" =>
				seg_o <= "1010100"; -- W
			WHEN "010111" =>
				seg_o <= "1101011"; -- X
			WHEN "011000" =>
				seg_o <= "1000100"; -- Y
			WHEN "011001" =>
				seg_o <= "0010011"; -- Z
			WHEN "100100" =>
				seg_o <= "0111000"; -- @
			WHEN "011010" =>
				seg_o <= "0000001"; -- 0
			WHEN "011011" =>
				seg_o <= "1001111"; -- 1
			WHEN "011100" =>
				seg_o <= "0010010"; -- 2
			WHEN "011101" =>
				seg_o <= "0000110"; -- 3
			WHEN "011110" =>
				seg_o <= "1001100"; -- 4
			WHEN "011111" =>
				seg_o <= "0100100"; -- 5
			WHEN "100000" =>
				seg_o <= "0100000"; -- 6
			WHEN "100001" =>
				seg_o <= "0001111"; -- 7
			WHEN "100010" =>
				seg_o <= "0000000"; -- 8
			WHEN "100011" =>
				seg_o <= "0000100"; -- 9

			WHEN OTHERS =>
				seg_o <= "1111111"; -- prazdno


		END CASE;
	END PROCESS p_7seg_decoder;
END ARCHITECTURE Behavioral;