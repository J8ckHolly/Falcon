--Function in Falcon Generator
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--modp_add(uint32_t a, uint32_t b, uint32_t p){
--uint32_t d;

--d = a + b - p;
--d += p & -(d >> 31);
--return d;}

entity modp_add is 
port( A,B,P: in std_logic_vector(31 downto 0);
    D: out std_logic_vector(31 downto 0)
    );
end entity;

architecture behavior of modp_add is

    component BitAdd32 is
    port(A,B: in std_logic_vector(31 downto 0);
        S: out std_logic_vector(31 downto 0);
        Cout: out std_logic);
    end component;

    component BitSub32 is
        port(A,B: in std_logic_vector(31 downto 0);
            S: out std_logic_vector(31 downto 0);
            Cout: out std_logic
            );
    end component;

    signal temp: std_logic_vector(31 downto 0); --in order not the go over 32 bits, subtract first then add
    signal temp2: std_logic_vector(31 downto 0);
    
    
    begin
        S0: BitSub32 port map(A=>B, B=>P, S=>temp, Cout=>open);
        A0: BitAdd32 port map(A=>A, B=>temp, S=>temp2, Cout=>open);
        temp2<="0000000000000000000000000000000"&temp2(31);
        temp2<= (not temp2) and P;
        A1: BitAdd32 port map(A=>P,B=>temp2,S=>D, Cout=>open);
        
end architecture;

