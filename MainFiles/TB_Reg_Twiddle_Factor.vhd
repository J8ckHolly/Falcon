----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------TB_Reg_Twiddle_Factor--------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions  Verified-------------------
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_Reg_Twiddle_Factor is
end entity;

architecture beh of TB_Reg_Twiddle_Factor is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal ena : std_logic := '1';
    signal A: std_logic_vector(30 downto 0);
    signal reg_addr : std_logic_vector(5 downto 0) := "000000";
        
    begin

        reg : entity work.Reg_Twiddle_Factor
        port map(clk => clk, rst =>rst, ena => ena, data_in =>A, reg_addr => reg_addr);


        --radix signal sim:/montymul_tb/P unsigned
        Clk <= not Clk after ClockPeriod/2;

        process is 
        begin
            reg_addr <= "000000";
            A <= "0000000000000000000000000000000";
            wait for 10ns;
            reg_addr <= "000010";
            A <= "0000000000000000000000000000010";
            wait for (10ns);
            reg_addr <= "000011";
            A <= "0000000000000000000000000000100";
            wait for (10ns);
            reg_addr <= "000100";
            A <= "0000000000000000000000000001000";
            wait for (10ns);
            ena <= '0';
            reg_addr <= "000101";
            A <= "0000000000000000000000000010000";

            
            wait for 100 ns;
            rst <= '1';

        wait;
    end process;

end architecture;