--Function for falcon Generation
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modp_R is
    port(
        p : in std_logic_vector(31 downto 0);
        Result : out std_logic_vector(31 downto 0)
    );
end entity;

architecture behavior of modp_R is

    component BitSub32 is
        port(A,B: in std_logic_vector(31 downto 0);
            S: out std_logic_vector(31 downto 0);
            Cout: out std_logic
            );
    end component;

begin
    A0: Bitsub32 port map(A=>"10000000000000000000000000000000", B=>p, S=>Result, Cout => open);

end architecture;