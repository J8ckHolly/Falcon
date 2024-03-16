library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port(
        clk: in std_logic;
        rst: in std_logic;
        CNT: out std_logic_vector(3 downto 0)
    );
end entity;

architecture beh of counter is
    signal count: std_logic_vector(0 to 3);
    begin
        process(rst, clk)
        begin
            if(rst = '1') then count <="0000";
            elsif(clk'event and clk = '1') then count <= std_logic_vector(unsigned(count) + 1);
            end if;
        end process;
    CNT <= count;
end architecture;
