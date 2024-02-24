--modp_montymul_V2 Test Bench
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity montymul_tb is
end entity;

architecture beh of montymul_tb is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms / ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal A, B, P, P0i, result: std_logic_vector(30 downto 0);

begin
    montymul : entity work.modp_montymul_V2
    port map(clk => clk, rst =>rst, A =>A, B=>B, P=>P, P0i =>P0i, result=> result);
    

    Clk <= not Clk after ClockPeriod/2;

    process is 
    begin
        nRst <= '1';

        --wait for 20 ns;
        --Input <= '1';
        --wait for 22ns;
        --Input <='0';
        --wait for 6ns;
        --Input <= '1';
        --wait for 20 ns;

        
        wait for 100 ns;
        nRst <= '0';

        wait;
    end process;

end architecture;