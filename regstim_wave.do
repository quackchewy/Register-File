onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regstim/RegWrite
add wave -noupdate -radix unsigned /regstim/WriteRegister
add wave -noupdate -radix decimal /regstim/WriteData
add wave -noupdate -radix unsigned /regstim/ReadRegister1
add wave -noupdate -radix decimal /regstim/ReadData1
add wave -noupdate -radix unsigned /regstim/ReadRegister2
add wave -noupdate -radix decimal /regstim/ReadData2
add wave -noupdate /regstim/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {476786621 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
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
configure wave -timelineunits ns
update
WaveRestoreZoom {430432045 ps} {479977261 ps}
