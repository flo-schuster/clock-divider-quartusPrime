## Clock divider in Verilog, with Quartus Prime
This repository contains a clock divider with active low, asynchronous reset and a paramter COUNTER_SIZE to specify the amount of division.
The repository is part of my autodidactic learning of Verilog and git.

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