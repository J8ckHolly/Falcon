--Experimental Point Wise Multiplier for 32 bits
--Jack Holly


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM32 is 
port(
    A,B: in std_logic_vector(31 downto 0);
    P: out std_logic_vector(63 downto 0));
end entity;

architecture behavior of PWM32 is 

component BitAdd32 is
    port(A,B: in std_logic_vector(31 downto 0);
        S: out std_logic_vector(31 downto 0);
        Cout: out std_logic
        );
end component;

type aVarChange is array (natural range<>) of std_logic_vector(31 downto 0);
signal Avar: aVarChange(0 to 31);
signal temp: std_logic_vector(31 downto 0);
--type Array_type is array (integer range <>) of integer;
--signal MyUnconArray : Array_type (0 to 3);
--signal E: std_logic_vector(31 downto 0);
--signal D: std_logic_vector(31 downto 0);

begin
    temp <= ("11111111111111111111111111111111" and A) when B(0) = '1' else
        ("00000000000000000000000000000000" and A) when B(0) = '0' else
        "11111111111111111111111111111111";
    
    --aVarGen: for i in 0 to 31 generate
    --    Avar(i) <= (others => std_logic(B(i)));
    --    Avar(i) <= A and Avar(i);
    --end generate;

    --Dgen: for i in 1 to 31 generate
        --D(i-1)<=A(i) and B(0);
    --end generate;
end architecture;