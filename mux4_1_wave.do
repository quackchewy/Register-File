onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mux4_1_testbench/sel1
add wave -noupdate /mux4_1_testbench/sel0
add wave -noupdate /mux4_1_testbench/i0
add wave -noupdate /mux4_1_testbench/i1
add wave -noupdate /mux4_1_testbench/i2
add wave -noupdate /mux4_1_testbench/i3
add wave -noupdate /mux4_1_testbench/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {635 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 165
configure wave -valuecolwidth 100
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
WaveRestoreZoom {408 ps} {652 ps}
