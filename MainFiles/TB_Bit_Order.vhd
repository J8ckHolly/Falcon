----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------TB_Bit_Order-----------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions  Verified-------------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_Bit_Order_Func is
end entity;

architecture beh of TB_Bit_Order_Func is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';

    signal u: std_logic_vector(9 downto 0);
    signal b: std_logic_vector(5 downto 0);
    begin
        Bit_Func : entity work.Bit_Order_Func
        port map(u => u, b => b);

        --radix signal sim:/montymul_tb/P unsigned
        clk <= not clk after ClockPeriod/2;

        process is
            begin
                u <= " 0000000000 ";
                wait for 10 ns;
                u <= " 0000000001 ";
                wait for 10 ns;
                u <= " 0000000010 ";
                wait for 10 ns;
                u <= " 0000000011 ";
                wait for 10 ns;
                u <= " 0000000100 ";
                wait for 10 ns;
                u <= " 0000000101 ";
                wait for 10 ns;
                u <= " 0000000110 ";
                wait for 10 ns;
                u <= " 0000000111 ";
                wait for 10 ns;
                u <= " 0000001000 ";
                wait for 10 ns;
                u <= " 0000001001 ";
                wait for 10 ns;
                u <= " 0000001010 ";
                wait for 10 ns;
                u <= " 0000001011 ";
                wait for 10 ns;
                u <= " 0000001100 ";
                wait for 10 ns;
                u <= " 0000001101 ";
                wait for 10 ns;
                u <= " 0000001110 ";
                wait for 10 ns;
                u <= " 0000001111 ";
                wait for 10 ns;
                u <= " 0000010000 ";
                wait for 10 ns;
                u <= " 0000010001 ";
                wait for 10 ns;
                u <= " 0000010010 ";
                wait for 10 ns;
                u <= " 0000010011 ";
                wait for 10 ns;
                u <= " 0000010100 ";
                wait for 10 ns;
                u <= " 0000010101 ";
                wait for 10 ns;
                u <= " 0000010110 ";
                wait for 10 ns;
                u <= " 0000010111 ";
                wait for 10 ns;
                u <= " 0000011000 ";
                wait for 10 ns;
                u <= " 0000011001 ";
                wait for 10 ns;
                u <= " 0000011010 ";
                wait for 10 ns;
                u <= " 0000011011 ";
                wait for 10 ns;
                u <= " 0000011100 ";
                wait for 10 ns;
                u <= " 0000011101 ";
                wait for 10 ns;
                u <= " 0000011110 ";
                wait for 10 ns;
                u <= " 0000011111 ";
                wait for 10 ns;
                u <= " 0000100000 ";
                wait for 10 ns;
                u <= " 0000100001 ";
                wait for 10 ns;
                u <= " 0000100010 ";
                wait for 10 ns;
                u <= " 0000100011 ";
                wait for 10 ns;
                u <= " 0000100100 ";
                wait for 10 ns;
                u <= " 0000100101 ";
                wait for 10 ns;
                u <= " 0000100110 ";
                wait for 10 ns;
                u <= " 0000100111 ";
                wait for 10 ns;
                u <= " 0000101000 ";
                wait for 10 ns;
                u <= " 0000101001 ";
                wait for 10 ns;
                u <= " 0000101010 ";
                wait for 10 ns;
                u <= " 0000101011 ";
                wait for 10 ns;
                u <= " 0000101100 ";
                wait for 10 ns;
                u <= " 0000101101 ";
                wait for 10 ns;
                u <= " 0000101110 ";
                wait for 10 ns;
                u <= " 0000101111 ";
                wait for 10 ns;
                u <= " 0000110000 ";
                wait for 10 ns;
                u <= " 0000110001 ";
                wait for 10 ns;
                u <= " 0000110010 ";
                wait for 10 ns;
                u <= " 0000110011 ";
                wait for 10 ns;
                u <= " 0000110100 ";
                wait for 10 ns;
                u <= " 0000110101 ";
                wait for 10 ns;
                u <= " 0000110110 ";
                wait for 10 ns;
                u <= " 0000110111 ";
                wait for 10 ns;
                u <= " 0000111000 ";
                wait for 10 ns;
                u <= " 0000111001 ";
                wait for 10 ns;
                u <= " 0000111010 ";
                wait for 10 ns;
                u <= " 0000111011 ";
                wait for 10 ns;
                u <= " 0000111100 ";
                wait for 10 ns;
                u <= " 0000111101 ";
                wait for 10 ns;
                u <= " 0000111110 ";
                wait for 10 ns;
                u <= " 0000111111 ";
                wait for 10 ns;
            
            
        end process;
end architecture;



