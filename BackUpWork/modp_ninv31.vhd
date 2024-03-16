--Function For Producing Inverse Prime
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modp_ninv31 is 
port(P: in std_logic_vector(31 downto 0);
    P0i: out std_logic_vector(31 downto 0)
    );
end modp_ninv31;

architecture behavior of modp_ninv31 is 

component BitSub32 is
    port(A,B: in std_logic_vector(31 downto 0);
        S: out std_logic_vector(31 downto 0);
        Cout: out std_logic
        );
end component;

component Y2PY is 
    port(
        Yin, P: in std_logic_vector(31 downto 0);
        Yout: out std_logic_vector(31 downto 0)
    );
end component;

signal Y1,Y2,Y3,Y4,Y5: std_logic_vector(31 downto 0);

begin
    Sub1: BitSub32 port map(A=>"00000000000000000000000000000010",B=>P,S=>Y1,Cout=>open);
    Y2PY1: Y2PY port map(Yin=>Y1,P=>P,Yout=>Y2);
    Y2PY2: Y2PY port map(Yin=>Y2,P=>P,Yout=>Y3);
    Y2PY3: Y2PY port map(Yin=>Y3,P=>P,Yout=>Y4);
    Y5 <= not Y4;
    P0i <= Y5 and "01111111111111111111111111111111";
end architecture;


