----------------------------------------------------
-----------------Jack Holly-------------------------
-----------------modp_montymul_V2-------------------
----------------------------------------------------
-----Stage Verification: Status---------------------
----------Stage0-------: Reg: Check----Math: ----------------
----------Stage1-------: Reg: Check----Math: ----------------
----------Stage2-------: Reg: Check----Math: ---- unverified-
----------Stage3-------: Result Check--Math: --- unverified--
----------------------------------------------------

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

--signal a_out, b_out: std_logic_vector(30 downto 0);

signal x_out_0, x_out_1, x_out_2, x_out_3: std_logic_vector(61 downto 0);
signal y_out_1_before_shift: std_logic_vector(92 downto 0);
signal y_out_1_after_shift,y_out_2: std_logic_vector(30 downto 0); --Check This Later
signal z_out_2,z_out_3: std_logic_vector(61 downto 0);

signal conditional_add_pre_shift: std_logic_vector(61 downto 0);
signal conditional_add_post_shift: std_logic_vector(30 downto 0); --Top 31 Bits
signal conditional_post_logic: std_logic_vector(30 downto 0);

signal p_out_1, p_out_2, p_out_3: std_logic_vector(30 downto 0);
signal p0i_out_1: std_logic_vector(30 downto 0);
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
    ----------------------------------------------
    ------------------Stage0----------------------
    ----------------------------------------------
    

    -- Multiplication of stage0
    x_out_0 <= std_logic_vector(unsigned(A)*unsigned(B));

    --Load Registers in Stage0
    stage0_x_reg: reg_nbit
    generic map(n => 62) 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> x_out_0, 
        q=> x_out_1
    );

    stage0_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> P, 
        q=> p_out_1
    );


    stage0_p0i_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p0i, 
        q=> p0i_out_1
    );

    ----------------------------------------------
    ------------------Stage1----------------------
    ----------------------------------------------

    ----Logic between stage1 and stage2
    y_out_1_before_shift <= std_logic_vector(unsigned(x_out_1)*unsigned(p0i_out_1));
    y_out_1_after_shift <= y_out_1_before_shift(30 downto 0);
    
    --Load Registers in Stage2
    stage1_y_reg: reg_nbit
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> y_out_1_after_shift,
        q=> y_out_2
    );

    stage1_x_reg: reg_nbit
    generic map(n => 62)  
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> x_out_1, 
        q=> x_out_2
    );

    stage1_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p_out_1, 
        q=> p_out_2
    );

    ----------------------------------------------
    ------------------Stage2----------------------
    ----------------------------------------------
    
    z_out_2 <= std_logic_vector(unsigned(y_out_2)*unsigned(p_out_2));

    --Load Registers in Stage3

    stage2_z_reg: reg_nbit
    generic map(n => 62)  
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> z_out_2, 
        q=> z_out_3
    );

    stage2_x_reg: reg_nbit
    generic map(n => 62) 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> x_out_2, 
        q=> x_out_3
    );

    stage2_p_reg: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> p_out_2, 
        q=> p_out_3
    );

    ----------------------------------------------
    ------------------Stage3----------------------
    ----------------------------------------------
     ----Between Stage 3 and done
     
    conditional_add_pre_shift <= std_logic_vector(unsigned(z_out_3)+unsigned(x_out_3));
    conditional_add_post_shift <= conditional_add_pre_shift(61 downto 31);

 

    conditional_post_logic <= conditional_add_post_shift when  (unsigned(p_out_3) >= unsigned(conditional_add_post_shift))
            else  std_logic_vector(unsigned(conditional_add_post_shift) - unsigned(p_out_3));

    stage3_result_spare_cycle: reg_nbit 
    port map(
        clk => clk, 
        rst =>rst, 
        ena => ena, 
        d=> conditional_post_logic(30 downto 0), 
        q=> result
    );
    
    
end architecture; 