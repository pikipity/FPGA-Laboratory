transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/1_Top-Down_Design/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/1_Top-Down_Design/RTL/half_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/1_Top-Down_Design/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/1_Top-Down_Design/RTL/full_adder.v}

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/1_Top-Down_Design/Quartus_prj/../Sim {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/1_Top-Down_Design/Quartus_prj/../Sim/tb_full_adder.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_full_adder

add wave *
view structure
view signals
run 1 us
