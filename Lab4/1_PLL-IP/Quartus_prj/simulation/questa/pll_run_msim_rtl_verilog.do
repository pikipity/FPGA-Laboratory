transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/Quartus_prj/ipcore_dir {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/Quartus_prj/ipcore_dir/pll_ip.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/RTL {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/RTL/pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/Quartus_prj/db {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/Quartus_prj/db/pll_ip_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/Quartus_prj/../Sim {C:/Users/wangz/Documents/GitHub/FPGA-Laboratory/Lab4/1_PLL-IP/Quartus_prj/../Sim/tb_pll.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_pll

add wave *
view structure
view signals
run 500 ns
