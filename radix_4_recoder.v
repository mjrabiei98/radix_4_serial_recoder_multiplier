module radix4_recoder_dp#( parameter input_size = 8 )(
    input clk, rst,
    input [input_size-1:0] x, y, 
    input load_x, load_y, shift_y, load_c, load_xy_reg, load_rec_reg,load_xy, count_en,
    output [2:0] cnt,
    output [input_size+1 : 0] out );


    wire [input_size-1 : 0] xreg_out, yreg_out;
    wire [input_size-1 : 0] sellector_out;
    wire [input_size-1 : 0] temp;
    wire creg_out, recoder_cout, rec_one, rec_neg, rec_zero;
    wire [1 : 0] y_shift_out;
    wire [2:0] rec_reg_out;

    configurable_register x_reg (clk, rst, x, load_x, xreg_out);
    configurable_register #(1) c_reg (clk, rst, recoder_cout, load_c, creg_out);
    configurable_shift_register y_shift_reg (clk, rst, y, load_y, shift_y, yreg_out, y_shift_out);
    recoder r1(y_shift_out[1],y_shift_out[0], creg_out, rec_one, rec_neg, rec_zero ,recoder_cout);

    configurable_register #(3) rec_reg(clk, rst, {rec_one, rec_neg, rec_zero}, load_rec_reg, rec_reg_out);
    sellector s1(x,~x, x <<1, rec_one, rec_neg, rec_zero, sellector_out);
    up_counter counter_3bit(clk , rst , count_en , cnt);

    configurable_register xy_reg (clk, rst, sellector_out, load_xy, temp);
    assign out = {temp[input_size-1],temp[input_size-1],temp};



endmodule

module radix4_recoder_controller(
    input clk, rst,
    input [2:0] cnt, 
    output reg load_x, load_y, shift_y, load_c, load_xy_reg, load_rec_reg,load_xy, count_en, done);
          
	reg [1:0] pstate;
	reg [1:0] nstate;

	parameter [1:0] load_state 	 = 2'b00;
	parameter [1:0] recode_state = 2'b01;
	parameter [1:0] finish_state = 2'b10;

	
	always @(posedge clk) begin
		if (rst) pstate <= load_state;
		else 	 pstate <= nstate;
	end		


    always @(pstate, cnt) begin
		{load_x, load_y, shift_y, load_c, load_xy_reg, load_rec_reg,load_xy, count_en,done} = 9'b0;

		case (pstate) 
			load_state : begin
                load_x = 1'b1;
                load_y = 1'b1;
                nstate = recode_state;
			end
			recode_state : begin
                shift_y = 1'b1;
                load_c = 1'b1;
                load_rec_reg = 1'b1;
                load_xy = 1'b1;
                count_en = 1'b1;
                if (cnt == 3'd011)
                    nstate = finish_state;
                else
                    nstate = recode_state;
			end
			finish_state : begin 
                done = 1'b1;
                nstate = finish_state;
			end	
      endcase
   end

endmodule


module radix4_recoder#(parameter input_size = 8)(input clk, rst, input [input_size-1 : 0 ]x, y, output [input_size + 1 : 0 ]Recoder_Out, output done);


    wire [2:0] cnt; 
    wire load_x, load_y, shift_y, load_c, load_xy_reg, load_rec_reg,load_xy, count_en;

    
    radix4_recoder_controller controller(clk, rst, cnt, load_x, load_y, shift_y, load_c, load_xy_reg, load_rec_reg,load_xy, count_en, done);

    radix4_recoder_dp datapath(
    clk, rst, x, y, 
    load_x, load_y, shift_y, load_c, load_xy_reg, load_rec_reg,load_xy, count_en,
    cnt,Recoder_Out);


endmodule