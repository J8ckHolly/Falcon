----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
------------------Mux 4C----------------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functionality Verified----------------
----------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX4C is
    port(
        cnt: in std_logic_vector(1 downto 0);
        data_in : in std_logic_vector(30 downto 0);
        data_out: out std_logic_vector(30 downto 0);
        enable_sig0: out std_logic;
        enable_sig1: out std_logic;
        enable_sig2: out std_logic;
        enable_sig3: out std_logic
    );
end entity;

architecture beh of MUX4C is

    begin
        process(cnt)
        begin
            case cnt is
                when "00" => enable_sig0 <= '1';
                enable_sig1 <= '0';
                enable_sig2 <= '0';
                enable_sig3 <= '0';

                when "01" => enable_sig0 <= '0';
                enable_sig1 <= '1';
                enable_sig2 <= '0';
                enable_sig3 <= '0';

                when "10" => enable_sig0 <= '0';
                enable_sig1 <= '0';
                enable_sig2 <= '1';
                enable_sig3 <= '0';

                when "11" => enable_sig0 <= '0';
                enable_sig1 <= '0';
                enable_sig2 <= '0';
                enable_sig3 <= '1';
            when others => enable_sig0 <= '0';
                enable_sig1 <= '0';
                enable_sig2 <= '0';
                enable_sig3 <= '0';
            end case;
            data_out <= data_in;
        end process;

end architecture;