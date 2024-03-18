library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_FSM is
end entity;

architecture behavior of TB_FSM is


    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';

    signal constant_mux_reg: std_logic;
    signal variable_mux_reg: std_logic;

    signal constant_reg_ena: std_logic;
    signal constant_reg_rst: std_logic;

    signal twiddle_reg_ena: std_logic;
    signal twiddle_reg_rst: std_logic;

    signal bit_gen_counter: std_logic_vector(9 downto 0);
    signal twiddle_mux_counter: std_logic_vector(1 downto 0);

    begin
        FSM : entity work.FSM
        port map(clk => clk,
        rst => rst,
        constant_mux_reg=> constant_mux_reg,
        variable_mux_reg=> variable_mux_reg,
        constant_reg_ena=> constant_reg_ena,
        constant_reg_rst=> constant_reg_rst,
        twiddle_reg_rst=> twiddle_reg_rst,
        bit_gen_counter=> bit_gen_counter,
        twiddle_mux_counter=> twiddle_mux_counter);

         --radix signal sim:/montymul_tb/P unsigned
         Clk <= not Clk after ClockPeriod/2;

         process is 
         begin
 
             wait for 10ns;
             rst <= '0';
             wait;
        end process;
end architecture;