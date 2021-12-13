# add all the signals to the wave window
# change radix to hex maybe
add wave -radix hex I_cache_in
add wave -radix hex I_cache_out

# maybe add in rest of test program

# test order
# test read 00000 - 00100

# test read 00000 - 00100 
force I_cache_in 00000
run 2

force I_cache_in 00001
run 2

force I_cache_in 00010
run 2

force I_cache_in 00011
run 2

force I_cache_in 00100
run 2
