onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regfile_testbench/regWriteEnable
add wave -noupdate -radix unsigned /regfile_testbench/writeReg
add wave -noupdate -radix decimal /regfile_testbench/writeData
add wave -noupdate -radix unsigned /regfile_testbench/readReg1
add wave -noupdate -radix decimal /regfile_testbench/readData1
add wave -noupdate -radix unsigned /regfile_testbench/readReg2
add wave -noupdate -radix decimal /regfile_testbench/readData2
add wave -noupdate /regfile_testbench/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1331 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 68
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1822 ps}
