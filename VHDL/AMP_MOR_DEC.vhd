-- APLHABET TO MORSECODE DECODER
-- name: ALP_MOR_DEC
-- function: ALP1 -> Morse

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- deklarace vstupů a výstupů

entity ALP_MOR_DEC is
    port(
        reset   : in  std_logic;
        data_i	: in  std_logic_vector(5 downto 0); -- 0 1 2 3 4 5
      	morse_o   : out std_logic_vector(5 downto 0); 
      	lengh_o	: out std_logic_vector(2 downto 0)  
    );
end entity ALP_MOR_DEC;

architecture Behavioral of ALP_MOR_DEC is

    begin
            morse_o <= "000010" when (data_i = "000000") else --A
                       "000111" when (data_i = "000001") else --B
                       "000101" when (data_i = "000010") else --C
                       "000011" when (data_i = "000011") else --D
                       "000001" when (data_i = "000100") else --E
                       "001101" when (data_i = "000101") else --F
                       "000001" when (data_i = "000110") else --G
                       "001111" when (data_i = "000111") else --H
                       "000011" when (data_i = "001000") else --I
                       "001000" when (data_i = "001001") else --J
                       "000010" when (data_i = "001010") else --K
                       "001011" when (data_i = "001011") else --L
                       "000000" when (data_i = "001100") else --M
                       "000001" when (data_i = "001101") else --N
                       "000000" when (data_i = "001110") else --O
                       "001001" when (data_i = "001111") else --P
                       "000010" when (data_i = "010000") else --Q
                       "000101" when (data_i = "010001") else --R
                       "000111" when (data_i = "010010") else --S
                       "000000" when (data_i = "010011") else --T
                       "000110" when (data_i = "010100") else --U
                       "001110" when (data_i = "010101") else --V
                       "000100" when (data_i = "010110") else --W
                       "000110" when (data_i = "010111") else --X
                       "000100" when (data_i = "011000") else --Y
                       "000011" when (data_i = "011001") else --Z
                       "000000" when (data_i = "011010") else --0
                       "010000" when (data_i = "011011") else --1
                       "011000" when (data_i = "011100") else --2
                       "011100" when (data_i = "011101") else --3
                       "011110" when (data_i = "011110") else --4
                       "011111" when (data_i = "011111") else --5
                       "001111" when (data_i = "100000") else --6
                       "000111" when (data_i = "100001") else --7
                       "000011" when (data_i = "100010") else --8
                       "000001" when (data_i = "100011") else --9
                       "100101" when (data_i = "100100") else --@
                       "000000";
    
            lengh_o <= "010" when (data_i = "000000") else --A
                       "100" when (data_i = "000001") else --B
                       "100" when (data_i = "000010") else --C
                       "011" when (data_i = "000011") else --D
                       "001" when (data_i = "000100") else --E
                       "100" when (data_i = "000101") else --F
                       "011" when (data_i = "000110") else --G
                       "100" when (data_i = "000111") else --H
                       "010" when (data_i = "001000") else --I
                       "100" when (data_i = "001001") else --J
                       "011" when (data_i = "001010") else --K
                       "100" when (data_i = "001011") else --L
                       "010" when (data_i = "001100") else --M
                       "010" when (data_i = "001101") else --N
                       "011" when (data_i = "001110") else --O
                       "100" when (data_i = "001111") else --P
                       "100" when (data_i = "010000") else --Q
                       "011" when (data_i = "010001") else --R
                       "011" when (data_i = "010010") else --S
                       "001" when (data_i = "010011") else --T
                       "011" when (data_i = "010100") else --U
                       "100" when (data_i = "010101") else --V
                       "011" when (data_i = "010110") else --W
                       "100" when (data_i = "010111") else --X
                       "100" when (data_i = "011000") else --Y
                       "100" when (data_i = "011001") else --Z
                       "101" when (data_i = "011010") else --0
                       "101" when (data_i = "011011") else --1
                       "101" when (data_i = "011100") else --2
                       "101" when (data_i = "011101") else --3
                       "101" when (data_i = "011110") else --4
                       "101" when (data_i = "011111") else --5
                       "101" when (data_i = "100000") else --6
                       "101" when (data_i = "100001") else --7
                       "101" when (data_i = "100010") else --8
                       "101" when (data_i = "100011") else --9
                       "101" when (data_i = "100100") else --@
					   "000";



end architecture Behavioral;


