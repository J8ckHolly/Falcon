----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
------------------- Mux 2C--------------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions Verified--------------------
----------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX2C is
    port(
        cnt: in std_logic;
        new_data : in std_logic_vector(30 downto 0);
        recycled_data : in std_logic_vector(30 downto 0);
        data_out: out std_logic_vector(30 downto 0)
    );
end entity;

architecture beh of MUX2C is

    begin
        data_out <= recycled_data when cnt = '1'
        else new_data;

end architecture;