--Generic esc Adder, specifically fitted for 32 bit adder
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.numeric_std.all; 


Entity adder32 is
Generic (N:integer :=32);
port ( Cin: in std_logic;
A: In Std_logic_vector(N-1 downto 0);
B: In Std_logic_vector(N-1 downto 0);
S: Out Std_logic_vector(N-1 downto 0);
Cout: out std_logic
);
end adder32;

Architecture adder_structure of adder32 is
    
signal T: Std_logic_vector(N downto 0);

component Fulladder is 
    port(
        A,B,Cin : in std_logic;
        Sum, Cout : out std_logic
    );
end component;

begin
    Cir1: for i in 0 to N-1 generate
    stage0: FullAdder
    port map (A=>A(i), B=>B(i), Cin=>T(i), Sum=>S(i),
    Cout=>T(i+1));
    End generate;
    T(0)<=Cin;
    Cout<=T(N);
end adder_structure;