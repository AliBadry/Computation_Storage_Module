onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group CS_TB /CS_TB/DQ_tb
add wave -noupdate -group CS_TB /CS_TB/DQ_tb1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/clk
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/rst_n
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/addA
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/addB
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/addC
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/operation_select
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/DQ
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/addr_port1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/in_port1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/out_port1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/mux1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/mux2
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/RD_en1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/RD_en2
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/WR_en1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/arith_unit_out
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/arith_unit_in1
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/arith_unit_in2
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/arith_op
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/DQ_out_enable
add wave -noupdate -expand -group CS_signals /CS_TB/CS_TOP1/U_CS1/DQ_out
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/clk
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/rst_n
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/operation_select
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/RD_en1
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/RD_en2
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/WR_en1
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/mux1
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/mux2
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/arith_op
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/current_state
add wave -noupdate -group Controller /CS_TB/CS_TOP1/U_CS1/CU1/next_state
add wave -noupdate -expand -group {Arithmetic unit} -radix unsigned /CS_TB/CS_TOP1/U_CS1/AU1/arith_op
add wave -noupdate -expand -group {Arithmetic unit} -radix unsigned /CS_TB/CS_TOP1/U_CS1/AU1/in1
add wave -noupdate -expand -group {Arithmetic unit} -radix unsigned /CS_TB/CS_TOP1/U_CS1/AU1/in2
add wave -noupdate -expand -group {Arithmetic unit} /CS_TB/CS_TOP1/U_CS1/AU1/out
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/clk
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/addr_port1
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/addr_port2
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/in_port1
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/in_port2
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/RD_en1
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/WR_en1
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/RD_en2
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/WR_en2
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/out_port1
add wave -noupdate -expand -group Memory /CS_TB/CS_TOP1/U_CS1/RAM1/out_port2
add wave -noupdate -expand -group Memory -radix unsigned -childformat {{{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[0]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[1]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[2]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[3]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[4]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[5]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[6]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[7]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[8]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[9]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[10]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[11]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[12]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[13]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[14]} -radix unsigned} {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[15]} -radix unsigned}} -expand -subitemconfig {{/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[0]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[1]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[2]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[3]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[4]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[5]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[6]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[7]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[8]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[9]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[10]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[11]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[12]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[13]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[14]} {-radix unsigned} {/CS_TB/CS_TOP1/U_CS1/RAM1/RAM[15]} {-radix unsigned}} /CS_TB/CS_TOP1/U_CS1/RAM1/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2108 ps} 0}
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
WaveRestoreZoom {0 ps} {128 ns}
