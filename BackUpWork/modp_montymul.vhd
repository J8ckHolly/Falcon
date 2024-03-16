--Monlty_multiplier
--Jack Holly
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity modp_montymul is
    port(
        A,B,P,P0i: in std_logic_vector(31 downto 0);
        D: out std_logic_vector(31 downto 0)
    );
end modp_montymul;

architecture behavior of modp_montymul is

    component PWM32Q is
        port(
            X,Y : in std_logic_vector(31 downto 0);
            P : out std_logic_vector(63 downto 0)
        );
    end component;

    component BitAdd64 is
        port(A,B: in std_logic_vector(63 downto 0);
            S: out std_logic_vector(63 downto 0);
            Cout: out std_logic
            );
    end component;

    component BitAdd32 is
        port(A,B: in std_logic_vector(31 downto 0);
            S: out std_logic_vector(31 downto 0);
            Cout: out std_logic
            );
    end component;

    component BitSub32 is
        port(A,B: in std_logic_vector(31 downto 0);
            S: out std_logic_vector(31 downto 0);
            Cout: out std_logic
            );
    end component;

    signal E0, E1: std_logic_vector(63 downto 0);
    signal E2,E3: std_logic_vector(31 downto 0);

    begin
        Mult1: PWM32Q port map(X=>A,Y=>B,P=>E0);
        Mult2: PWM32Q port map(X=>E0(31 downto 0), Y=>P0i, P=>E1);
        E2 <= '0' & E1(30 downto 0);
        mult3: PWM32Q port map(X=>E2,Y=>P,P=>E1);
        adder1: BitAdd64 port map(A=>E0, B=>E1, S=>E0, Cout=>open);
        E2<=E0(63 downto 32);

        sub1: BitSub32 port map(A=>E2,B=>P,S=>E2, Cout =>open);
        E3<=E2(31 downto 0);
        E3<="0000000000000000000000000000000"&E3(31);
        E3<= not E3 and P;
        adder2: BitAdd32 port map(A=>E3, B=>E2, S=>D, cout=>open);

    end architecture;