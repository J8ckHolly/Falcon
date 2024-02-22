--Point Wise Multiplier for 32 bits
--Jack Holly 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM32Q is
    port(
        X,Y : in std_logic_vector(31 downto 0);
        P : out std_logic_vector(63 downto 0)
    );
end entity;

architecture behavior of PWM32Q is

signal M0, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, M13, M14, M15, M16, M17, M18, M19, M20, M21, M22, M23, M24, M25, M26, M27, M28, M29, M30: std_logic_vector(31 downto 0);
signal E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30: std_logic_vector(31 downto 0);                                   
signal D: std_logic_vector(30 downto 0);

component adder32
port( Cin: in std_logic;
      A: in std_logic_vector(31 downto 0);
      B: in std_logic_vector(31 downto 0);
      S: out std_logic_vector(31 downto 0);
      Cout: out std_logic
);
end component;

begin
    Cir1: for i in 0 to 31 generate
    E0(i)<=X(i) and Y(1);
    E1(i)<=X(i) and Y(2);
    E2(i)<=X(i) and Y(3);
    E3(i)<=X(i) and Y(4);
    E4(i)<=X(i) and Y(5);
    E5(i)<=X(i) and Y(6);
    E6(i)<=X(i) and Y(7);
    E7(i)<=X(i) and Y(8);
    E8(i)<=X(i) and Y(9);
    E9(i)<=X(i) and Y(10);
    E10(i)<=X(i) and Y(11);
    E11(i)<=X(i) and Y(12);
    E12(i)<=X(i) and Y(13);
    E13(i)<=X(i) and Y(14);
    E14(i)<=X(i) and Y(15);
    E15(i)<=X(i) and Y(16);
    E16(i)<=X(i) and Y(17);
    E17(i)<=X(i) and Y(18);
    E18(i)<=X(i) and Y(19);
    E19(i)<=X(i) and Y(20);
    E20(i)<=X(i) and Y(21);
    E21(i)<=X(i) and Y(22);
    E22(i)<=X(i) and Y(23);
    E23(i)<=X(i) and Y(24);
    E24(i)<=X(i) and Y(25);
    E25(i)<=X(i) and Y(26);
    E26(i)<=X(i) and Y(27);
    E27(i)<=X(i) and Y(28);
    E28(i)<=X(i) and Y(29);
    E29(i)<=X(i) and Y(30);
    E30(i)<=X(i) and Y(31);
    end generate;
    
    Cir2: for i in 1 to 31 generate
    D(i-1)<=X(i) and Y(0);
    end generate;
    P(0)<=X(0) and Y(0);

    unit0:adder32
port map(A=>E0,B(31)=>'0', B(30 downto 0)=>D, Cin=>'0',S(0)=>P(1),S(31 downto 1)=>M1(30 downto 0), Cout=>M1(31));
unit1:adder32
port map(A=>E1,B=>M1,Cin=>'0',S(0)=>P(2),S(31 downto 1)=>M2(30 downto 0), Cout=>M2(31));
unit2:adder32
port map(A=>E2,B=>M2,Cin=>'0',S(0)=>P(3),S(31 downto 1)=>M3(30 downto 0), Cout=>M3(31));
unit3:adder32
port map(A=>E3,B=>M3,Cin=>'0',S(0)=>P(4),S(31 downto 1)=>M4(30 downto 0), Cout=>M4(31));
unit4:adder32
port map(A=>E4,B=>M4,Cin=>'0',S(0)=>P(5),S(31 downto 1)=>M5(30 downto 0), Cout=>M5(31));
unit5:adder32
port map(A=>E5,B=>M5,Cin=>'0',S(0)=>P(6),S(31 downto 1)=>M6(30 downto 0), Cout=>M6(31));
unit6:adder32
port map(A=>E6,B=>M6,Cin=>'0',S(0)=>P(7),S(31 downto 1)=>M7(30 downto 0), Cout=>M7(31));
unit7:adder32
port map(A=>E7,B=>M7,Cin=>'0',S(0)=>P(8),S(31 downto 1)=>M8(30 downto 0), Cout=>M8(31));
unit8:adder32
port map(A=>E8,B=>M8,Cin=>'0',S(0)=>P(9),S(31 downto 1)=>M9(30 downto 0), Cout=>M9(31));
unit9:adder32
port map(A=>E9,B=>M9,Cin=>'0',S(0)=>P(10),S(31 downto 1)=>M10(30 downto 0), Cout=>M10(31));
unit10:adder32
port map(A=>E10,B=>M10,Cin=>'0',S(0)=>P(11),S(31 downto 1)=>M11(30 downto 0), Cout=>M11(31));
unit11:adder32
port map(A=>E11,B=>M11,Cin=>'0',S(0)=>P(12),S(31 downto 1)=>M12(30 downto 0), Cout=>M12(31));
unit12:adder32
port map(A=>E12,B=>M12,Cin=>'0',S(0)=>P(13),S(31 downto 1)=>M13(30 downto 0), Cout=>M13(31));
unit13:adder32
port map(A=>E13,B=>M13,Cin=>'0',S(0)=>P(14),S(31 downto 1)=>M14(30 downto 0), Cout=>M14(31));
unit14:adder32
port map(A=>E14,B=>M14,Cin=>'0',S(0)=>P(15),S(31 downto 1)=>M15(30 downto 0), Cout=>M15(31));
unit15:adder32
port map(A=>E15,B=>M15,Cin=>'0',S(0)=>P(16),S(31 downto 1)=>M16(30 downto 0), Cout=>M16(31));
unit16:adder32
port map(A=>E16,B=>M16,Cin=>'0',S(0)=>P(17),S(31 downto 1)=>M17(30 downto 0), Cout=>M17(31));
unit17:adder32
port map(A=>E17,B=>M17,Cin=>'0',S(0)=>P(18),S(31 downto 1)=>M18(30 downto 0), Cout=>M18(31));
unit18:adder32
port map(A=>E18,B=>M18,Cin=>'0',S(0)=>P(19),S(31 downto 1)=>M19(30 downto 0), Cout=>M19(31));
unit19:adder32
port map(A=>E19,B=>M19,Cin=>'0',S(0)=>P(20),S(31 downto 1)=>M20(30 downto 0), Cout=>M20(31));
unit20:adder32
port map(A=>E20,B=>M20,Cin=>'0',S(0)=>P(21),S(31 downto 1)=>M21(30 downto 0), Cout=>M21(31));
unit21:adder32
port map(A=>E21,B=>M21,Cin=>'0',S(0)=>P(22),S(31 downto 1)=>M22(30 downto 0), Cout=>M22(31));
unit22:adder32
port map(A=>E22,B=>M22,Cin=>'0',S(0)=>P(23),S(31 downto 1)=>M23(30 downto 0), Cout=>M23(31));
unit23:adder32
port map(A=>E23,B=>M23,Cin=>'0',S(0)=>P(24),S(31 downto 1)=>M24(30 downto 0), Cout=>M24(31));
unit24:adder32
port map(A=>E24,B=>M24,Cin=>'0',S(0)=>P(25),S(31 downto 1)=>M25(30 downto 0), Cout=>M25(31));
unit25:adder32
port map(A=>E25,B=>M25,Cin=>'0',S(0)=>P(26),S(31 downto 1)=>M26(30 downto 0), Cout=>M26(31));
unit26:adder32
port map(A=>E26,B=>M26,Cin=>'0',S(0)=>P(27),S(31 downto 1)=>M27(30 downto 0), Cout=>M27(31));
unit27:adder32
port map(A=>E27,B=>M27,Cin=>'0',S(0)=>P(28),S(31 downto 1)=>M28(30 downto 0), Cout=>M28(31));
unit28:adder32
port map(A=>E28,B=>M28,Cin=>'0',S(0)=>P(29),S(31 downto 1)=>M29(30 downto 0), Cout=>M29(31));
unit29:adder32
port map(A=>E29,B=>M29,Cin=>'0',S(0)=>P(30),S(31 downto 1)=>M30(30 downto 0), Cout=>M30(31));
unit30:adder32
port map(A=>E30,B=>M30,Cin=>'0',S(31 downto 0)=>P(62 downto 31),Cout=>P(63));
        
end architecture;