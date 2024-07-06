`timescale 1ns/1ns

module testbench();

	reg clk,rst;
	reg [7:0]  x , y = 8'b0;
	wire[9:0] recoded_output;
    wire done;

	radix4_recoder  SR4_TOP_Init ( clk, rst, x, y, recoded_output,done);

	always #20 clk = ~clk; 

	initial begin
		x = 8'b00101100;
		y = 8'b01110010;
		clk=0;
		rst=1;
		#21
		rst=0;
		#320
		$stop;
	end

endmodule
