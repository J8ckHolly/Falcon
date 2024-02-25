--Register Test Bench
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MM_RegTB is
end entity;

architecture beh of MM_RegTB is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal ena : std_logic := '1';
    signal A: std_logic_vector(30 downto 0);

    signal mux_out, mux_in: std_logic_vector(30 downto 0);
    signal cnt: std_logic := '1';
    begin

        reg : entity work.Register_Array
        port map(clk => clk, rst =>rst, ena => ena, data_in =>mux_out, data_out =>mux_in);
        
        mux : entity work.MM_MUX
        port map(cnt=>cnt, new_data=>A, recycled_data=>mux_in, data_out=>mux_out);


        --radix signal sim:/montymul_tb/P unsigned
        Clk <= not Clk after ClockPeriod/2;

        process is 
        begin

            A <= "1001001110111001101010110100011";
            wait for 10ns;
            A <= "0000111110001011110110111010100";
            wait for 10ns;
            A <= "1001001111000111000010100010001";
            wait for 10ns;
            A <= "1000011000100010111101110111001";        
            
            wait for 10ns;
            A <= "0011001000000100011000111011100";
            wait for 10ns;
            A <= "1100000111011000010100010010100";
            wait for 10ns;
            A <= "0110110111001001101011010001000";
            wait for 10ns;
            A <= "1101100101100010111011010001010";  
            
            wait for 10ns;
            A <= "1011010001100000101101100000101";
            wait for 10ns;
            A <= "1110011110110001010000000100000";
            wait for 10ns;
            A <= "0011100101011001001010000101000";
            wait for 10ns;
            A <= "0111111101000010101010110110010";  

            wait for 10ns;
            A <= "1110010011011001011010111110101";
            wait for 10ns;
            A <= "0000110100011100111000001110111";
            wait for 10ns;
            A <= "0001111010100011100100100010001";
            wait for 10ns;
            A <= "0000110010000110001111111011100";  
            ----
            wait for 10ns;
            A <= "1001001110110001101010110100011";
            wait for 10ns;
            A <= "0000111110000011110110111010100";
            wait for 10ns;
            A <= "1001111101100111000010100010001";
            wait for 10ns;
            A <= "1000111100100010111101110111001";        
            
            wait for 10ns;
            A <= "0011001100000100011000111011100";
            wait for 10ns;
            A <= "1100000111011011010100010010100";
            wait for 10ns;
            A <= "0110110101001001101011010001000";
            wait for 10ns;
            A <= "0111100101100010111011010001010";  
            
            wait for 10ns;
            A <= "1011010001111111101101100000101";
            wait for 10ns;
            A <= "1110011110111111010000000100000";
            wait for 10ns;
            A <= "0011100101011001001010000101111";
            wait for 10ns;
            A <= "0111111101000010101010111110010";  

            wait for 10ns;
            A <= "1110010011011001011011010100101";
            wait for 10ns;
            A <= "0000110100011100100110001110111";
            wait for 10ns;
            A <= "0001111010100011000100100010001";
            

            

            




            
            
            wait for 350 ns;
            rst <= '1';

        wait;
    end process;

end architecture;