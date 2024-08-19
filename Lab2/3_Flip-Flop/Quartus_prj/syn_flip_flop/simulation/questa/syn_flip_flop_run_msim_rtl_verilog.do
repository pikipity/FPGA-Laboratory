transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/3_Flip-Flop/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/3_Flip-Flop/RTL/syn_flip_flop.v}

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/3_Flip-Flop/Quartus_prj/syn_flip_flop/../../Sim {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab2/3_Flip-Flop/Quartus_prj/syn_flip_flop/../../Sim/tb_syn_flip_flop.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_syn_flip_flop

add wave *
view structure
view signals
run 500 ns
