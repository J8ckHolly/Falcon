library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T17_ClockedProcessTb is
end T17_ClockedProcessTb;

architecture behavior of T17_ClockedProcessTb is
    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms / ClockFrequency;

    signal Clk : std_logic := '1';
    signal nRst : std_logic := '0';
    signal Input : std_logic := '0';
    signal Output : std_logic;

begin
    i_FlipFlop : entity work.T17_FlipFlop
    port map(Clk => Clk, nRst =>nRst, Input=>Input, Output=>Output);

    Clk <= not Clk after ClockPeriod/2;
    Input <= not Input after 10ns;

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