--Register Test Bench
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MM_Reg_Fin_TB is
end entity;

architecture beh of MM_Reg_Fin_TB is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal ena : std_logic := '1';
    signal A: std_logic_vector(30 downto 0);
    signal reg_addr : std_logic_vector(5 downto 0) := "000001";

    begin

        reg : entity work.Holding_Array
        port map(clk => clk, rst =>rst, ena => ena, data_in =>A, data_out =>open, reg_addr => reg_addr);


        --radix signal sim:/montymul_tb/P unsigned
        Clk <= not Clk after ClockPeriod/2;

        process is 
        begin

            A <=  "0000000000000000000000000000000" ;
            wait for 10ns;
            reg_addr <= "000010";
            A <= "0000000000000000000000000000001";
            wait for (10ns);
            reg_addr <= "000100";
            A <=  "1000000000000000000000001111111" ;
            
            

            

            




            
            
            wait for 100 ns;
            rst <= '1';

        wait;
    end process;

end architecture;