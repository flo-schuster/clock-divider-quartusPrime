/*
Copyright 2020 Florian Schuster
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
	http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

/*
This test bench provides a simple test for 4 clock dividers with counter sizes from 2 to 6.
It displays how many clock cycles every clock has advanced.
*/

//TODO: `timescale
module clock_divider_tb;

parameter TIME_TO_RUN = 5000;
parameter HALF_CLOCK_CYCLE = 5;
parameter MAX_CLK_CYCLES = TIME_TO_RUN / HALF_CLOCK_CYCLE;
parameter MAX_POSEDGES = MAX_CLK_CYCLES / 2;

reg clk;
reg reset_n;

integer clk_counter = 0;

integer clk_out0_counter = 0;
integer clk_out1_counter = 0;
integer clk_out2_counter = 0;
integer clk_out3_counter = 0;
integer clk_out4_counter = 0;

wire clk_out0;
wire clk_out1;
wire clk_out2;
wire clk_out3;
wire clk_out4;


	initial begin
		clk = 0;
		reset_n = 1;
				
		#(TIME_TO_RUN+1) $finish;
	end
	
	always begin
		#HALF_CLOCK_CYCLE clk = !clk; // advance clock
		
		if (clk_counter == MAX_POSEDGES) // if the TIME_TO_RUN is over do $display()
			//TODO: calculate frequencies and display them 
			// display the clock cycle count of all clocks
			$display("\n[Number of clock cycles]\n+-->\t clk[level=%b]:%d, clk0:%d, clk1:%d, clk2:%d, clk3:%d, clk4:%d\n",
						clk, clk_counter, clk_out0_counter, clk_out1_counter, clk_out2_counter, clk_out3_counter, clk_out4_counter);
	end
	
	always @ (posedge clk) begin
		clk_counter <= clk_counter + 1;  // count positive edges of the main clock
	end
	
	clock_divider #(.COUNTER_SIZE(2)) U0 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out0)
	);
	always @ (posedge clk_out0) begin
		clk_out0_counter <= clk_out0_counter + 1;
	end
	
	clock_divider #(.COUNTER_SIZE(3)) U1 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out1)
	);
	always @ (posedge clk_out1) begin
		clk_out1_counter <= clk_out1_counter + 1;
	end
	
	clock_divider #(.COUNTER_SIZE(4)) U2 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out2)
	);
	always @ (posedge clk_out2) begin
		clk_out2_counter <= clk_out2_counter + 1;
	end
	
	clock_divider #(.COUNTER_SIZE(5)) U3 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out3)
	);
	always @ (posedge clk_out3) begin
		clk_out3_counter <= clk_out3_counter + 1;
	end
	
	clock_divider #(.COUNTER_SIZE(6)) U4 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out4)
	);
	always @ (posedge clk_out4) begin
		clk_out4_counter <= clk_out4_counter + 1;
	end
	
endmodule 