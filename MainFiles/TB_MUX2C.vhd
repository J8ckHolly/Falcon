----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------TB Mux 2C--------------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions Verified--------------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_MUX2C is
end entity;

architecture beh of TB_MUX2C is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';

    signal mux_out, recycled_data, Zin: std_logic_vector(30 downto 0);
    signal cnt: std_logic := '1';
    
    

    
    begin
        --radix signal sim:/montymul_tb/P unsigned
        Clk <= not Clk after ClockPeriod/2;

        reg : entity work.MUX2C
        port map(cnt => cnt, new_data=>Zin,data_out=>mux_out,recycled_data=>recycled_data);

        process is 
        begin
            cnt <='0';
            Zin <=  "0000000000000000000000000000000";
            wait for 10ns;
            cnt <='1';
            recycled_data <=  "0000000000000000000000000000001";
            wait for 10ns;
            cnt <='0';
            Zin <=  "0000000000000000000000000000010";
            wait for 10ns;
            cnt <='1';
            recycled_data <=  "0000000000000000000000000000011";
            wait for 10ns;

            

        wait;
    end process;

end architecture;