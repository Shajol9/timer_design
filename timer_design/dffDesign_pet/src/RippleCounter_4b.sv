`timescale 1us/ 1ns 
module RippleCounter_4b ( clk, prs, clr, out, tc);
	//input wire en;
	input wire clk;
	input wire prs;
	input wire clr;
	output wire	[3:0] out;
	output wire tc;
	
	wire [3:0] fb;
	wire [3:0] i_wire;
	wire [1:0] andout;
	wire nandout;
	
	const int n = 3;
	genvar i;
	
	generate
	
	for (i = 0; i<=n; i++) begin
		if (i == 0)begin
			dff di ( .d(fb[i]), .clk(clk), .pr_b(prs) , .clr_b(clr) , .q(i_wire[i]), .q_b(fb[i]));
			//ms_dff di (.d(fb[i]), .clk(clk), .ce(en), .clr(clr), .prs(prs), .q(i_wire[i]) , .q_b(fb[i]));
		end	else begin 
			//ms_dff di (.d(fb[i]), .clk(fb[i-1]), .ce(en), .clr(clr), .prs(prs), .q(i_wire[i]) , .q_b(fb[i]));
			dff di ( .d(fb[i]), .clk(fb[i-1]), .pr_b(prs) , .clr_b(clr) , .q(i_wire[i]), .q_b(fb[i]));
		end
		assign out[i] = i_wire[i];
	end

	endgenerate	
	
	and (andout[0],out[0],out[1]);
	and (andout[1],andout[0],out[2],out[3]);
	
	assign tc = andout[1];
	
endmodule