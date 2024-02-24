--modp_montymul_V2
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modp_montymul_V2 is
    port(
        A,B,P,P0i: in std_logic_vector(30 downto 0);
        clk, rst: in std_logic;
        result: out std_logic_vector(30 downto 0)
    );
end entity;

architecture beh of modp_montymul_V2 is 

signal a_out, b_out: std_logic_vector(30 downto 0);

signal z_out_0, z_out_1, z_out_2, z_out_3: std_logic_vector(62 downto 0);
signal s_out_0, s_out_1: std_logic_vector(62 downto 0);
signal w_out_0, w_out_1: std_logic_vector(62 downto 0);

signal p_out_0, p_out_1, p_out_2, p_out_3: std_logic_vector(30 downto 0);
signal p0i_out_0, p0i_out_1: std_logic_vector(30 downto 0);
signal ena: std_logic := '1';

component reg_nbit is 
    generic(
        n       : integer := 31
    );
    port(
        clk: in std_logic;
        rst: in std_logic;
        ena: in std_logic;

        d: in std_logic_vector(n-1 downto 0);
        q: out std_logic_vector(n-1 downto 0)
    );
end component;

begin 
    stage0_a_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> A, 
        q=> a_out
    );

    
    
end architecture; 