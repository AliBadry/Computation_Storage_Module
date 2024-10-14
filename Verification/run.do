vdel -all -lib work
vlib work


##vlog ../Design/*.sv +cover
##vlog *.sv +cover
vlog uvm_pack_class.sv 
vlog Arithmetic_unit.sv +cover
vlog Controller.sv +cover
vlog Dual_port_RAM.sv +cover
vlog Computational_storage.sv +cover
vlog CS_interface.sv
vlog CS_wrapper.sv
vlog top_tb.sv 

vsim -voptargs=+acc work.top_tb -coverage  

do {wave.do}

run -all 
coverage report -codeall -cvg -verbose