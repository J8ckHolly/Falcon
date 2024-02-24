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

signal z_out_0, z_out_1, z_out_2, z_out_3: std_logic_vector(61 downto 0);
signal s_out_0, s_out_1: std_logic_vector(61 downto 0);
signal w_out_0, w_out_1: std_logic_vector(61 downto 0);
signal d_out_0, d_out_1, d_out_sub: std_logic_vector(61 downto 0);
signal d_out_2: std_logic_vector(30 downto 0);



signal p_out_0, p_out_1, p_out_2, p_out_3, p_out_4: std_logic_vector(30 downto 0);
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

    --Load Registers in Stage0
    stage0_a_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> A, 
        q=> a_out
    );

    stage0_b_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> B, 
        q=> b_out
    );
    
    stage0_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> P, 
        q=> p_out_0
    );

    stage0_p0i_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> P0i, 
        q=> p0i_out_0
    );

    -- Multiplication of stage0
    z_out_0 <= std_logic_vector(unsigned(a_out)*unsigned(b_out));

    --------Stage 1 Registers
    stage1_z_reg: reg_nbit
    generic map(n => 62) 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> z_out_0, 
        q=> z_out_1
    );

    stage1_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p_out_0, 
        q=> p_out_1
    );


    stage1_p0i_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p0i_out_0, 
        q=> p0i_out_1
    );

    ----Logic between stage1 and stage2
    s_out_0 <= std_logic_vector(unsigned(z_out_1(30 downto 0))*unsigned(p0i_out_1));

    ---Stage2 Registers
    stage2_s_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> s_out_0, 
        q=> s_out_1
    );

    stage2_z_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> z_out_1, 
        q=> z_out_2
    );

    stage2_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p_out_1, 
        q=> p_out_2
    );

    ---logic between stage 2 and 3
    w_out_0 <= std_logic_vector(unsigned(s_out_1(30 downto 0))*unsigned(p_out_2));

    ---Load Registers in Stage 3

    stage3_w_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> w_out_0, 
        q=> w_out_1
    );

    stage3_z_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> z_out_2, 
        q=> z_out_3
    );

    stage3_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p_out_2, 
        q=> p_out_3
    );

    ----Between Stage 3 and Stage 4
    d_out_0 <= std_logic_vector(unsigned(z_out_3)+unsigned(w_out_1));

    ----Loading Stage 4 of Registers

    stage4_d_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> d_out_0, 
        q=> d_out_1
    );

    stage4_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p_out_3, 
        q=> p_out_4
    );

    -----Between Stage 4 and Stage 5
    --if(unsigned(d_out_1(61 downto 30)) > unsigned(p_out_4)) then
    --    d_out_sub <= std_logic_vector(unsigned(d_out_1(61 downto 0)) - unsigned(p_out_4));
    --    d_out_2 <= d_out_sub(30 downto 0);
    
    --else 
    --    d_out_2 <= std_logic_vector(unsigned(d_out_1(61 downto 31)));
    --end if;

    -----Stage 5 register
    --stage5_d_reg: reg_nbit 
    --port map(
    --    clk => clk, 
    --    rst =>rst, 
    --    ena => ena, 
    --    d=> d_out_2, 
    --    q=> result
    --);


    result <= p_out_4;
    
end architecture; 