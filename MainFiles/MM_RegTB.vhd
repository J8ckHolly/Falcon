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

            A <=  "0000000000000000000000000000000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000000111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000001111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000010111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000011111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000100111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000101111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000110111" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111000" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111001" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111010" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111011" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111100" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111101" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111110" ;
            wait for 10ns;
            A <=  "0000000000000000000000000111111" ;
            wait for 10ns;
            A <=  "0000000000000000000000001000000" ;
            wait for (10ns);
            cnt <= '0';
            A <=  "1000000000000000000000001111111" ;
            
            

            

            




            
            
            wait for 100 ns;
            rst <= '1';

        wait;
    end process;

end architecture;