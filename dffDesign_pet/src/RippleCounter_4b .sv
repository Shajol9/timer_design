`timescale 1us/ 1ns 
module RippleCounter_4b (clk, prs, clr, out, tc);
	input wire clk;
	input wire prs;
	input wire clr;
	output wire	[3:0] out;
	output wire tc;
	
	wire [3:0] fb;
	wire [3:0] i_wire;
	
	const int n = 3;
	genvar i;
	
	wire and1, and2, nandout;
	generate
	
	for (i = 0; i<=n; i++) begin
		if (i == 0)begin
			dff di (.clk(clk),.pr_b(prs),.clr_b(clr),.d(fb[i]),.q_b(fb[i]),.q(i_wire[i]));
		end	else begin 
			dff di (.clk(fb[i-1]),.pr_b(prs),.clr_b(clr),.d(fb[i]),.q_b(fb[i]),.q(i_wire[i]));
		end
		assign out[i] = i_wire[i];
	end

	endgenerate
	assign tc = fb[3];
	
endmodule