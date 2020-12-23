## Clock divider in Verilog, with Quartus Prime
This repository contains a clock divider with active low, asynchronous reset and a paramter COUNTER_SIZE to specify the amount of division.
The repository is part of my autodidactic learning of Verilog and git.

The test bench `clock_divider_tb.v` lets you investigate the clock signals from different clock dividers U0-U4. They each use different values for COUNTER_SIZE.
It also generates a output like the following, showing how many clock cycles have advanced for each clock.

```
# [Number of clock cycles]
# +-->	 clk[level=0]:        500, clk0:        125, clk1:         63, clk2:         31, clk3:         16, clk4:          8
```

![Wave View](/clock_divider_tb_waves.JPG?raw=true "ModelSim wave view of the divided clock signals coming from U0-U4.")



### IDE & Board
- HDL: Verilog
- IDE: Quartus Prime Lite 18.1.0
- Devide Family: Intel Cyclone 10 LP
- Device: 10CL025YU256C8G
- Board: Trenz CYC1000 (TEI0003)
  - Resources + Datasheet: https://wiki.trenz-electronic.de/display/PD/TEI0003+Resources

### How to setup the project
1. Open the file `clock_divider.qpf` in Quartus Prime
2. Run the script `setup_clock_divider.tcl` to initialy configure the project
