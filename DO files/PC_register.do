# add all the signals to the wave window
# change radix to hex maybe
add wave -radix unsigned PC_out
add wave -radix unsigned PC_Icache
add wave reset
add wave clk
add wave -radix unsigned next_PC

# test order
# test reset
# next PC

# test reset
force clk 1
force reset 1
run 2
force reset 0
force clk 0
run 2

# test next pc
force clk 1
force reset 0
force next_PC X"04"
run 2

# test reset
force clk 0
force reset 1
run 2
force reset 0
force clk 1
run 2

