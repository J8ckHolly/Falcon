--modp_montymul_V2 Test Bench
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_modp_montymul_V2 is
end entity;

architecture beh of TB_modp_montymul_V2 is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000ms/ClockFrequency;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal ena : std_logic := '1';
    signal X1, g, P, P0i: std_logic_vector(30 downto 0);
    signal result: std_logic_vector(30 downto 0);
    --signal head,a0_out, a1_out, result: std_logic_vector(4 downto 0);


    begin
    montymul : entity work.modp_montymul_V2
    port map(clk => clk, rst =>rst, A =>X1, B=>g, P=>P, P0i =>P0i, result=> result);

    --radix signal sim:/montymul_tb/P unsigned
    Clk <= not Clk after ClockPeriod/2;

    process is 
    begin

        X1 <= "0000000000000010110111111111111";
        g <= "0101110010101010010011000100001";
        P <= "1111111111111101001000000000001";
        P0i <= "1101110111111101000111111111111";        
        
        wait for 10ns;
        --A <= "0011001000000100011000111011100";
        --B <= "1100000111011000010100010010100";
        --P <= "0110110111001001101011010001000";
        --P0i <= "1101100101100010111011010001010";  
        
        wait for 10ns;
        --A <= "1011010001100000101101100000101";
        --B <= "1110011110110001010000000100000";
        --P <= "0011100101011001001010000101000";
        --P0i <= "0111111101000010101010110110010";  

        wait for 10ns;
        --A <= "1110010011011001011010111110101";
        --B <= "0000110100011100111000001110111";
        --P <= "0001111010100011100100100010001";
        --P0i <= "0000110010000110001111111011100";  

        wait for 10ns;

        

        




        --wait for 20 ns;
        --Input <= '1';
        --wait for 22ns;
        --Input <='0';
        --wait for 6ns;
        --Input <= '1';
        --wait for 20 ns;

        
        wait for 100 ns;
        rst <= '1';

        wait;
    end process;

end architecture;


--head <="00000";
--wait for 10ns;
--head <="00001";
--wait for 10ns;
--head <="00011";
--wait for 10ns;
--head <="00111";
--wait for 10ns;


--reg1: reg_nbit
--generic map(n => 5)
--port map(clk => clk, rst=> rst, ena=> ena, d=>head, q=>a0_out);

--reg2: reg_nbit
--generic map(n => 5)
--port map(clk => clk, rst=> rst, ena=> ena, d=>a0_out, q=>a1_out);

--reg3: reg_nbit
--generic map(n => 5)
--port map(clk => clk, rst=> rst, ena=> ena, d=>a1_out, q=>result);