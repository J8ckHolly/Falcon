--Multiplexer
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4 is
port(
    state         : in std_logic_vector(2 downto 0);
    Zin1, Zin2    : in std_logic_vector(31 downto 0);
    Reg_output1, Reg_output2   : in std_logic_vector(31 downto 0);
    Mux_output1, Mux_output2   : out std_logic_vector(31 downto 0)
  );
  
end mux4;
architecture rtl of mux4 is

begin
p_mux : process(state)
begin
  case state is
    when "000" =>
        Mux_output1 <= Zin1;
        Mux_output2 <= Zin2;
    when "001" =>
        Mux_output1 <= Reg_output1;
        Mux_output2 <= Reg_output2;
    when "010" =>
        Mux_output1 <= Reg_output1;
        Mux_output2 <= Zin2;
    when "011" =>
        Mux_output1 <= Zin1;
        Mux_output2 <= Reg_output1;
    when "100" =>
        Mux_output1 <= Zin1;
        Mux_output2 <= Zin2;
    when "101" =>
        Mux_output1 <= Reg_output1;
        Mux_output2 <= Reg_output2;
    when "110" =>
        Mux_output1 <= Reg_output1;
        Mux_output2 <= Zin2;
    when others => Mux_output1 <= Zin1;
  end case;
end process p_mux;
end rtl;