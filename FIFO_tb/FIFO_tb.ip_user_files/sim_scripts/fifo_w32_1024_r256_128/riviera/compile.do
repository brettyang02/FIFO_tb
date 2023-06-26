vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/fifo_generator_v13_2_7
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 \
"F:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"F:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../FIFO_tb.gen/sources_1/ip/fifo_w32_1024_r256_128/sim/fifo_w32_1024_r256_128.v" \

vlog -work xil_defaultlib \
"glbl.v"

