`timescale 1ns/1ps

module counter (en,clk,prs,clr,out,tcc);
	input wire en;
	input wire clk;
	input wire prs;
	input wire clr;
	output wire [19:0] out;
	output wire tcc;
	
	wire  [4:0] tctonc;  //[4:0]
	wire [3:0] andout;
	wire orclr;
	/*wire [4:0] in; 
	wire [4:0] nc_in;
	 
	
	//for trigaring input current stage with "in" and next stage with nc_in synchronously.
	and G1 (in [0], en, clk);
	and G2 (nc_in [0], tctonc[0], en);
	
	and G3 (in [1], nc_in [0], clk);
	and G4 (nc_in [1], tctonc[1], nc_in [0]);
	
	and G5 (in [2], nc_in [1], clk);
	and G6 (nc_in [2], tctonc[2], nc_in [1]);
	
	and G7 (in [3], nc_in [2], clk);
	and G8 (nc_in [3], tctonc[3], nc_in [2]); 
	
	and G9 (in [4], nc_in [3], clk);
	*/
	
	//RippleCounter_4b RC1 (.clk(clk), .prs(prs), .clr(clr), .out(out[3:0]), .tc(tctonc));
	//RippleCounter_4b RC2 (.clk(tctonc), .prs(prs), .clr(clr), .out(out[7:4]),.tc(tc)); 
	
	
	GrayCounter_4b GC1 (.cten(en), .clk(clk), .prs(prs), .clr(orclr), .out(out[3:0]), .tc(tctonc[0]));
	GrayCounter_4b GC2 (.cten(tctonc[0]), .clk(clk), .prs(prs), .clr(orclr), .out(out[7:4]), .tc(tctonc[1]));
	GrayCounter_4b GC3 (.cten(tctonc[1]), .clk(clk), .prs(prs), .clr(orclr), .out(out[11:8]), .tc(tctonc[2]));
	GrayCounter_4b GC4 (.cten(tctonc[2]), .clk(clk), .prs(prs), .clr(orclr), .out(out[15:12]), .tc(tctonc[3]));
	GrayCounter_4b GC5 (.cten(tctonc[3]), .clk(clk), .prs(prs), .clr(orclr), .out(out[19:16]), .tc(tctonc[4]));
	
	//ms_dff D0 (.d(tctonc[3]), .clk(clk), .ce(en), .clr(clr), .prs(prs), .q(out[16]), .q_b(tctonc[4]));
	
	/*//clear and signal generator circuit
	and G1 (andout[0], out[6], out[8], out[11]);
	and G2 (andout[1], andout[0], out[12], out[13]);
	and G3 (andout[2], andout[1], out[14], out[15]);
	and G4 (andout[3], andout[2], out[16]);
	//or G5 (orclr,clr,andout[3]);
	*/ 
	wire nandout;
	nand G1  (nandout, out[0], out[1], out[2], out[3], out[4], out[5], out[7], out[9],out[10]);
	assign orclr = nandout & (out[6] & out[8] & out[11] & out[12] & out[13] & out[14] & out[15] & out[16]) | clr;
	
	//assign orclr = clr;
	//assign orclr = andout;
	//assign orclr = clr;
	assign tcc = orclr; 
	
	
	/* 
	//fro gray to binary conversion 
	wire [7:0] wout;
	wire [6:0] xorout;
	
	//fro gray to binary conversion manual
	xor G1 (xorout[0], wout [0], xorout[1]);
	xor G2 (xorout[1], wout [1], xorout[2]);
	xor G3 (xorout[2], wout [2], xorout[3]);
	xor G4 (xorout[3], wout [3], xorout[4]);
	xor G5 (xorout[4], wout [4], xorout[5]);
	xor G6 (xorout[5], wout [5], xorout[6]);
	xor G7 (xorout[6], wout [6], wout[7]);
	
	assign out [6:0] = 	xorout[6:0];
	assign out [7] = wout[7];
	/*
	//fro gray to binary conversion	in loop but dosen't work 
	generate
		genvar i;
		for (i=0;i==7;i++) begin
			if (i<6) begin
				xor gi (xorout[i], wout [i], xorout[i+1]);
				assign out [i] = xorout[i];
			end else if (i == 6) begin
			   	xor gi (xorout[i], wout [i], wout[i+1]);
				assign out [i] = xorout[i];
			end else begin
				assign out [i] = wout[i];
			end
		end
		
	endgenerate
	*/
	
endmodule

	