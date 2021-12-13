# add all the signals to the wave window
add wave clk
add wave reset
add wave -radix unsigned write
add wave -radix unsigned Write_address
add wave -radix unsigned din
add wave -radix unsigned read_a
add wave -radix unsigned out_a
add wave -radix unsigned read_b
add wave -radix unsigned out_b
add wave -radix unsigned r0
add wave -radix unsigned r1
add wave -radix unsigned r2
add wave -radix unsigned r3
add wave -radix unsigned r4
add wave -radix unsigned r5
add wave -radix unsigned r6
add wave -radix unsigned r7
add wave -radix unsigned r8
add wave -radix unsigned r9
add wave -radix unsigned r10
add wave -radix unsigned r11
add wave -radix unsigned r12
add wave -radix unsigned r13
add wave -radix unsigned r14
add wave -radix unsigned r15
add wave -radix unsigned r16
add wave -radix unsigned r17
add wave -radix unsigned r18
add wave -radix unsigned r19
add wave -radix unsigned r20
add wave -radix unsigned r21
add wave -radix unsigned r22
add wave -radix unsigned r23
add wave -radix unsigned r24
add wave -radix unsigned r25
add wave -radix unsigned r26
add wave -radix unsigned r27
add wave -radix unsigned r28
add wave -radix unsigned r29
add wave -radix unsigned r30
add wave -radix unsigned r31

# test order
# reset
# write to register on clk high
# read register on clk low (Read a = Evens (including 0), Read b = Odds)
# repeat for all registers
# Reset	

# start with a reset
force clk 1
force reset 1
run 2
force reset 0
force clk 0
run 2

# TEST 1: write/read R0 
force reset 0
force clk 1 
force write 1
force write_address 00000
force din X"01"
run 2
force clk 0
# Testing read on register that has been written into	
force read_a 00000
# Testing read on register that has not be written into
force read_b 11111	
run 2

# TEST 2: write/read R1
force reset 0
force clk 1 
force write 1
force write_address 00001
force din X"02"
run 2
force clk 0
force read_a 11110
force read_b 00001
run 2

# TEST 3: write/read R2
force reset 0
force clk 1 
force write 1
force write_address 00010
force din X"03"
run 2
force clk 0
force read_a 00010
force read_b 11101
run 2

# TEST 4: write/read R3
force reset 0
force clk 1 
force write 1
force write_address 00011
force din X"04"
run 2
force clk 0
force read_a 11100	
force read_b 00011
run 2

# TEST 5: write/read R4
force reset 0
force clk 1 
force write 1
force write_address 00100
force din X"05"
run 2
force clk 0
force read_a 00100
force read_b 11011
run 2

# TEST 6: write/read R5
force reset 0
force clk 1 
force write 1
force write_address 00101
force din X"06"
run 2
force clk 0
force read_a 11010
force read_b 00101
run 2

# TEST 7: write/read R6
force reset 0
force clk 1 
force write 1
force write_address 00110
force din X"07"
run 2
force clk 0
force read_a 00110
force read_b 11001
run 2

# TEST 8: write/read R7
force reset 0
force clk 1 
force write 1
force write_address 00111
force din X"08"
run 2
force clk 0
force read_a 11000
force read_b 00111
run 2

# TEST 9: write/read R8
force reset 0
force clk 1 
force write 1
force write_address 01000
force din X"09"
run 2
force clk 0
force read_a 01000
force read_b 10111
run 2

# TEST 10: write/read R9
force reset 0
force clk 1 
force write 1
force write_address 01001
force din X"0A"
run 2
force clk 0
force read_a 10110
force read_b 01001
run 2

# TEST 11: write/read R10
force reset 0
force clk 1 
force write 1
force write_address 01010
force din X"0B"
run 2
force clk 0
force read_a 01010
force read_b 10101
run 2

# TEST 12: write/read R11
force reset 0
force clk 1 
force write 1
force write_address 01011
force din X"0C"
run 2
force clk 0
force read_a 10100
force read_b 01011
run 2

# TEST 13: write/read R12
force reset 0
force clk 1 
force write 1
force write_address 01100
force din X"0D"
run 2
force clk 0
force read_a 01100
force read_b 10011
run 2

# TEST 14: write/read R13
force reset 0
force clk 1 
force write 1
force write_address 01101
force din X"0E"
run 2
force clk 0
force read_a 10010
force read_b 01101
run 2

# TEST 15: write/read R14
force reset 0
force clk 1 
force write 1
force write_address 01110
force din X"0F"
run 2
force clk 0
force read_a 01110
force read_b 10001
run 2

# TEST 16: write/read R15
force reset 0
force clk 1 
force write 1
force write_address 01111
force din X"10"
run 2
force clk 0
force read_a 10000
force read_b 01111
run 2

# TEST 17: write/read R16
force reset 0
force clk 1 
force write 1
force write_address 10000
force din X"11"
run 2
force clk 0
force read_a 10000
force read_b 01111
run 2

# TEST 18: write/read R17
force reset 0
force clk 1 
force write 1
force write_address 10001
force din X"12"
run 2
force clk 0
force read_a 01110
force read_b 10001
run 2

# TEST 19: write/read R18
force reset 0
force clk 1 
force write 1
force write_address 10010
force din X"13"
run 2
force clk 0
force read_a 10010
force read_b 01101
run 2

# TEST 20: write/read R19
force reset 0
force clk 1 
force write 1
force write_address 10011
force din X"14"
run 2
force clk 0
force read_a 01100
force read_b 10011
run 2

# TEST 21: write/read R20
force reset 0
force clk 1 
force write 1
force write_address 10100
force din X"15"
run 2
force clk 0
force read_a 10100
force read_b 01011
run 2

# TEST 22: write/read R21
force reset 0
force clk 1 
force write 1
force write_address 10101
force din X"16"
run 2
force clk 0
force read_a 01010
force read_b 10101
run 2

# TEST 23: write/read R22
force reset 0
force clk 1 
force write 1
force write_address 10110
force din X"17"
run 2
force clk 0
force read_a 10110
force read_b 01001
run 2

# TEST 24: write/read R23
force reset 0
force clk 1 
force write 1
force write_address 10111
force din X"18"
run 2
force clk 0
force read_a 01000
force read_b 10111
run 2

# TEST 25: write/read R24
force reset 0
force clk 1 
force write 1
force write_address 11000
force din X"19"
run 2
force clk 0
force read_a 11000
force read_b 00111
run 2

# TEST 26: write/read R25
force reset 0
force clk 1 
force write 1
force write_address 11001
force din X"1A"
run 2
force clk 0
force read_a 00110
force read_b 11001
run 2

# TEST 27: write/read R26
force reset 0
force clk 1 
force write 1
force write_address 11010
force din X"1B"
run 2
force clk 0
force read_a 11010
force read_b 00101
run 2

# TEST 28: write/read R27
force reset 0
force clk 1 
force write 1
force write_address 11011
force din X"1C"
run 2
force clk 0
force read_a 00100
force read_b 11011
run 2

# TEST 29: write/read R28
force reset 0
force clk 1 
force write 1
force write_address 11100
force din X"1D"
run 2
force clk 0
force read_a 11100
force read_b 00011
run 2

# TEST 30: write/read R29
force reset 0
force clk 1 
force write 1
force write_address 11101
force din X"1E"
run 2
force clk 0
force read_a 00010
force read_b 11101
run 2

# TEST 31: write/read R30
force reset 0
force clk 1 
force write 1
force write_address 11110
force din X"1F"
run 2
force clk 0
force read_a 11110
force read_b 00001
run 2

# TEST 32: write/read R31
force reset 0
force clk 1 
force write 1
force write_address 11111
force din X"20"
run 2
force clk 0
force read_b 00000
force read_b 11111
run 2

# end with a reset
force clk 1
force reset 1
force write 0
run 2
force read_a 11110
force read_b 11111
force reset 0
force clk 0
run 2




