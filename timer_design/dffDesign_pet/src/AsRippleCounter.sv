`timescale 1ns/1ps

module AsRippleCounter (clk,prs,clr,out,wakeup);
	//input wire en;
	input wire clk;
	input wire prs;
	input wire clr;
	output wire [16:0] out;
	output wire wakeup;
	
	wire  [3:0] tctonc;  //[4:0]
	wire [3:0] andout;
	wire gnd;
	wire nandout;
	wire orclr;
	wire fb;
/*	
	RippleCounter_4b RC1 (.clk(clk),.prs(prs), .clr(clr), .out(out[3:0]), .tc(tctonc[0]));
	RippleCounter_4b RC2 (.clk(tctonc[0]), .prs(prs), .clr(clr), .out(out[7:4]),.tc(tctonc[1])); 
	RippleCounter_4b RC3 (.clk(tctonc[1]), .prs(prs), .clr(clr), .out(out[11:8]),.tc(tctonc[2])); 
	RippleCounter_4b RC4 (.clk(tctonc[2]), .prs(prs), .clr(clr), .out(out[15:12]),.tc(tctonc[3]));
	//ms_dff di (.d(fb), .clk(tctonc[3]), .ce(en), .clr(clr), .prs(prs), .q(out[16]) , .q_b(fb));
*/	
	RippleCounter_4b RC1 (.clk(clk),.prs(prs), .clr(clr), .out(out[3:0]), .tc(tctonc[0]));
	RippleCounter_4b RC2 (.clk(tctonc[0]), .prs(prs), .clr(clr), .out(out[7:4]),.tc(tctonc[1])); 
	RippleCounter_4b RC3 (.clk(tctonc[1]), .prs(prs), .clr(clr), .out(out[11:8]),.tc(tctonc[2])); 
	RippleCounter_4b RC4 (.clk(tctonc[2]), .prs(prs), .clr(clr), .out(out[15:12]),.tc(tctonc[3]));
	
	dff D0 (.d(fb), .clk(tctonc[3]), .clr_b(clr), .pr_b(prs), .q(out[16]), .q_b(fb));
	//ms_dff di (.d(fb), .clk(tctonc[3]), .ce(en), .clr(clr), .prs(prs), .q(out[16]) , .q_b(fb));
	
	assign wakeup = tctonc[0];
	
	
	/*
	//Signal Genetarot circuit
	and G1 (andout[0],out[7],out[8]);
	and G2 (andout[1],out[12],out[14]);
	nand G3 (nandout,andout[0],andout[1],out[16]);
	or G4 (orclr,clr,nandout);
	assign andedclr = nandout;
	
	
	//or (wclr, clr,out )
	dff D1 (.d(fb), .clk(nandout), .clr_b(clr), .pr_b(prs), .q(wakeup), .q_b(fb));
	*/
endmodule

	