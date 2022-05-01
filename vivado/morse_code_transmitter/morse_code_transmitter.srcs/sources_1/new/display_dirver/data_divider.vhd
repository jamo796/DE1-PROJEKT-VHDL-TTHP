------------------------------------------------------------
--
-- Data divider.
-- Nexys A7-50T, Vivado v2022.1,
--
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
------------------------------------------------------------
-- Entity declaration for data divider
------------------------------------------------------------
ENTITY data_divider IS
	PORT
	(
		data_i  : IN std_logic_vector(5 DOWNTO 0); -- Input from user(Switches)
		data0_o : OUT std_logic_vector(5 DOWNTO 0); -- Output from divider(individual data for 7-seg displays)
		data1_o : OUT std_logic_vector(5 DOWNTO 0);
		data2_o : OUT std_logic_vector(5 DOWNTO 0);
		data3_o : OUT std_logic_vector(5 DOWNTO 0);
		data4_o : OUT std_logic_vector(5 DOWNTO 0);
		data5_o : OUT std_logic_vector(5 DOWNTO 0);
		data6_o : OUT std_logic_vector(5 DOWNTO 0);
		data7_o : OUT std_logic_vector(5 DOWNTO 0);

		decp_o  : OUT std_logic_vector(7 DOWNTO 0)
	);
END ENTITY data_divider;
------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
ARCHITECTURE Behavioral OF data_divider IS
BEGIN
	p_data_divider : PROCESS (data_i)
	BEGIN
		CASE data_i IS
			WHEN "000000" =>
				--ZOBRAZENIE PISMENA "a" ".-"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000000"; --ZOBRAZUJE PISMENO "a"
				decp_o  <= "10000000"; --bodky

			WHEN "000001" =>
				--ZOBRAZENIE PISMENA "b" "-..."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000001"; --ZOBRAZUJE PISMENO "b"
				decp_o  <= "01110000"; --bodky

			WHEN "000010" =>
				--ZOBRAZENIE PISMENA "c" "-.-."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000010"; --ZOBRAZUJE PISMENO "c"
				decp_o  <= "01010000"; --bodky

			WHEN "000011" =>
				--ZOBRAZENIE PISMENA "d" "-.."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000011"; --ZOBRAZUJE PISMENO "d"
				decp_o  <= "01100000"; --bodky

			WHEN "000100" =>
				--ZOBRAZENIE PISMENA "E" "."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000100"; --ZOBRAZUJE PISMENO "E"
				decp_o  <= "10000000"; --bodky

			WHEN "000101" =>
				--ZOBRAZENIE PISMENA "F" "..-."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000101"; --ZOBRAZUJE PISMENO "F"
				decp_o  <= "11010000"; --bodky

			WHEN "000110" =>
				--ZOBRAZENIE PISMENA "G" "--."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000110"; --ZOBRAZUJE PISMENO "G"
				decp_o  <= "00100000"; --bodky

			WHEN "000111" =>
				--ZOBRAZENIE PISMENA "h" "...."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "000111"; --ZOBRAZUJE PISMENO "h"
				decp_o  <= "11110000"; --bodky

			WHEN "001000" =>
				--ZOBRAZENIE PISMENA "i" ".."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001000"; --ZOBRAZUJE PISMENO "i"
				decp_o  <= "11000000"; --bodky

			WHEN "001001" =>
				--ZOBRAZENIE PISMENA "j" ".---"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100101"; --CIARKA
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001001"; --ZOBRAZUJE PISMENO "j"
				decp_o  <= "10000000"; --bodky

			WHEN "001010" =>
				--ZOBRAZENIE PISMENA "k" "-.-"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001010"; --ZOBRAZUJE PISMENO "k"
				decp_o  <= "01000000"; --bodky

			WHEN "001011" =>
				--ZOBRAZENIE PISMENA "L" ".-.."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001011"; --ZOBRAZUJE PISMENO "L"
				decp_o  <= "10110000"; --bodky

			WHEN "001100" =>
				--ZOBRAZENIE PISMENA "M" "--"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001100"; --ZOBRAZUJE PISMENO "M"
				decp_o  <= "00000000"; --bodky

			WHEN "001101" =>
				--ZOBRAZENIE PISMENA "n" "-."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001101"; --ZOBRAZUJE PISMENO "n"
				decp_o  <= "01000000"; --bodky

			WHEN "001110" =>
				--ZOBRAZENIE PISMENA "o" "---"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001110"; --ZOBRAZUJE PISMENO "o"
				decp_o  <= "00000000"; --bodky

			WHEN "001111" =>
				--ZOBRAZENIE PISMENA "P" ".--."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "001111"; --ZOBRAZUJE PISMENO "P"
				decp_o  <= "10010000"; --bodky

			WHEN "010000" =>
				--ZOBRAZENIE PISMENA "q" "--.-"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100101"; --CIARKA
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010000"; --ZOBRAZUJE PISMENO "q"
				decp_o  <= "00100000"; --bodky

			WHEN "010001" =>
				--ZOBRAZENIE PISMENA "r" ".-."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010001"; --ZOBRAZUJE PISMENO "r"
				decp_o  <= "10100000"; --bodky

			WHEN "010010" =>
				--ZOBRAZENIE PISMENA "S" "..."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010010"; --ZOBRAZUJE PISMENO "S"
				decp_o  <= "11100000"; --bodky

			WHEN "010011" =>
				--ZOBRAZENIE PISMENA "t" "-"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010011"; --ZOBRAZUJE PISMENO "t"
				decp_o  <= "00000000"; --bodky

			WHEN "010100" =>
				--ZOBRAZENIE PISMENA "u" "..-"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010100"; --ZOBRAZUJE PISMENO "u"
				decp_o  <= "11000000"; --bodky

			WHEN "010101" =>
				--ZOBRAZENIE PISMENA "v" "...-"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100101"; --CIARKA
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010101"; --ZOBRAZUJE PISMENO "v"
				decp_o  <= "11100000"; --bodky

			WHEN "010110" =>
				--ZOBRAZENIE PISMENA "w" ".--"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010110"; --ZOBRAZUJE PISMENO "w"
				decp_o  <= "10000000"; --bodky

			WHEN "010111" =>
				--ZOBRAZENIE PISMENA "x" "-..-"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100101"; --CIARKA
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "010111"; --ZOBRAZUJE PISMENO "x"
				decp_o  <= "01100000"; --bodky

			WHEN "011000" =>
				--ZOBRAZENIE PISMENA "y" "-.--"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100101"; --CIARKA
				data4_o <= "100101"; --CIARKA
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011000"; --ZOBRAZUJE PISMENO "y"
				decp_o  <= "01000000"; --bodky

			WHEN "011001" =>
				--ZOBRAZENIE PISMENA "Z" "--.."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011001"; --ZOBRAZUJE PISMENO "Z"
				decp_o  <= "01100000"; --bodky

			WHEN "100100" =>
				--ZOBRAZENIE ZNAKU "@" ".--.-."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100101"; --CIARKA
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "100100"; --ZOBRAZUJE ZNAK "@"
				decp_o  <= "10010100"; --bodky

			WHEN "011010" =>
				--ZOBRAZENIE ZNAKU "0" "-----"
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100101"; --CIARKA
				data3_o <= "100101"; --CIARKA
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011010"; --ZOBRAZUJE ZNAK "0"
				decp_o  <= "00000000"; --bodky


			WHEN "011011" =>
				--ZOBRAZENIE ZNAKU "1" ".----"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100101"; --CIARKA
				data3_o <= "100101"; --CIARKA
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011011"; --ZOBRAZUJE ZNAK "1"
				decp_o  <= "10000000"; --bodky

			WHEN "011100" =>
				--ZOBRAZENIE ZNAKU "2" "..---"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100101"; --CIARKA
				data4_o <= "100101"; --CIARKA
				data3_o <= "100101"; --CIARKA
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011100"; --ZOBRAZUJE ZNAK "2"
				decp_o  <= "11000000"; --bodky

			WHEN "011101" =>
				--ZOBRAZENIE ZNAKU "3" "...--"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100101"; --CIARKA
				data3_o <= "100101"; --CIARKA
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011101"; --ZOBRAZUJE ZNAK "3"
				decp_o  <= "11100000"; --bodky


			WHEN "011110" =>
				--ZOBRAZENIE ZNAKU "4" "....-"
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100101"; --CIARKA
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011110"; --ZOBRAZUJE ZNAK "4"
				decp_o  <= "11110000"; --bodky

			WHEN "011111" =>
				--ZOBRAZENIE ZNAKU "5" "....."
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "011111"; --ZOBRAZUJE ZNAK "5"
				decp_o  <= "11111000"; --bodky


			WHEN "100000" =>
				--ZOBRAZENIE ZNAKU "6" "-...."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "100000"; --ZOBRAZUJE ZNAK "6"
				decp_o  <= "01111000"; --bodky


			WHEN "100001" =>
				--ZOBRAZENIE ZNAKU "7" "--..."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "100001"; --ZOBRAZUJE ZNAK "7"
				decp_o  <= "00111000"; --bodky


			WHEN "100010" =>
				--ZOBRAZENIE ZNAKU "8" "---.."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "100010"; --ZOBRAZUJE ZNAK "8"
				decp_o  <= "00011000"; --bodky


			WHEN "100011" =>
				--ZOBRAZENIE ZNAKU "9" "----."
				data7_o <= "100101"; --CIARKA
				data6_o <= "100101"; --CIARKA
				data5_o <= "100101"; --CIARKA
				data4_o <= "100101"; --CIARKA
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "100011"; --ZOBRAZUJE ZNAK "9"
				decp_o  <= "00001000"; --bodky



			WHEN OTHERS =>
				--NEVYUZITE
				data7_o <= "100110"; --PRAZDNE
				data6_o <= "100110"; --PRAZDNE
				data5_o <= "100110"; --PRAZDNE
				data4_o <= "100110"; --PRAZDNE
				data3_o <= "100110"; --PRAZDNE
				data2_o <= "100110"; --PRAZDNE
				data1_o <= "100110"; --PRAZDNE
				data0_o <= "100110"; --PRAZDNE
				decp_o  <= "00000000"; --bodky(PRAZDNE)


		END CASE;
	END PROCESS p_data_divider;
END ARCHITECTURE Behavioral;