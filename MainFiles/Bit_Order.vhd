library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity REV10 is
    generic(
        K : natural := 4
    );
    port(
        u: in std_logic_vector(9 downto 0); --Ask Sam about this, i want 5 downto 0
        b: out std_logic_vector(5 downto 0)
    );
end entity;

architecture behavior of REV10 is 

signal a : std_logic_vector(9 downto 0);

begin
    a <= std_logic_vector(shift_left(unsigned(u), k));

    b(0) <= a(9);
    b(1) <= a(8);
    b(2) <= a(7);
    b(3) <= a(6);
    b(4) <= a(5);
    b(5) <= a(4);
    
end architecture;