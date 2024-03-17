----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------TB Mux 4C--------------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions Verified--------------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_MUX4C is
end entity;

architecture beh of TB_MUX4C is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal cnt: std_logic_vector(1 downto 0);
    signal A: std_logic_vector(30 downto 0);
    signal B: std_logic_vector(30 downto 0);

    signal enable_sig0: std_logic;
    signal enable_sig1: std_logic;
    signal enable_sig2: std_logic;
    signal enable_sig3: std_logic;


    --cnt: in std_logic_vector(1 downto 0);
    --data_in : in std_logic_vector(30 downto 0);
    --data_out: out std_logic_vector(30 downto 0);
    --enable_sig0: out std_logic;
    --enable_sig1: out std_logic;
    --enable_sig2: out std_logic;
    --enable_sig3: out std_logic
    begin

        reg : entity work.MUX4C
        port map(cnt => cnt, data_in=>A, data_out=>B, enable_sig0=>enable_sig0, enable_sig1 =>enable_sig1, enable_sig2=>enable_sig2,enable_sig3=> enable_sig3);

        --radix signal sim:/montymul_tb/P unsigned
        Clk <= not Clk after ClockPeriod/2;

        process is 
        begin
            cnt <= "00";
            A <=  "0000000000000000000000000000000" ;
            wait for 10ns;
            cnt <= "01";
            A <=  "0000000000000000000000000000001" ;
            wait for 10ns;
            cnt <= "10";
            A <=  "0000000000000000000000000000010" ;
            wait for 10ns;
            cnt <= "11";
            A <=  "0000000000000000000000000000011" ;
            wait for 10ns;

        wait;
    end process;

end architecture;