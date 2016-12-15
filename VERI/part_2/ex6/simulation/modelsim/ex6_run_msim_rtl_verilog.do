transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex6 {H:/VERI/part_2/ex6/counter_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_1/mylib {H:/VERI/part_1/mylib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_1/mylib {H:/VERI/part_1/mylib/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_1/mylib {H:/VERI/part_1/mylib/add3_ge5.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_2/ex6 {H:/VERI/part_2/ex6/ex6_top.v}
vlog -vlog01compat -work work +incdir+H:/VERI/part_1/mylib {H:/VERI/part_1/mylib/clockdiv_50000.v}

