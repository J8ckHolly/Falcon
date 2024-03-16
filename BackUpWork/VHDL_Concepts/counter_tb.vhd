library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;

architecture behavior of counter_tb is 

constant ClockFrequency : integer := 100e6;
constant ClockPeriod : time := 1000ms / ClockFrequency;

signal clk : std_logic := '1';
signal rst : std_logic := '0';
signal output: std_logic_vector(3 downto 0);

begin
    counter1: entity work.counter
    port map(clk => clk, rst => rst, CNT => output);

    Clk <= not Clk after ClockPeriod/2;

    process is
    begin
    wait for 30 ns;
    rst <= '1';
    wait for 20 ns;
    rst <= '0';

    wait;
    end process;
end architecture;

