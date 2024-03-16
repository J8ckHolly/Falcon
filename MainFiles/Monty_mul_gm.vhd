library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Holding_Array is
    generic (
        NUM_REGISTERS : integer := 64;  -- Number of registers
        DATA_WIDTH    : integer := 31   -- Width of each register
    );
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        data_in   : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
        ena       : in  std_logic;
        reg_addr  : in std_logic_vector(5 downto 0);
        data_out  : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end entity Holding_Array;

architecture Behavioral of Holding_Array is

    type registers is array(0 to NUM_REGISTERS -1) of std_logic_vector(DATA_WIDTH -1 downto 0);
    signal my_reg : registers;

    begin
        process (clk)
        begin
            if(rising_edge(clk)) then 
                if(rst = '1') then
                    -- Reset all registers
                    for i in 0 to NUM_REGISTERS - 1 loop
                        my_reg(i) <= (others => '0');
                    end loop;

                else
                    if ena = '1' then
                        my_reg(to_integer(unsigned(reg_addr))) <= data_in;  -- Select based on address
                    end if;
                end if;
            end if;
    end process;

end architecture Behavioral;
