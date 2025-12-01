###############################################
# SDC for 8x8 → 16-bit multiplier (40 MHz)
###############################################

# --- Clock ---
create_clock -name clk -period 12.5 [get_ports clk]

# --- Input Delay (50%) ---
# Data arrives 6.25 ns after clock edge
set_input_delay 6.25 -clock clk [get_ports {a[*] b[*]}]

# --- Output Delay (75%) ---
# External device requires valid output by 18.75 ns
set_output_delay 9.375 -clock clk [get_ports {y[*]}]

# --- Reset is asynchronous — declare false path ---
set_false_path -from [get_ports rst_n]

###############################################

