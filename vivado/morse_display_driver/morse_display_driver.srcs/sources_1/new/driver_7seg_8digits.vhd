------------------------------------------------------------
--
-- Driver for 8-digit 7-segment display.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

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
entity driver_7seg_8digits is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;
		
        data_i  : in std_logic_vector(5 downto 0);
				
        dp_o    : out std_logic;
        seg_o   : out std_logic_vector(6 downto 0);
        dig_o   : out std_logic_vector(7 downto 0)
    );
end entity driver_7seg_8digits;

------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------
architecture Behavioral of driver_7seg_8digits is

    -- Internal clock enable
    signal s_en  : std_logic;
	
    -- Internal 4-bit counter for multiplexing 8 digits
    signal s_cnt : std_logic_vector(2 downto 0);
	
    -- Internal 4-bit value for 7-segment decoder
    signal s_hex : std_logic_vector(5 downto 0);
    
    
    signal s_data0  :   std_logic_vector(5 downto 0);
    signal s_data1  :   std_logic_vector(5 downto 0);
    signal s_data2  :   std_logic_vector(5 downto 0);
    signal s_data3  :   std_logic_vector(5 downto 0);
    signal s_data4  :   std_logic_vector(5 downto 0);
    signal s_data5  :   std_logic_vector(5 downto 0);	
    signal s_data6  :   std_logic_vector(5 downto 0);	
    signal s_data7  :   std_logic_vector(5 downto 0);	
    
    signal s_dp :   std_logic_vector(7 downto 0);
    
    
    
    
    

begin


    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            -- FOR SIMULATION, CHANGE THIS VALUE TO 4
            -- FOR IMPLEMENTATION, KEEP THIS VALUE TO 400,000
            g_MAX => 4
        )
        port map(
            clk   => clk, 
            reset => reset,
            ce_o  => s_en
        );



    --------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 4-bit
    -- down counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
           g_CNT_WIDTH => 3 
        )
        port map(
            en_i=>s_en,
            cnt_up_i=> '0',
            reset=>reset,
            clk=>clk,
            cnt_o=>s_cnt 
        );



    --------------------------------------------------------
    -- Instance (copy) of hex_7seg entity performs a 7-segment
    -- display decoder
    hex2seg : entity work.hex_7seg
        port map(
            hex_i => s_hex,
            seg_o => seg_o
        );
        
        
    --------------------------------------------------------
    -- Instance (copy) of hex_7seg entity performs a 7-segment
    -- display decoder
    dataDiv : entity work.data_divider
        port map(
                     
           data_i => data_i,
           
           data7_o => s_data7,
           data6_o => s_data6,
           data5_o => s_data5,
           data4_o => s_data4,
           data3_o => s_data3,
           data2_o => s_data2,
           data1_o => s_data1,
           data0_o => s_data0,
           
           decp_o => s_dp
           );
		
	

    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point 
    -- signal, and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                s_hex <= "010001";
                dp_o  <= s_dp(0);
                dig_o <= "11111110";
            else
                case s_cnt is
				
					--MORESEOVA ABECEDA NA SEGMENTOVKACH
				
                    when "111" =>
                        s_hex <= s_data7;
                        dp_o  <= s_dp(7);
                        dig_o <= "01111111";	--PRVA SEGMENTOVKA

                    when "110" =>
                        s_hex <= s_data6;
                        dp_o  <= s_dp(6);
                        dig_o <= "10111111";	--DRUHA SEGMENTOVKA

                    when "101" =>
                        s_hex <= s_data5;
                        dp_o  <= s_dp(5);
                        dig_o <= "11011111";	--TRETIA SEGMENTOVKA

                    when "100" =>
                        s_hex <= s_data4;
                        dp_o  <= s_dp(4);
                        dig_o <= "11101111";	--STVRTA SEGMENTOVKA
						
					when "011" =>
                        s_hex <= s_data3;
                        dp_o  <= s_dp(3);
                        dig_o <= "11110111";	--PIATA SEGMENTOVKA

                    when "010" =>
                        s_hex <= s_data2;
                        dp_o  <= s_dp(2);
                        dig_o <= "11111011";	--SIESTA SEGMENTOVKA
						
					--PRAZDNA SEGMENTOVKA
					when "001" =>
                        s_hex <= s_data1;	
                        dp_o  <= s_dp(1);		--decimal point tu nikdy nesvieti
                        dig_o <= "11111101";	--SIEDMA SEGMENTOVKA

					--PISMENO ABECEDY NA POSLEDNEJ SEGMENTOVKE
					when others =>
                        s_hex <= s_data0;	
                        dp_o  <= s_dp(0);		--decimal point tu nikdy nesvieti
                        dig_o <= "11111110";	--OSMA SEGMENTOVKA
                end case;
            end if;
        end if;
    end process p_mux;

end architecture Behavioral;
