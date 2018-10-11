# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./regfile.sv"
vlog "./decoder5_32.sv"
vlog "./decoder3_8.sv"
vlog "./decoder2_4.sv"
vlog "./register.sv"
vlog "./dff_enable.sv"
vlog "./mux32_1.sv"
vlog "./mux16_1.sv"
vlog "./mux4_1.sv"
vlog "./mux2_1.sv"
vlog "./regstim.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
#vsim -voptargs="+acc" -t 1ps -lib work regfile_testbench
#vsim -voptargs="+acc" -t 1ps -lib work decoder5_32_testbench
#vsim -voptargs="+acc" -t 1ps -lib work decoder3_8_testbench
#vsim -voptargs="+acc" -t 1ps -lib work decoder2_4_testbench
#vsim -voptargs="+acc" -t 1ps -lib work register_testbench
#vsim -voptargs="+acc" -t 1ps -lib work dff_enable_testbench
#vsim -voptargs="+acc" -t 1ps -lib work mux32_1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work mux16_1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work mux4_1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work mux2_1_testbench
vsim -voptargs="+acc" -t 1ps -lib work regstim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
#do regfile_wave.do
#do decoder5_32_wave.do
#do decoder3_8_wave.do
#do decoder2_4_wave.do
#do register_wave.do
#do dff_enable_wave.do
#do mux32_1_wave.do
#do mux16_1_wave.do
#do mux4_1_wave.do
#do mux2_1_wave.do
do regstim_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
