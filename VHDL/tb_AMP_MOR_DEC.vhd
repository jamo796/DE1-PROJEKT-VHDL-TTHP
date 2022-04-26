-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ALP_MOR_DEC is
    -- Entity of testbench is always empty
end entity tb_ALP_MOR_DEC;

architecture testbench of tb_ALP_MOR_DEC is

    -- Local signals
    signal s_reset       : std_logic;
    signal s_data        : std_logic_vector(6 - 1 downto 0);
	signal s_morse		 : std_logic_vector(6 - 1 downto 0);
    signal s_lengh		 : std_logic_vector(3 - 1 downto 0);
begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    
    uut_ALP_MOR_DEC : entity work.ALP_MOR_DEC
        port map(
            reset           => s_reset,
            data_i          => s_data,
            morse_o		    => s_morse,
            lengh_o    		=> s_lengh
        );
  
  
    p_stimulus : process
    	begin

-- SEQUENCE IMPUTS
        s_reset <= '1';
        s_data <= "000000";
        wait for 50 ns;
        s_reset <= '0';

		s_data <= "000000"; --A
		assert ((s_morse = "000010") and (s_lengh = "010"));
        report "Test failed for input combination: A" severity error;


		wait for 100 ns;
		s_data <= "000111"; --H
        
        wait for 100 ns;
        s_data <= "001110"; --O
        
        wait for 100 ns;
        s_data <= "001001"; --J

        wait;
    end process p_stimulus;

end architecture testbench;
