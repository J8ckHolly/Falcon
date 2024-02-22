--modp_mkgm2
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modp_mkgm2 is
    port(p,p0i: in std_logic_vector(31 downto 0);
        g: in std_logic_vector(31 downto 0);
    );
end entity;

architecture beh of modp_mkgm2 is

    begin

        mux: entity work.Multiplexer
        port map()

        modp_multi
end architecture;