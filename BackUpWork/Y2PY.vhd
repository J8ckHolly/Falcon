--Simpler Component Breakdown to use in modp_ninv31
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Y2PY is 
    port(
        Yin, P: in std_logic_vector(31 downto 0);
        Yout: out std_logic_vector(31 downto 0)
    );
end Y2PY;

architecture behavior of Y2PY is

    component PWM32Q is
        port(
            X,Y : in std_logic_vector(31 downto 0);
            P : out std_logic_vector(63 downto 0)
        );
    end component;

    component BitSub32 is
        port(A,B: in std_logic_vector(31 downto 0);
            S: out std_logic_vector(31 downto 0);
            Cout: out std_logic
            );
    end component;
    signal E0, E1: std_logic_vector(31 downto 0);
    signal Garbage1: std_logic_vector(31 downto 0);

begin
    Mult1: PWM32Q port map(X=>P, Y=>Yin, P(63 downto 32)=>Garbage1, P(31 downto 0)=>E0);
    Sub1: BitSub32 port map(A=>"00000000000000000000000000000010",B=>E0,S=>E1,Cout=>open);
    Mult2: PWM32Q port map(X=>P, Y=>E1, P(63 downto 32)=>Garbage1, P(31 downto 0)=>Yout);
end architecture;
