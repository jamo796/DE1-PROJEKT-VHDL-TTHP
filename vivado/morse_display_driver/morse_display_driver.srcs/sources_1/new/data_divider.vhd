------------------------------------------------------------
--
-- Data divider.
-- Nexys A7-50T, Vivado v2022.1,
--
------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for data divider
------------------------------------------------------------
entity data_divider is
    port(
        data_i : in  std_logic_vector(5 downto 0); 		-- Input from user(Switches)
		
        data0_o : out  std_logic_vector(5 downto 0);	-- Output from divider(individual data for 7-seg displays)
        data1_o : out  std_logic_vector(5 downto 0);
        data2_o : out  std_logic_vector(5 downto 0);
        data3_o : out  std_logic_vector(5 downto 0);
		data4_o : out  std_logic_vector(5 downto 0);
        data5_o : out  std_logic_vector(5 downto 0);	
		data6_o : out  std_logic_vector(5 downto 0);	
		data7_o : out  std_logic_vector(5 downto 0);	
		
		decp_o  : out std_logic_vector(7 downto 0)
				
    );
end entity data_divider;


------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture Behavioral of data_divider is
begin






    
    p_data_divider : process(data_i)
    begin
        case data_i is
		
			when "000000" =>
                --ZOBRAZENIE PISMENA "a" ".-"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000000";	--ZOBRAZUJE PISMENO "a"
				
				decp_o  <= "10000000";	--bodky	
             
            when "000001" =>
                --ZOBRAZENIE PISMENA "b" "-..."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000001";	--ZOBRAZUJE PISMENO "b"
				
				decp_o  <= "01110000";	--bodky	

            when "000010" =>
                --ZOBRAZENIE PISMENA "c" "-.-."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000010";	--ZOBRAZUJE PISMENO "c"
				
				decp_o  <= "01010000";	--bodky	

            when "000011" =>
                --ZOBRAZENIE PISMENA "d" "-.."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000011";	--ZOBRAZUJE PISMENO "d"
				
				decp_o  <= "01100000";	--bodky	

            when "000100" =>
                --ZOBRAZENIE PISMENA "E" "."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000100";	--ZOBRAZUJE PISMENO "E"
				
				decp_o  <= "10000000";	--bodky	

            when "000101" =>
                --ZOBRAZENIE PISMENA "F" "..-."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000101";	--ZOBRAZUJE PISMENO "F"
				
				decp_o  <= "11010000";	--bodky	

                
            when "000110" =>
                --ZOBRAZENIE PISMENA "G" "--."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000110";	--ZOBRAZUJE PISMENO "G"
				
				decp_o  <= "00100000";	--bodky	

            when "000111" =>
                --ZOBRAZENIE PISMENA "h" "...."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "000111";	--ZOBRAZUJE PISMENO "h"
				
				decp_o  <= "11110000";	--bodky	

            when "001000" =>
                --ZOBRAZENIE PISMENA "i" ".."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001000";	--ZOBRAZUJE PISMENO "i"
				
				decp_o  <= "11000000";	--bodky	

            when "001001" =>
                --ZOBRAZENIE PISMENA "j" ".---"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100101";	--CIARKA
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001001";	--ZOBRAZUJE PISMENO "j"
				
				decp_o  <= "10000000";	--bodky	

            when "001010" =>
                --ZOBRAZENIE PISMENA "k" "-.-"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001010";	--ZOBRAZUJE PISMENO "k"
				
				decp_o  <= "01000000";	--bodky	

            when "001011" =>
                --ZOBRAZENIE PISMENA "L" ".-.."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001011";	--ZOBRAZUJE PISMENO "L"
				
				decp_o  <= "10110000";	--bodky	

            when "001100" =>
                --ZOBRAZENIE PISMENA "M" "--"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001100";	--ZOBRAZUJE PISMENO "M"
				
				decp_o  <= "00000000";	--bodky	

            when "001101" =>
                --ZOBRAZENIE PISMENA "n" "-."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001101";	--ZOBRAZUJE PISMENO "n"
				
				decp_o  <= "01000000";	--bodky	

            when "001110" =>
                --ZOBRAZENIE PISMENA "o" "---"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001110";	--ZOBRAZUJE PISMENO "o"
				
				decp_o  <= "00000000";	--bodky	

                
            when "001111" =>
                --ZOBRAZENIE PISMENA "P" ".--."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "001111";	--ZOBRAZUJE PISMENO "P"
				
				decp_o  <= "10010000";	--bodky	

                
            when "010000" =>
                --ZOBRAZENIE PISMENA "q" "--.-"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100101";	--CIARKA
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010000";	--ZOBRAZUJE PISMENO "q"
				
				decp_o  <= "00100000";	--bodky	

            when "010001" =>
                --ZOBRAZENIE PISMENA "r" ".-."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010001";	--ZOBRAZUJE PISMENO "r"
				
				decp_o  <= "10100000";	--bodky	

            when "010010" =>
                --ZOBRAZENIE PISMENA "S" "..."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010010";	--ZOBRAZUJE PISMENO "S"
				
				decp_o  <= "11100000";	--bodky	
                
            when "010011" =>
                --ZOBRAZENIE PISMENA "t" "-"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010011";	--ZOBRAZUJE PISMENO "t"
				
				decp_o  <= "00000000";	--bodky	

            when "010100" =>
            --ZOBRAZENIE PISMENA "u" "..-"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010100";	--ZOBRAZUJE PISMENO "u"
				
				decp_o  <= "11000000";	--bodky	
    
            when "010101" =>
                --ZOBRAZENIE PISMENA "v" "...-"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100101";	--CIARKA
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010101";	--ZOBRAZUJE PISMENO "v"
				
				decp_o  <= "11100000";	--bodky	

            when "010110" =>
                --ZOBRAZENIE PISMENA "w" ".--"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010110";	--ZOBRAZUJE PISMENO "w"
				
				decp_o  <= "10000000";	--bodky	

                
            when "010111" =>
                --ZOBRAZENIE PISMENA "x" "-..-"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100101";	--CIARKA
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "010111";	--ZOBRAZUJE PISMENO "x"
				
				decp_o  <= "01100000";	--bodky	

            when "011000" =>
                --ZOBRAZENIE PISMENA "y" "-.--"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100101";	--CIARKA
				data4_o <= "100101";	--CIARKA
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011000";	--ZOBRAZUJE PISMENO "y"
				
				decp_o  <= "01000000";	--bodky	

				
            when "011001" =>
                --ZOBRAZENIE PISMENA "Z" "--.."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011001";	--ZOBRAZUJE PISMENO "Z"
				
				decp_o  <= "01100000";	--bodky	
				
            when "100100" =>
				--ZOBRAZENIE ZNAKU "@" ".--.-."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100101";	--CIARKA
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "100100";	--ZOBRAZUJE ZNAK "@"
				
				decp_o  <= "10010100";	--bodky				
				
            when "011010" =>
                --ZOBRAZENIE ZNAKU "0" "-----"
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100101";	--CIARKA
				data3_o <= "100101";	--CIARKA
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011010";	--ZOBRAZUJE ZNAK "0"
				
				decp_o  <= "00000000";	--bodky				
				
				
            when "011011" =>
                --ZOBRAZENIE ZNAKU "1" ".----"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100101";	--CIARKA
				data3_o <= "100101";	--CIARKA
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011011";	--ZOBRAZUJE ZNAK "1"
				
				decp_o  <= "10000000";	--bodky				
				
            when "011100" =>
                --ZOBRAZENIE ZNAKU "2" "..---"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100101";	--CIARKA
				data4_o <= "100101";	--CIARKA
				data3_o <= "100101";	--CIARKA
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011100";	--ZOBRAZUJE ZNAK "2"
				
				decp_o  <= "11000000";	--bodky				
				
            when "011101" =>
                --ZOBRAZENIE ZNAKU "3" "...--"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100101";	--CIARKA
				data3_o <= "100101";	--CIARKA
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011101";	--ZOBRAZUJE ZNAK "3"
				
				decp_o  <= "11100000";	--bodky				
				
				
            when "011110" =>
                --ZOBRAZENIE ZNAKU "4" "....-"
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100101";	--CIARKA
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011110";	--ZOBRAZUJE ZNAK "4"
				
				decp_o  <= "11110000";	--bodky				
				
            when "011111" =>
                --ZOBRAZENIE ZNAKU "5" "....."
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "011111";	--ZOBRAZUJE ZNAK "5"
				
				decp_o  <= "11111000";	--bodky				
				
				
            when "100000" =>
                --ZOBRAZENIE ZNAKU "6" "-...."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "100000";	--ZOBRAZUJE ZNAK "6"
				
				decp_o  <= "01111000";	--bodky				
				
				
            when "100001" =>
                --ZOBRAZENIE ZNAKU "7" "--..."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "100001";	--ZOBRAZUJE ZNAK "7"
				
				decp_o  <= "00111000";	--bodky				
				
				
            when "100010" =>
                --ZOBRAZENIE ZNAKU "8" "---.."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "100010";	--ZOBRAZUJE ZNAK "8"
				
				decp_o  <= "00011000";	--bodky				
				
				
            when "100011" =>
                --ZOBRAZENIE ZNAKU "9" "----."
				data7_o <= "100101";	--CIARKA
				data6_o <= "100101";	--CIARKA
				data5_o <= "100101";	--CIARKA
				data4_o <= "100101";	--CIARKA
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "100011";	--ZOBRAZUJE ZNAK "9"
				
				decp_o  <= "00001000";	--bodky				
				
						   
				
            when others =>
                --NEVYUZITE
				data7_o <= "100110";	--PRAZDNE
				data6_o <= "100110";	--PRAZDNE
				data5_o <= "100110";	--PRAZDNE
				data4_o <= "100110";	--PRAZDNE
				data3_o <= "100110";	--PRAZDNE
				data2_o <= "100110";	--PRAZDNE
				data1_o <= "100110";	--PRAZDNE
				data0_o <= "100110";	--PRAZDNE
				
				decp_o  <= "00000000";	--bodky(PRAZDNE)
				               
                
                
        end case;
    end process p_data_divider;

end architecture Behavioral;
