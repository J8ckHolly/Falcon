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
        generic map(K =>4)
        port map(u => u, b => b);

        --radix signal sim:/montymul_tb/P unsigned
        clk <= not clk after ClockPeriod/2;

        process is
            begin
                u <= "0000000000";
                wait for 10 ns;
                u <= "0000000001";
                wait for 10 ns;
                u <= "0000000010";
                wait for 10 ns;
                u <= "0000000011";
                wait for 10 ns;
                u <= "0000000100";
                wait for 10 ns;
                u <= "0000000101";
                wait for 10 ns;
                u <= "0000000110";
                wait for 10 ns;
                u <= "0000000111";
                wait for 10 ns;
                u <= "0000001000";
                wait for 10 ns;
                u <= "0000001001";
                wait for 10 ns;
            
            
        end process;
end architecture;



