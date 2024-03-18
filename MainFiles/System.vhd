----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------Total System-----------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions  Un-Verified----------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity system is
    port(
        p_Zin, p0i_Zin, g_Zin, ig_zin, X1_Zin, X2_Zin : in std_logic_vector(30 downto 0); --done
        clk, rst: in std_logic
    );
end entity;

architecture behavior of system is

    signal g_reg_in, g_reg_out: std_logic_vector(30 downto 0);     --done
    signal ig_reg_in, ig_reg_out: std_logic_vector(30 downto 0);   --done
    signal p_reg_in, p_reg_out: std_logic_vector(30 downto 0);     --done
    signal p0i_reg_in, p0i_reg_out: std_logic_vector(30 downto 0); --done

    signal x1_mux_out, x2_mux_out: std_logic_vector(30 downto 0);  --only for mux's, not montymul

    signal direct_monty_mul_out, indirect_monty_mul_out: std_logic_vector(30 downto 0); --Not Done

    signal direct_ena0: std_logic;  --done
    signal direct_ena1: std_logic;  --done
    signal direct_ena2: std_logic;  --done
    signal direct_ena3: std_logic;  --done

    signal indirect_ena0: std_logic;  --done
    signal indirect_ena1: std_logic;  --done
    signal indirect_ena2: std_logic;  --done
    signal indirect_ena3: std_logic;  --done

    signal direct_mux_data_out, indirect_mux_data_out: std_logic_vector(30 downto 0); --done


    --FSM Variables
    signal constant_mux_reg_ctrl: std_logic; --done
    signal variable_mux_reg_ctrl: std_logic; --done

    signal constant_reg_ena_ctrl: std_logic; --done
    signal constant_reg_rst_ctrl: std_logic; --done

    signal twiddle_reg_rst_ctrl: std_logic; --done

    signal bit_gen_counter_number: std_logic_vector(9 downto 0);
    signal Twiddle_reg_addr: std_logic_vector(5 downto 0);
    signal twiddle_mux_counter_number: std_logic_vector(1 downto 0);

    begin
        --Registers for Register Variables
        g_reg : entity work.Reg_Variables  
        port map(clk => clk, 
        rst => constant_reg_rst_ctrl, 
        ena => constant_reg_ena_ctrl, 
        data_in =>g_reg_in, 
        data_out =>g_reg_out);

        ig_reg : entity work.Reg_Variables 
        port map(clk => clk, 
        rst => constant_reg_rst_ctrl, 
        ena => constant_reg_ena_ctrl, 
        data_in =>ig_reg_in, 
        data_out =>ig_reg_out);

        p_reg : entity work.Reg_Variables 
        port map(clk => clk, 
        rst => constant_reg_rst_ctrl, 
        ena => constant_reg_ena_ctrl, 
        data_in =>p_reg_in, 
        data_out =>p_reg_out);

        p0i_reg : entity work.Reg_Variables 
        port map(clk => clk, 
        rst => constant_reg_rst_ctrl, 
        ena => constant_reg_ena_ctrl, 
        data_in =>p0i_reg_in, 
        data_out =>p0i_reg_out);



        --2 Port Mux's 
        x1_mux : entity work.MUX2C      
        port map(cnt => variable_mux_reg_ctrl, 
        new_data=>X1_Zin,
        data_out=>x1_mux_out,
        recycled_data=>direct_monty_mul_out);

        x2_mux : entity work.MUX2C      
        port map(cnt => variable_mux_reg_ctrl, 
        new_data=>X2_Zin,
        data_out=>x2_mux_out,
        recycled_data=> indirect_monty_mul_out);

        g_mux : entity work.MUX2C   
        port map(cnt => constant_mux_reg_ctrl, 
        new_data=>g_Zin,
        data_out=>g_reg_in,
        recycled_data=>g_reg_out);

        ig_mux : entity work.MUX2C   
        port map(cnt => constant_mux_reg_ctrl, 
        new_data=>ig_Zin,
        data_out=>ig_reg_in,
        recycled_data=>ig_reg_out);

        p_mux : entity work.MUX2C   
        port map(cnt => constant_mux_reg_ctrl, 
        new_data=>p_Zin,
        data_out=>p_reg_in,
        recycled_data=>p_reg_out);
         
        p0i_mux : entity work.MUX2C   
        port map(cnt => constant_mux_reg_ctrl, 
        new_data=>p0i_Zin,
        data_out=>p0i_reg_in,
        recycled_data=>p0i_reg_out);




        --Montgomery Multiplications
        montymul_direct : entity work.modp_montymul_V2
        port map(clk => clk, 
        rst =>rst, 
        A => x1_mux_out, 
        B=> g_reg_out, 
        P=> p_reg_out, 
        P0i => p0i_reg_out, 
        result=> direct_monty_mul_out);

        montymul_inverse : entity work.modp_montymul_V2
        port map(clk => clk, 
        rst =>rst, 
        A =>x2_mux_out, 
        B=>ig_reg_out, 
        P=>p_reg_out, 
        P0i =>p0i_reg_out, 
        result=> indirect_monty_mul_out);

        --Bit Generator
        Bit_Func : entity work.Bit_Order_Func  
        port map(u => bit_gen_counter_number, 
        b => Twiddle_reg_addr);


        --Twiddle Registers
        Direct_Twiddle_Reg_0 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => direct_ena0, 
        data_in =>direct_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        Direct_Twiddle_Reg_1 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => direct_ena1, 
        data_in =>direct_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        Direct_Twiddle_Reg_2 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => direct_ena2, 
        data_in =>direct_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        Direct_Twiddle_Reg_3 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => direct_ena3, 
        data_in =>direct_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        --Inverse Twiddle Registers
        Inverse_Twiddle_Reg_0 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => indirect_ena0, 
        data_in =>indirect_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        Inverse_Twiddle_Reg_1 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => indirect_ena1, 
        data_in =>indirect_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        Inverse_Twiddle_Reg_2 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => indirect_ena2, 
        data_in =>indirect_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        Inverse_Twiddle_Reg_3 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>twiddle_reg_rst_ctrl, 
        ena => indirect_ena3, 
        data_in =>indirect_mux_data_out, 
        reg_addr => Twiddle_reg_addr);

        --Twiddle Mux
        Direct_Twiddle_Mux : entity work.MUX4C
        port map(cnt => twiddle_mux_counter_number,
        data_in=>direct_monty_mul_out,
        data_out=>direct_mux_data_out,
        enable_sig0=>direct_ena0,
        enable_sig1=>direct_ena1,
        enable_sig2=>direct_ena2,
        enable_sig3=>direct_ena3);

        Indirect_Twiddle_Mux : entity work.MUX4C
        port map(cnt => twiddle_mux_counter_number,
        data_in=>indirect_monty_mul_out,
        data_out=>indirect_mux_data_out,
        enable_sig0=>indirect_ena0,
        enable_sig1=>indirect_ena1,
        enable_sig2=>indirect_ena2,
        enable_sig3=>indirect_ena3);

        --Finite State Machine
        FSM : entity work.FSM  
        port map(clk => clk,
        rst => rst,
        constant_mux_reg=> constant_mux_reg_ctrl,
        variable_mux_reg=> variable_mux_reg_ctrl,
        constant_reg_ena=> constant_reg_ena_ctrl,
        constant_reg_rst=> constant_reg_rst_ctrl,
        twiddle_reg_rst=>  twiddle_reg_rst_ctrl,
        bit_gen_counter=>  bit_gen_counter_number,
        twiddle_mux_counter=> twiddle_mux_counter_number);


end architecture;