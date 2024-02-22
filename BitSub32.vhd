--32 Bit Subtractor 
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BitSub32 is
    port(A,B: in std_logic_vector(31 downto 0);
        S: out std_logic_vector(31 downto 0);
        Cout: out std_logic
        );
    end BitSub32;

architecture behavior of BitSub32 is 

signal T: std_logic_vector(32 downto 1);

component FA 
port( A, B, Cin : in std_logic;
        Sum, Cout : out std_logic);
end component;

signal nB: std_logic_vector(31 downto 0);

begin
    nB<= not B;
    P0: FA port map(A=>A(0), B=>nB(0),Cin=>'1',Sum=>S(0),Cout=>T(1));
    Cir1: for i in 1 to 31 generate
    Pi: FA
    port map(A=>A(i), B=>nB(i), Cin=>T(i), Sum=>S(i),Cout=>T(i+1));
    end generate;
    
    --T(0)<=Cin;
    Cout<=T(32);
end architecture;
