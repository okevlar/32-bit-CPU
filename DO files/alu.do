# add all the signals to the wave window
add wave *

# testing 'lui'
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 00
force add_sub 0
run
	# should be 000...1

# testing 'slt'
# case I
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 01
force add_sub 0
run
	# should be all '0'

# case II
force x 10000000000000000000000000000000
force y 00000000000000000000000000000000
force func 01
force add_sub 0
run
	# should be '1'

# testing 'add' with no overflow
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 10
force add_sub 0
run
	# should be 000...100 overflow = 0

# testing overflow
# case I
force x 10000000000000000000000000000000
force y 10000000000000000000000000000000
force func 10
force add_sub 0
run
	# should be 000...000 overflow = 1

# case II
force x 01111111111111111111111111111111
force y 01111111111111111111111111111111
force func 10
force add_sub 0
run
	# should be 111...111 overflow = 1

# testing 'sub' 
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 10
force add_sub 1
run
	# should be 000...100 overflow = 0

# testing 'AND'
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 11
force logic_func 00
run
	# should be 000...001

# testing 'OR'
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 11
force logic_func 01
run
	# should be 000...011

# testing 'XOR'
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 11
force logic_func 10
run

# testing 'NOR'
force x 00000000000000000000000000000011
force y 00000000000000000000000000000001
force func 11
force logic_func 11
run
	# should be 111...100
