module clock_divider_tb;

reg clk;
reg reset_n;

reg clk_counter;

wire clk_out0;
wire clk_out1;
wire clk_out2;
wire clk_out3;
wire clk_out4;


	initial begin
		clk = 0;
		reset_n = 1;
				
		#5000 $finish;
	end
	
	always begin
		#5 clk = !clk;
	end
	
	/*
	always @ (posedge clk) begin
		clk_counter <= clk_counter + 1;
		if ((clk_counter % 2 = 0) 
			and (
	end
	*/
	
	
	clock_divider #(.COUNTER_SIZE(2)) U0 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out0)
	);
	
	clock_divider #(.COUNTER_SIZE(3)) U1 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out1)
	);
	
	clock_divider #(.COUNTER_SIZE(4)) U2 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out2)
	);
	
	clock_divider #(.COUNTER_SIZE(5)) U3 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out3)
	);
	
	clock_divider #(.COUNTER_SIZE(6)) U4 (
		.clk_in(clk),
		.reset_n(reset_n),
		.clk_out(clk_out4)
	);
	
endmodule 