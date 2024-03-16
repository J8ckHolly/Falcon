library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MM_MUX is
    port(
        cnt: in std_logic;
        new_data : in std_logic_vector(30 downto 0);
        recycled_data : in std_logic_vector(30 downto 0);
        data_out: out std_logic_vector(30 downto 0)
    );
end entity;

architecture beh of MM_MUX is

    begin
        data_out <= new_data when  cnt = '1'
        else  recycled_data;

end architecture;