add wave -position insertpoint  \
sim:/tb_overall_system/clk \
sim:/tb_overall_system/rst \
sim:/tb_overall_system/twiddle_generator/FSM/current_state \
sim:/tb_overall_system/twiddle_generator/FSM/total_counter \
sim:/tb_overall_system/twiddle_generator/FSM/bit_gen_counter \
sim:/tb_overall_system/twiddle_generator/FSM/twiddle_multiplexer_counter \
sim:/tb_overall_system/twiddle_generator/twiddle_mux_counter_number \
sim:/tb_overall_system/twiddle_generator/twiddle_reg_addr \


radix signal sim:/tb_overall_system/twiddle_generator/twiddle_mux_counter_number unsigned
radix signal sim:/tb_overall_system/twiddle_generator/FSM/bit_gen_counter unsigned
radix signal sim:/tb_overall_system/twiddle_generator/FSM/twiddle_multiplexer_counter unsigned
radix signal sim:/tb_overall_system/twiddle_generator/twiddle_reg_addr unsigned

