library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_a is 
    port(
        rega_input: in std_logic_vector(7 downto 0);
        reset: in std_logic;
        clk: in std_logic;
        rega_output: out std_logic_vector(7 downto 0)
    ) ;
end reg_a;

architecture sim of reg_a is 
begin
    process(clk) is
        begin
        if reset = '1' then
            rega_output <= "00000000";
        elsif clk'event and clk = '1' then 
            rega_output <= rega_input;
        end if;
    end process;
end architecture;