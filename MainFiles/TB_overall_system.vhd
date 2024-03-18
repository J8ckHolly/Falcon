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
        g <=  "0000111110001011110110111010100";
        ig <= "1110011110001010100101011011111";
        P <= "1001001111000111000010100010001";
        P0i <= "1000011000100010111101110111001";        
        
        wait for 10ns;
        g <= "1100000111011000010100010010100";
        ig <= "1110011110001010100101010100111";
        P <= "0110110111001001101011010001000";
        P0i <= "1101100101100010111011010001010";  
        
        wait for 10ns;
        g <= "1110011110110001010000000100000";
        ig <= "1110010010001010100101011011111";
        P <= "0011100101011001001010000101000";
        P0i <= "0111111101000010101010110110010";  

        wait for 10ns;
        g <= "0000110100011100111000001110111";
        ig <= "0000011110001010100101011011111";
        P <= "0001111010100011100100100010001";
        P0i <= "0000110010000110001111111011100";
        
        wait for 10ns;
        X1 <= "1110010011011001011010111110101";
        X2 <= "1010011111000010100101011011111";

        wait for 10ns;
        X1 <= "1001001110111001101010110100011";
        X2 <= "1110011111000010100101011011111";

        wait for 10ns;
        X1 <= "0011001000000100011000111011100";
        X2 <= "1110010011000010100101011011111";

        wait for 10ns;
        X1 <= "1011010001100000101101100000101";
        X2 <= "0110010111000010100101011011111";


        wait;
        end process;


end architecture;