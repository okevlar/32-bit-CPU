# add all the signals to the wave window
# change radix to hex maybe
add wave -radix unsigned d_in
add wave -radix unsigned read_d
add wave -radix unsigned out_d
add wave reset
add wave clk
add wave data_write
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
# test reset
# test write
# test read
# DO ABOVE FOR 8 REGISTERS
# test reset

# test reset
force clk 1
force reset 1
run 2
force reset 0
force clk 0
run 2

# test write R0
force reset 0
force clk 1
force data_write 1
force read_d 00000
force d_in X"01"
run 2
force clk 0
force data_write 0
run 2

# test read R0
force reset 0
force clk 1
force read_d 00000
run 2
force clk 0
run 2

# test write R1
force reset 0
force clk 1
force data_write 1
force read_d 00001
force d_in X"02"
run 2
force clk 0
force data_write 0
run 2

# test read R1
force reset 0
force clk 1
force read_d 00001
run 2
force clk 0
run 2

# test write R2
force reset 0
force clk 1
force data_write 1
force read_d 00010
force d_in X"03"
run 2
force clk 0
force data_write 0
run 2

# test read R2
force reset 0
force clk 1
force read_d 00010
run 2
force clk 0
run 2

# test write R3
force reset 0
force clk 1
force data_write 1
force read_d 00011
force d_in X"04"
run 2
force clk 0
force data_write 0
run 2

# test read R3
force reset 0
force clk 1
force read_d 00011
run 2
force clk 0
run 2

# test write R4
force reset 0
force clk 1
force data_write 1
force read_d 00100
force d_in X"05"
run 2
force clk 0
force data_write 0
run 2

# test read R4
force reset 0
force clk 1
force read_d 00100
run 2
force clk 0
run 2

# test write R5
force reset 0
force clk 1
force data_write 1
force read_d 00101
force d_in X"06"
run 2
force clk 0
force data_write 0
run 2

# test read R5
force reset 0
force clk 1
force read_d 00101
run 2
force clk 0
run 2

# test write R6
force reset 0
force clk 1
force data_write 1
force read_d 00110
force d_in X"07"
run 2
force clk 0
force data_write 0
run 2

# test read R6
force reset 0
force clk 1
force read_d 00110
run 2
force clk 0
run 2

# test write R7
force reset 0
force clk 1
force data_write 1
force read_d 00111
force d_in X"08"
run 2
force clk 0
force data_write 0
run 2

# test read R7
force reset 0
force clk 1
force read_d 00111
run 2
force clk 0
run 2

# test write R8
force reset 0
force clk 1
force data_write 1
force read_d 01000
force d_in X"09"
run 2
force clk 0
force data_write 0
run 2

# test read R8
force reset 0
force clk 1
force read_d 01000
run 2
force clk 0
force reset 1
run 2




