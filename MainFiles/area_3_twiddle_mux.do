add wave -position insertpoint  \
sim:/tb_overall_system/clk \
sim:/tb_overall_system/rst \
sim:/tb_overall_system/twiddle_generator/FSM/current_state \
sim:/tb_overall_system/twiddle_generator/FSM/total_counter \
sim:/tb_overall_system/twiddle_generator/FSM/bit_gen_counter \
sim:/tb_overall_system/twiddle_generator/FSM/twiddle_multiplexer_counter \
sim:/tb_overall_system/twiddle_generator/twiddle_mux_counter_number \
sim:/tb_overall_system/twiddle_generator/direct_monty_mul_out \
sim:/tb_overall_system/twiddle_generator/direct_mux_data_out \
sim:/tb_overall_system/twiddle_generator/direct_ena0 \
sim:/tb_overall_system/twiddle_generator/direct_ena1 \
sim:/tb_overall_system/twiddle_generator/direct_ena2 \
sim:/tb_overall_system/twiddle_generator/direct_ena3 \

radix signal sim:/tb_overall_system/twiddle_generator/direct_monty_mul_out unsigned
radix signal sim:/tb_overall_system/twiddle_generator/twiddle_mux_counter_number unsigned
radix signal sim:/tb_overall_system/twiddle_generator/FSM/bit_gen_counter unsigned
radix signal sim:/tb_overall_system/twiddle_generator/FSM/twiddle_multiplexer_counter unsigned
radix signal sim:/tb_overall_system/twiddle_generator/x1_mux_out unsigned
radix signal sim:/tb_overall_system/twiddle_generator/direct_mux_data_out unsigned

