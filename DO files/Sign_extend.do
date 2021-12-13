# add all the signals to the wave window
# change radix to hex maybe
add wave -radix hex Sign_extend_out
add wave func
add wave -radix hex immediate

# test order
# test pad lower 16 w/ 0s
# test pad upper 16 w/ 0s
# test pad upper 16 w/ msb

# test pad lower 16 w/ 0s
force func 00
force immediate X"FFFF"
run 2
# should be 16x1s and 16x0s

# test pad upper 16 w/ 0s
force func 11
force immediate X"FFFF"
run 2
# should be 16x0s and 16x1s

# test pad upper 16 w/ msb
force func 10
force immediate X"FFFF"
run 2
# should be 32x1s

# test pad upper 16 w/ msb
force func 01
force immediate X"FFFF"
run 2
# should be 32x1s
