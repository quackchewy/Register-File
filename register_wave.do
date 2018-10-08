onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /register_testbench/dataOut
add wave -noupdate -radix decimal /register_testbench/dataIn
add wave -noupdate /register_testbench/writeEnable
add wave -noupdate /register_testbench/reset
add wave -noupdate /register_testbench/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {100 ps}
