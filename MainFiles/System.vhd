----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------3.16.2024--------------------------
-----------------TB_Bit_Order-----------------------
----------------------------------------------------
---------- Verification: Status---------------------
----------All Functions  Verified-------------------
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity system
port(
    p_Zin, p0i_Zin, g_Zin, ig_zin, X1_Zin, X2_Zin : in std_logic_vector(30 downto 0;)
);
end entity

architecture behavior of system is
    signal g_reg_in, g_reg_out: std_logic_vector(30 downto 0);
    signal ig_reg_in, ig_reg_out: std_logic_vector(30 downto 0);
    signal p_reg_in, p_reg_out: std_logic_vector(30 downto 0);
    signal p0i_reg_in, poi_reg_out: std_logic_vector(30 downto 0);

    signal x1_mux_out, x2_mux_out: std_logic_vector(30 downto 0);

    signal direct_monty_mul_out, indirect_monty_mul_out: std_logic_vector(30 downto 0);

    signal 

    begin
        --Registers for Register Variables
        g_reg : entity work.Reg_Variables
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>link_mux_reg_in, 
        data_out =>link_mux_reg_out);

        ig_reg : entity work.Reg_Variables
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>link_mux_reg_in, 
        data_out =>link_mux_reg_out);

        p_reg : entity work.Reg_Variables
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>link_mux_reg_in, 
        data_out =>link_mux_reg_out);

        p0i_reg : entity work.Reg_Variables
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>link_mux_reg_in, 
        data_out =>link_mux_reg_out);

        --2 Port Mux's 
        x1_mux : entity work.MUX2C
        port map(cnt => cnt, 
        new_data=>Zin,
        data_out=>mux_out,
        recycled_data=>recycled_data);

        x2_mux : entity work.MUX2C
        port map(cnt => cnt, 
        new_data=>Zin,
        data_out=>mux_out,
        recycled_data=>recycled_data);

        g_mux : entity work.MUX2C
        port map(cnt => cnt, 
        new_data=>Zin,
        data_out=>mux_out,
        recycled_data=>recycled_data);

        ig_mux : entity work.MUX2C
        port map(cnt => cnt, 
        new_data=>Zin,
        data_out=>mux_out,
        recycled_data=>recycled_data);

        p_mux : entity work.MUX2C
        port map(cnt => cnt, 
        new_data=>Zin,
        data_out=>mux_out,
        recycled_data=>recycled_data);
         
        p0i_mux : entity work.MUX2C
        port map(cnt => cnt, 
        new_data=>Zin,
        data_out=>mux_out,
        recycled_data=>recycled_data);

        --Montgomery Multiplications
        montymul_direct : entity work.modp_montymul_V2
        port map(clk => clk, 
        rst =>rst, 
        A =>A, 
        B=>B, 
        P=>P, 
        P0i =>P0i, 
        result=> result);

        montymul_inverse : entity work.modp_montymul_V2
        port map(clk => clk, rst =>rst, A =>A, B=>B, P=>P, P0i =>P0i, result=> result);

        --Bit Generator
        Bit_Func : entity work.Bit_Order_Func
        port map(u => u, b => b);
        --Twiddle Registers
        Twiddle_Reg_0 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        Twiddle_Reg_1 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        Twiddle_Reg_2 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        Twiddle_Reg_3 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);


        Inverse_Twiddle_Reg_0 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        Inverse_Twiddle_Reg_1 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        Inverse_Twiddle_Reg_2 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        Inverse_Twiddle_Reg_3 : entity work.Reg_Twiddle_Factor
        port map(clk => clk, 
        rst =>rst, 
        ena => ena, 
        data_in =>A, 
        reg_addr => reg_addr);

        --Twiddle Mux
        Direct_Twiddle_Mux : entity work.MUX4C
        port map(cnt => cnt,
        data_in=>A,
        data_out=>B,
        enable_sig0=>enable_sig0,
        enable_sig1 =>enable_sig1,
        enable_sig2=>enable_sig2,
        enable_sig3=> enable_sig3);

        Indirect_Twiddle_Mux : entity work.MUX4C
        port map(cnt => cnt,
        data_in=>A,
        data_out=>B,
        enable_sig0=>enable_sig0,
        enable_sig1 =>enable_sig1,
        enable_sig2=>enable_sig2,
        enable_sig3=> enable_sig3);

        --Finite State Machine
        FSM : entity work.FSM
        port map(clk => clk,
        rst => rst,
        constant_mux_reg=> constant_mux_reg,
        variable_mux_reg=> variable_mux_reg,
        constant_reg_ena=> constant_reg_ena,
        constant_reg_rst=> constant_reg_rst,
        twiddle_reg_ena=> twiddle_reg_ena,
        twiddle_reg_rst=> twiddle_reg_rst,
        bit_gen_counter=> bit_gen_counter,
        twiddle_mux_counter=> twiddle_mux_counter);




end architecture;