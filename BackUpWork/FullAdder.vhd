--Full Adder
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Fulladder is 
    port(
        A,B,Cin : in std_logic;
        Sum, Cout : out std_logic
    );
    end entity;

architecture Behavior of Fulladder is 
    begin
        Cout <= (A and B) or (B and Cin) or (A and Cin);
        Sum <= A xor B xor Cin;
end Behavior;