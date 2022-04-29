------------------------------------------------------------
--
-- Template for 7-segment display decoder.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2018-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------
entity hex_7seg is
    port(
        hex_i : in  std_logic_vector(5 downto 0);
        seg_o : out std_logic_vector(6 downto 0)
    );
end entity hex_7seg;

------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture Behavioral of hex_7seg is
begin
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
    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
		
			when "100101" =>
                seg_o <= "1111110"; -- ciarka	
                
            when "100110" =>
                seg_o <= "1111111"; -- prazdno
        
            when "000000" =>
                seg_o <= "0000010"; -- a

            when "000001" =>
                seg_o <= "1100000"; -- b

            when "000010" =>
                seg_o <= "1110010"; -- c

            when "000011" =>
                seg_o <= "1000010"; -- d

            when "000100" =>
                seg_o <= "0110000"; -- E
                
            when "000101" =>
                seg_o <= "0111000"; -- F
                
            when "000110" =>
                seg_o <= "0100001"; -- G
                
            when "000111" =>
                seg_o <= "1101000"; -- H
                
            when "001000" =>
                seg_o <= "0111011"; -- I
                
            when "001001" =>
                seg_o <= "0100111"; -- J
                
            when "001010" =>
                seg_o <= "0101000"; -- K
                
            when "001011" =>
                seg_o <= "1110001"; -- L
                
            when "001100" =>
                seg_o <= "0101010"; -- M
                
            when "001101" =>
                seg_o <= "1101010"; -- N
                
            when "001110" =>
                seg_o <= "1100010"; -- O
                
            when "001111" =>
                seg_o <= "0011000"; -- P
                
            when "010000" =>
                seg_o <= "0001100"; -- Q
                
            when "010001" =>
                seg_o <= "1111010"; -- R
                
            when "010010" =>
                seg_o <= "0100101"; -- S
                
            when "010011" =>
                seg_o <= "1110000"; -- T
                
            when "010100" =>
                seg_o <= "1100011"; -- U
                
            when "010101" =>
                seg_o <= "1010101"; -- V
                
            when "010110" =>
                seg_o <= "1010100"; -- W
                
            when "010111" =>
                seg_o <= "1101011"; -- X
                
            when "011000" =>
                seg_o <= "1000100"; -- Y
				
            when "011001" =>
                seg_o <= "0010011"; -- Z
				
            when "100100" =>
                seg_o <= "0111000"; -- @
				
            when "011010" =>
                seg_o <= "0000001"; -- 0
				
            when "011011" =>
                seg_o <= "1001111"; -- 1
				
            when "011100" =>
                seg_o <= "0010010"; -- 2
				
            when "011101" =>
                seg_o <= "0000110"; -- 3
				
            when "011110" =>
                seg_o <= "1001100"; -- 4
				
            when "011111" =>
                seg_o <= "0100100"; -- 5
				
            when "100000" =>
                seg_o <= "0100000"; -- 6
				
            when "100001" =>
                seg_o <= "0001111"; -- 7
				
            when "100010" =>
                seg_o <= "0000000"; -- 8
				
            when "100011" =>
                seg_o <= "0000100"; -- 9
						   
				
            when others =>
                seg_o <= "1111111"; -- prazdno
                
                
                
        end case;
    end process p_7seg_decoder;

end architecture Behavioral;
