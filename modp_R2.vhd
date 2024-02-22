--Function for falcon Generation
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modp_R2 is
    port(P, P0i: in std_logic_vector(31 downto 0);
        Result: out std_logic_vector(31 downto 0)
        );
end modp_R2;


architecture behavior of modp_R2 is

    component BitAdd32 is
        port(A,B: in std_logic_vector(31 downto 0);
            S: out std_logic_vector(31 downto 0);
            Cout: out std_logic
            );
    end component;

    component modp_R is
        port(
            p : in std_logic_vector(31 downto 0);
            Result : out std_logic_vector(31 downto 0)
        );
    end component;

    component modp_add is 
        port( A,B,P: in std_logic_vector(31 downto 0);
            D: out std_logic_vector(31 downto 0)
            );
    end component;

    component modp_montymul is
        port(
            A,B,P,P0i: in std_logic_vector(31 downto 0);
            D: out std_logic_vector(31 downto 0)
        );
    end component;

        signal E0: std_logic_vector(31 downto 0);

    begin
        modp_1: modp_R port map(p=>P, Result=>E0);
        modadd1: modp_add port map(A=>E0, B=>E0, P=>P, D=>E0);
        ModMultGen: for i in 1 to 5 generate
        ModMult: modp_montymul
        port map(A=>E0, B=>E0,P=>P,P0i=>P0i,D=>E0);
        end generate;

        adder1: BitAdd32 port map(A=>E0,B=>P,S=>E0,Cout=>open);
        Result <= '0' & E0(31 downto 1);


    end architecture;