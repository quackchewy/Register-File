onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dff_enable_testbench/out
add wave -noupdate /dff_enable_testbench/in
add wave -noupdate /dff_enable_testbench/writeEnable
add wave -noupdate /dff_enable_testbench/reset
add wave -noupdate /dff_enable_testbench/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {394 ps}
