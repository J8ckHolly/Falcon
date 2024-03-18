----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------TB Mux 4C--------------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions Verified--------------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_Overall_system is
end entity;

architecture beh of TB_Overall_system is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal X1, X2,g, ig, P, P0i: std_logic_vector(30 downto 0);
    

    begin
        twiddle_generator : entity work.system
    port map(clk => clk, rst =>rst, p_Zin =>P, p0i_Zin => P0i, g_Zin => g, ig_zin => ig, X1_Zin => x1, X2_Zin =>x2);

    --radix signal sim:/montymul_tb/P unsigned
    clk <= not clk after ClockPeriod/2;

    process is 
    begin
        wait for 10ns;
        g <=  "1101000011010100000111011000010";
        ig <= "1000011010111000001011011101000";
        P <= "1111111111111111101100000000001";
        P0i <= "1111001101111111101011111111111";        
        
        wait for 10ns;
        g <= "0101110010101010010011000100001";
        ig <= "1000011011101001111100110000001";
        P <= "1111111111111101001000000000001";
        P0i <= "1101110111111101000111111111111";  
        
        wait for 10ns;
        g <= "0101110111001011101111011010000";
        ig <= "0110111101100011101100111111011";
        P <= "1111111111111101000100000000001";
        P0i <= "1011011111111100101111111111111";  

        wait for 10ns;
        g <= "0101111010111010101011000100110";
        ig <= "0011010001001011000010010110110";
        P <= "1111111111111100110000000000001";
        P0i <= "1011011111111100101111111111111";
        
        wait for 10ns;
        X1 <= "0000000000000000010011111111111";
        X2 <= "0000000000000000010011111111111";

        wait for 10ns;
        X1 <= "0000000000000010110111111111111";
        X2 <= "0000000000000010110111111111111";

        wait for 10ns;
        X1 <= "0000000000000010111011111111111";
        X2 <= "0000000000000010111011111111111";

        wait for 10ns;
        X1 <= "0000000000000011001111111111111";
        X2 <= "0000000000000011001111111111111";


        wait;
        end process;


end architecture;