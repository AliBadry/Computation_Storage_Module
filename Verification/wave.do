onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/clk
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/rst_n
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/addA
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/addB
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/addC
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/operation_select
add wave -noupdate -group {wrapper signals} /top_tb/CS_TOP1/DQ
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/clk
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/rst_n
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/addA
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/addB
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/addC
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/operation_select
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/DQ_in
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/DQ_out
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/intf_ram
add wave -noupdate -expand -group {interface signals} /top_tb/CS_I1/seq_finished
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/MEM_WIDTH
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/MEM_DEPTH
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/NO_OPERATIONS
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/clk
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/rst_n
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/addA
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/addB
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/addC
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/operation_select
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/DQ
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/addr_port1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/in_port1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/out_port1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/mux1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/mux2
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/RD_en1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/RD_en2
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/WR_en1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/arith_unit_out
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/arith_unit_in1
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/arith_unit_in2
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/arith_op
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/DQ_out_enable
add wave -noupdate -group {CS_internal signals} /top_tb/CS_TOP1/U_CS1/DQ_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1146 ns}
