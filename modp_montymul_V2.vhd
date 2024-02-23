--modp_montymul_V2
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modp_montymul_V2 is
    port(
        A,B,P,P0i: in std_logic_vector(30 downto 0);
        clk, rst: in std_logic;
        result: out std_logic_vector(30 downto 0);
    );
end entity;

architecture beh of modp_montymul_V2 is 

signal a_out, b_out: std_logic_vector();

signal p_out_0, p_out_1, p_out_2: std_logic_vector();

begin 
    stage0_Z: entity work.reg_nbit
    port map(
        clk=>clk, 
        rst =>rst, 
        ena =>'1', 
        d=>,  q=>
        );
    
    stage0_P: entity work.reg_nbit
    port map(
        clk=>clk, 
        rst =>rst, 
        ena =>'1', 
        d=>,
        q=>
        );
end architecture; 