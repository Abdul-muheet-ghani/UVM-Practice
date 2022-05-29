vlib work && vlog '-timescale' '1ns/1ns' 
vsim +access+r +read +A_value=1
run -all
exit
