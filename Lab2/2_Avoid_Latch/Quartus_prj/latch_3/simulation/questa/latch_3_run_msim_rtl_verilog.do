transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/2_Avoid_Latch/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/2_Avoid_Latch/RTL/latch_3.v}

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/2_Avoid_Latch/Quartus_prj/latch_3/../../Sim {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/2_Avoid_Latch/Quartus_prj/latch_3/../../Sim/tb_latch_3.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_latch_3

add wave *
view structure
view signals
run 1 us
