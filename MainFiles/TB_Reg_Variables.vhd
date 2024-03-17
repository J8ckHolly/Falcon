----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------Reg_Variables----------------------
----------------Testing With Mux Conf.--------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions  Verified-------------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_Reg_Variables is
end entity;

architecture beh of TB_Reg_Variables is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal ena : std_logic := '1';

    signal Zin: std_logic_vector(30 downto 0);
    signal link_mux_reg_out : std_logic_vector(30 downto 0);
    signal link_mux_reg_in : std_logic_vector(30 downto 0);

    signal cnt : std_logic;

    begin

        reg : entity work.Reg_Variables
        port map(clk => clk, rst =>rst, ena => ena, data_in =>link_mux_reg_in, data_out =>link_mux_reg_out);

        mux : entity work.MUX2C
        port map(cnt => cnt, new_data=>Zin, data_out=>link_mux_reg_in, recycled_data=>link_mux_reg_out);

        --radix signal sim:/montymul_tb/P unsigned
        clk <= not clk after ClockPeriod/2;

        process is 
        begin
            rst <= '1';
            wait for 10 ns;
            rst <= '0';
            cnt <= '0';
            Zin <=  "0000000000000000000000000000010" ;
            wait for 10ns;
            Zin <= "0000000000000000000000000000100";
            wait for (10ns);
            Zin <= "0000000000000000000000001111000" ;
            wait for (10ns);
            Zin <= "0000000000000000100000000000000" ;
            wait for (10ns);
            cnt <= '1';
            wait for (40ns);
            ena <= '0';
            
        
            
            
            wait for 100 ns;
            rst <= '1';
            

        wait;
    end process;

end architecture;