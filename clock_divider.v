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
This module implements a clock divider.
It has a asynchronous low -active reset and a paramter COUNTER_SIZE to specify the amount of clock division.
*/
module clock_divider (
	input		clk_in,		// Clock input will get divided
	input		reset_n,		// low-active reset
	output	clk_out		// clock out is divided clock signal
);

	parameter COUNTER_SIZE = 8;					// specifies the size of the counter used for division
	reg [COUNTER_SIZE-1:0] counter;				// generate the counter accordng to COUNTER_SIZE
	assign clk_out = counter[COUNTER_SIZE-1];	// assign clock output to MSB of the counter
	
	initial counter = 0;								// initialize the counter with 0

	always @ (posedge clk_in, negedge reset_n) begin				// clock and asynchronous reset
		if (~reset_n) begin
			counter <= 0;
		end else if (counter == (2 ** COUNTER_SIZE) -1)	begin		// set counter to 0 when at max value
			counter <= 0;
		end else begin
			counter <= counter + 1'b1;										// counter++
		end
	end
endmodule