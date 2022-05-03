LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


-- deklarace vstupů a výstupů
ENTITY translator IS
	PORT
	(
		data_i   : IN std_logic_vector(5 DOWNTO 0);
		data_o   : OUT std_logic_vector(5 DOWNTO 0);
		length_o : OUT std_logic_vector(5 DOWNTO 0)

	);
END ENTITY translator;
ARCHITECTURE Behavioral OF translator IS
BEGIN
	--DOT =1, DASH =0
	data_o <= "100000" WHEN (data_i = "000000") ELSE --A
	          "011100" WHEN (data_i = "000001") ELSE --B
	          "010100" WHEN (data_i = "000010") ELSE --C
	          "011000" WHEN (data_i = "000011") ELSE --D
	          "100000" WHEN (data_i = "000100") ELSE --E
	          "110100" WHEN (data_i = "000101") ELSE --F
	          "001000" WHEN (data_i = "000110") ELSE --G
	          "111100" WHEN (data_i = "000111") ELSE --H
	          "110000" WHEN (data_i = "001000") ELSE --I
	          "100000" WHEN (data_i = "001001") ELSE --J
	          "010000" WHEN (data_i = "001010") ELSE --K
	          "101100" WHEN (data_i = "001011") ELSE --L
	          "000000" WHEN (data_i = "001100") ELSE --M
	          "010000" WHEN (data_i = "001101") ELSE --N
	          "000000" WHEN (data_i = "001110") ELSE --O
	          "100100" WHEN (data_i = "001111") ELSE --P
	          "001000" WHEN (data_i = "010000") ELSE --Q
	          "101000" WHEN (data_i = "010001") ELSE --R
	          "111000" WHEN (data_i = "010010") ELSE --S
	          "000000" WHEN (data_i = "010011") ELSE --T
	          "110000" WHEN (data_i = "010100") ELSE --U
	          "111000" WHEN (data_i = "010101") ELSE --V
	          "100000" WHEN (data_i = "010110") ELSE --W
	          "011000" WHEN (data_i = "010111") ELSE --X
	          "010000" WHEN (data_i = "011000") ELSE --Y
	          "001100" WHEN (data_i = "011001") ELSE --Z
	          "000000" WHEN (data_i = "011010") ELSE --0
	          "100000" WHEN (data_i = "011011") ELSE --1
	          "110000" WHEN (data_i = "011100") ELSE --2
	          "111000" WHEN (data_i = "011101") ELSE --3
	          "111100" WHEN (data_i = "011110") ELSE --4
	          "111110" WHEN (data_i = "011111") ELSE --5
	          "011110" WHEN (data_i = "100000") ELSE --6
	          "001110" WHEN (data_i = "100001") ELSE --7
	          "000110" WHEN (data_i = "100010") ELSE --8
	          "000010" WHEN (data_i = "100011") ELSE --9
	          "100101" WHEN (data_i = "100100") ELSE --@
	          "000000";
	length_o <= "110000" WHEN (data_i = "000000") ELSE --A
	            "111100" WHEN (data_i = "000001") ELSE --B
	            "111100" WHEN (data_i = "000010") ELSE --C
	            "111000" WHEN (data_i = "000011") ELSE --D
	            "100000" WHEN (data_i = "000100") ELSE --E
	            "111100" WHEN (data_i = "000101") ELSE --F
	            "111000" WHEN (data_i = "000110") ELSE --G
	            "111100" WHEN (data_i = "000111") ELSE --H
	            "110000" WHEN (data_i = "001000") ELSE --I
	            "111100" WHEN (data_i = "001001") ELSE --J
	            "111000" WHEN (data_i = "001010") ELSE --K
	            "111100" WHEN (data_i = "001011") ELSE --L
	            "110000" WHEN (data_i = "001100") ELSE --M
	            "110000" WHEN (data_i = "001101") ELSE --N
	            "111000" WHEN (data_i = "001110") ELSE --O
	            "111100" WHEN (data_i = "001111") ELSE --P
	            "111100" WHEN (data_i = "010000") ELSE --Q
	            "111000" WHEN (data_i = "010001") ELSE --R
	            "111000" WHEN (data_i = "010010") ELSE --S
	            "100000" WHEN (data_i = "010011") ELSE --T
	            "111000" WHEN (data_i = "010100") ELSE --U
	            "111100" WHEN (data_i = "010101") ELSE --V
	            "111000" WHEN (data_i = "010110") ELSE --W
	            "111100" WHEN (data_i = "010111") ELSE --X
	            "111100" WHEN (data_i = "011000") ELSE --Y
	            "111100" WHEN (data_i = "011001") ELSE --Z
	            "111110" WHEN (data_i = "011010") ELSE --0
	            "111110" WHEN (data_i = "011011") ELSE --1
	            "111110" WHEN (data_i = "011100") ELSE --2
	            "111110" WHEN (data_i = "011101") ELSE --3
	            "111110" WHEN (data_i = "011110") ELSE --4
	            "111110" WHEN (data_i = "011111") ELSE --5
	            "111110" WHEN (data_i = "100000") ELSE --6
	            "111110" WHEN (data_i = "100001") ELSE --7
	            "111110" WHEN (data_i = "100010") ELSE --8
	            "111110" WHEN (data_i = "100011") ELSE --9
	            "111111" WHEN (data_i = "100100") ELSE --@
	            "000000";
END ARCHITECTURE Behavioral;