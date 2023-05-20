`timescale 1us/ 1ns 

module fd1hz (clk, pr, clr, out);
	input wire clk;
	input wire pr;
	input wire clr;
	output wire	 out;
	
	wire [14:0] fb;
	wire [14:0] i_wire;	 
	
	genvar i;
	generate
		for (i=0; i<15; i++) begin
			if (i == 0)begin
				dff di (.clk(clk),.pr_b(pr),.clr_b(clr),.d(fb[i]),.q_b(fb[i]),.q(i_wire[i]));
		end	else begin 
				dff di (.clk(i_wire[i-1]),.pr_b(pr),.clr_b(clr),.d(fb[i]),.q_b(fb[i]),.q(i_wire[i]));
		end
	end
	endgenerate
	assign out = i_wire [14];
endmodule