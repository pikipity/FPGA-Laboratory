transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/2_VGA_Display/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/2_VGA_Display/RTL/vga_ctrl.v}

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/2_VGA_Display/Quartus_prj/vga_ctrl/../../Sim {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/2_VGA_Display/Quartus_prj/vga_ctrl/../../Sim/tb_vga_ctrl.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_vga_ctrl

add wave *
view structure
view signals
run 20 ms
