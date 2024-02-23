library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T19_MUXT is
end T19_MUXT;

architecture behavior of T19_MUXT is
    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms / ClockFrequency;

    signal Clk : std_logic := '1';
    signal nRst : std_logic := '0';
    signal Input : std_logic_vector(7 downto 0) := "11010111";
    signal Output : std_logic_vector(7 downto 0);

begin
    i_FlipFlop : entity work.mux
    port map(clk => Clk, reset =>nRst, rega_input=>Input, rega_output=>Output);

    Clk <= not Clk after ClockPeriod/2;

    process is 
    begin
        nRst <= '1';
        wait for 10 ns;
        nRst <= '0';
        wait for 20ns;
        Input <= "10111111";
        wait for 6ns;
        nRst <= '1';
        wait for 20 ns;
        wait for 100 ns;
        nRst <= '0';

        wait;
    end process;

end architecture;