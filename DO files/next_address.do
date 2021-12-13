# add all the signals to the wave window
# change radix to hex maybe
add wave -radix unsigned rt
add wave -radix decimal rs
add wave -radix unsigned pc
add wave -radix decimal target_address
add wave branch_type
add wave pc_sel
add wave -radix unsigned next_pc

# test order
# test jump
# test register jump
# test no jump no branch
# test no jump branch on equal pass/fail
# test no jump branch on equal w/ negative offset
# test no jump branch on not equal pass/fail
# test no jump branch on less pass/fail
# test base case

# test jump 0 to 10
force pc X"00"
force rs X"00"
force rt X"00"
force target_address X"0A"
force pc_sel 01
force branch_type 00
run 2

# test register jump 0 to 8
force pc X"00"
force rs X"08"
force rt X"00"
force target_address X"0A" 
force pc_sel 10
force branch_type 00
run 2

# test no jump no branch = jump 0 to 1 default
force pc X"00"
force rs X"00"
force rt X"00"
force target_address X"0A" 
force pc_sel 00
force branch_type 00
run 2

# test no jump branch on equal from 0 to 4 
force pc X"00"
force rs X"02"
force rt X"02"
force target_address X"03" 
force pc_sel 00
force branch_type 01
run 2

# test no jump branch on equal fail from 0-1
force pc X"00"
force rs X"02"
force rt X"01"
force target_address X"03" 
force pc_sel 00
force branch_type 01
run 2

# test no jump branch on equal backwards from 12-4 
force pc X"0C"
force rs X"02"
force rt X"02"
force target_address X"FFFFFFF7" 
force pc_sel 00
force branch_type 01
run 2

# test no jump branch on not equal from 0 to 20
force pc X"00"
force rs X"02"
force rt X"01"
force target_address X"14" 
force pc_sel 00
force branch_type 10
run 2

# test no jump branch on not equal fail from 0-1
force pc X"00"
force rs X"02"
force rt X"02"
force target_address X"14" 
force pc_sel 00
force branch_type 10
run 2

# test no jump branch less than from 0 to 12
force pc X"00"
force rs X"FFFFFFF1"
force rt X"00"
force target_address X"0C" 
force pc_sel 00
force branch_type 11
run 2

# test no jump branch less than fail 0-1
force pc X"00"
force rs X"0D"
force rt X"00"
force target_address X"0C" 
force pc_sel 00
force branch_type 11
run 2

# test no jump no branch default next line case
force pc X"00"
force rs X"00"
force rt X"00"
force target_address X"0C" 
force pc_sel 11
force branch_type 00
run 2
