--n bit register
--Sam Coulon

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_nbit is 
    generic(
        n       : integer := 32
    );
    port(
        clk: in std_logic;
        rst: in std_logic;
        ena: in std_logic;

        d: in std_logic_vector(n-1 downto 0);
        q: out std_logic_vector(n-1 downto 0)
    );
end entity;

architecture rt1 of reg_nbit is 
begin
    process(clk)
    begin
        if(rising_edge(clk)) then 
            if(rst = '1') then
                q <= (others => '0');
            else
                if(ena = '1') then
                    q <= d;
                end if;
            end if;
        end if;
    end process;
end architecture;