library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is 
port(
    clk, rst: in std_logic;

    constant_mux_reg: out std_logic;
    variable_mux_reg: out std_logic;

    constant_reg_ena: out std_logic;
    constant_reg_rst: out std_logic;

    twiddle_reg_rst: out std_logic;

    bit_gen_counter: out std_logic_vector(9 downto 0);
    twiddle_mux_counter: out std_logic_vector(1 downto 0)
);
end entity;

architecture beh of FSM is

    type TG_mode is (state_rst, load_reg, first_run, normal_run, state_done);
    signal current_state: TG_mode;

	signal total_counter : integer := 0;
    signal bit_counter: integer := 0;
    signal twiddle_multiplexer_counter: integer := 0;

    signal clock_ena: std_logic := '1';

    begin
        State_Mode: process(clk, total_counter, rst)
        begin
            if rst = '1' then			
				current_state <= state_rst;
            end if;
            if(rising_edge(clk) and clk = '1') then --Janky AF
                case total_counter is
                    when 0 to 3 => current_state <= load_reg; --works
                    when 4 to 7 => current_state <= first_run;
                    when 8 to 263 => current_state <= normal_run;
                    when others => current_state <= state_done;
                end case;
            end if;
        end process;
        

        clk_timing: process(clk)
        begin
            if clock_ena = '1' then
                if current_state = state_rst then
                    total_counter <= 0;
                    twiddle_multiplexer_counter <= 0;
                    bit_counter <= 0;
                end if;
                
                if(rising_edge(clk) and clk = '1') then
                    total_counter <= total_counter + 1;

                    --if current_state = normal_run then
                    if total_counter >= 9 then
                        if (twiddle_multiplexer_counter < 3) then 
                            twiddle_multiplexer_counter <= twiddle_multiplexer_counter + 1;
                        else
                            twiddle_multiplexer_counter <= 0;
                            bit_counter <= bit_counter + 1;
                        end if;
                    --else 
                    --    twiddle_multiplexer_counter <= 5;
                    end if;
                
                end if;
            end if;
        end process;

        State_effects: process(current_state)
        begin
            case current_state is
			
				when state_rst =>
                    constant_reg_rst <= '1';
					twiddle_reg_rst <= '1';
                    constant_mux_reg <= '0';
                    variable_mux_reg <= '0';
                    constant_reg_ena <= '0';

                when load_reg =>
                    constant_mux_reg <= '0';
                    variable_mux_reg <= '0';
                    constant_reg_ena <= '1';
                    constant_reg_rst <= '0';
                    twiddle_reg_rst <= '0';

                when first_run =>
                    constant_mux_reg <= '1';
                    variable_mux_reg <= '0';
                    constant_reg_ena <= '1';

                when normal_run =>
                    constant_mux_reg <= '1';
                    variable_mux_reg <= '1';
                    constant_reg_ena <= '1';
                    
                when state_done =>
                    constant_mux_reg <= '0';
                    variable_mux_reg <= '0';
                    constant_reg_ena <= '0';
                    clock_ena <= '0';
            end case;
        end process;

        bit_gen_counter <= std_logic_vector(to_unsigned(bit_counter,10)); --This Shit is one clock cycle behind
        twiddle_mux_counter <= std_logic_vector(to_unsigned(twiddle_multiplexer_counter,2));

end architecture;

        
            