library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T20_fsm is
    end T20_fsm;
    
    architecture behavior of T20_fsm is
        constant ClockFrequency : integer := 100e6;
        constant ClockPeriod : time := 1000ms / ClockFrequency;
    
        signal Clk : std_logic := '1';
        signal nRst : std_logic := '0';
        
    begin
        i_TrafficLights : entity work.fsm
        port map(clk => Clk, nRst => nRst);

        clk <= not clk after ClockPeriod /2;

        process
        begin
            wait until rising_edge(clk);
            wait until rising_edge(clk);

            nRst <= '1';
            wait;
        end process;
end architecture;
    