--Full Adder
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
entity FA is
   port(A, B, Cin : in std_logic;
         Sum, Cout : out std_logic);
end FA;
 
architecture bhv of FA is
begin
   Sum <= (A xor B) xor Cin;
   Cout <= (A and (B or Cin)) or (Cin and B);
end bhv;
