
module configurable_register #(
    parameter SIZE = 8  // Default size of the register is 8 bits
)(
    input wire clk,         // Clock signal
    input wire reset,       // Asynchronous reset signal
    input wire [SIZE-1:0] d,  // Data input
    input wire load,        // Load enable signal
    output reg [SIZE-1:0] q   // Data output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= {SIZE{1'b0}};  // Reset the register to all zeros
    end else if (load) begin
        q <= d;  // Load the data into the register
    end
end

endmodule



module configurable_shift_register #(
    parameter SIZE = 8, shift_size = 2   // Default size of the register is 8 bits
)(
    input wire clk,         // Clock signal
    input wire reset,       // Asynchronous reset signal
    input wire [SIZE-1:0] d,  // Data input
    input wire load, shift,        // Load enable signal
    output reg [SIZE-1:0] q,   // Data output
    output wire [shift_size-1:0] shift_out   // Data output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= {SIZE{1'b0}};  // Reset the register to all zeros
    end else if (load) begin
        q <= d;  // Load the data into the register
    end else if (shift)begin
        q <= {{shift_size{1'b0}}, q[SIZE - 1 : shift_size]};
    end
end

assign shift_out = q[shift_size - 1 : 0];

endmodule



module sellector #(
    parameter input_size = 8
)(
    input wire [input_size - 1 : 0] x, xbar, x_2,
    input wire one, neg, zero,
    output wire [input_size - 1 : 0] out
);


assign out =zero ?{input_size{1'b0}} : one ? (neg ? xbar : x) : x_2; 


endmodule


module recoder(
    input wire x_1, x_0, c_in,
    input wire one, neg, zero, c_out
);

    assign one = x_0 ^ c_in;
    assign neg = ( (x_1 & c_in) | (x_1 & x_0) );
    assign c_out = neg;
    assign zero = ( (x_1 & x_0 & c_in) | ( ~x_1 & ~x_0 & ~c_in));


endmodule


module up_counter (clk,rst,enable ,out);

   input clk, rst , enable;
   output reg [2:0] out;

	always @(posedge clk, posedge rst) begin
		if (rst) begin
		out <= 3'b0 ;
		end 
		else if (enable) begin
		out <= out + 1'b1;
		end
	end

endmodule

