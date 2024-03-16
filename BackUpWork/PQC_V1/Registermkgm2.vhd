library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_reg is
    port(
        clk, rst: in std_logic;
        state: in std_logic_vector(2 downto 0);
        data_in: in std_logic_vector(31 downto 0);
        data_out1, data_out2: out std_logic_vector(31 downto 0)
    );
end main_reg;

architecture behavior of main_reg is
    signal g,x1,x2: std_logic_vector(31 downto 0);
    signal write_enable: std_logic;
    begin
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    --reset values
                    data_out1 <= (others => '0');
                    data_out2 <= (others => '0');
                    g <= (others => '0');
                    x1 <= (others => '0');
                    x2 <= (others => '0');

                else
                    case state is 
                        when "000" => g <= data_in;
                            data_out1 <= g;
                            data_out2 <= g;

                        when "001" => g <= data_in;
                            data_out1 <= g;
                            data_out2 <= g;
                        
                        when others => data_out1 <= (others => '0');
                            
                    
                    
                    end case;
                end if;
            end if;
            end process; 
end architecture;