--Main Register
--Jack Holly

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_reg is
    port(
        clk, rst : in std_logic;
        data_in : in std_logic_vector(3 downto 0);
        Reg_out1, Reg_out2: out std_logic_vector(3 downto 0);
        state: in std_logic_vector(2 downto 0)
    );
end entity;

architecture beh of main_reg is
    signal g, x1, x2 : std_logic_vector(3 downto 0);
    signal Wenable : std_logic := '1';
    
    begin
        process(clk)
        begin
            if rising_edge(clk) then 
            
                if(rst = '1') then
                    g <= "0000";
                    x1 <= "0000";
                    x2 <= "0000";
                    Reg_out1 <= "0000";
                    Reg_out2 <= "0000";

                elsif(clk = '1') then
                    case state is
                        when "000" => g <= data_in;
                            Reg_out1 <= g;
                            Reg_out2 <= g;

                        when "001" => g <= data_in;
                            Reg_out1 <= g;
                            Reg_out2 <= g;
                        
                        when "010" => Wenable <= '1';

                        when "011" =>
                            X1 <= data_in;
                        
                        when "100" =>
                            X2 <= data_in;
                            Reg_out1 <= g;
                            Reg_out2 <= X1;
                        
                        when "101" =>
                            X1 <= data_in;
                            Reg_out1 <= g;
                            Reg_out2 <= X2;

                        when "110" =>
                            X2 <= data_in;
                            Reg_out1 <= g;
                            Reg_out2 <= X1;

                        when others =>
                            Reg_out1 <= "0000";
                    end case;
                end if;
            end if;
        end process;
end architecture;




