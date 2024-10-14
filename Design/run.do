## File : run
## Author : Ali Badry
## Date : 26/9/2024
## Version : 1
## Abstract : automated compile, wave generation and simulation file


vdel -all -lib work
vlib work

vlog *.sv

vsim -voptargs=+acc work.CS_TB


do {wave.do}

run -all