`timescale 1us/1ns

module counter (en,clk,prs,clr,out,tc, count_triger);
	input wire en;
	input wire clk;
	input wire prs;
	input wire clr;
	output wire [7:0] out;
	output wire tc;
	output wire count_triger;
	
	wire tctonc;
	

	
	//RippleCounter_4b RC1 (.clk(clk), .prs(prs), .clr(clr), .out(out[3:0]), .tc(tctonc));
	//RippleCounter_4b RC2 (.clk(tctonc), .prs(prs), .clr(clr), .out(out[7:4]),.tc(tc));
	GrayCounter_4b GC1 (.cten(en),.clk(clk),.prs(prs),.clr(clr),.out(out[3:0]),.tc(tcronc));
	GrayCounter_4b GC2 (.cten(tctonc),.clk(clk),.prs(prs),.clr(clr),.out(out[7:4]),.tc(tc)); 
	
	assign count_triger = tc;
	/*
	//fro gray to binary conversion 
	wire [7:0] wout;
	wire [6:0] xorout;
	
	//fro gray to binary conversion
	generate
		genvar i;
		for (i=7;i<=0;i--) begin
			if (i == 7) begin
				assign out [i] = wout [i];
			end else if (i == 6) begin
				xor gi (xorout[i], wout[i], wout[i+1]);
				assign  out [i] = xorout [i];
			end else begin
				xor gi (xorout[i], wout[i], xorout[i+1]);
				assign  out [i] = xorout [i];
			end
		end
		
	endgenerate
*/	
	
endmodule

	