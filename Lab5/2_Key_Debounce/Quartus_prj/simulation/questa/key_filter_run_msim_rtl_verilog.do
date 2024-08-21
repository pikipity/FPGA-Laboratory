transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab5/2_Key_Debounce/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab5/2_Key_Debounce/RTL/key_filter.v}

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab5/2_Key_Debounce/Quartus_prj/../Sim {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab5/2_Key_Debounce/Quartus_prj/../Sim/tb_key_filter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_key_filter

add wave *
view structure
view signals
run 500 us
