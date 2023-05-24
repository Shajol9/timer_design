`timescale 1us/ 1ns 
module SCwith8bGC (clk, en, prs, clr, out, wakeup);
	input wire clk;
	input wire en;
	input wire prs;
	input wire clr;
	output wire	[19:0] out;
	output wire wakeup;
	
	wire [3:0] tctonc;
	wire gnd, fb;
	wire [2:0] andout;
	wire orclr;
	
	GrayCounter_4b SC1 (.cten(en), .clk(clk), .prs(prs), .clr(orclr), .out(out[3:0]), .tc(tctonc[0]));
	GrayCounter_4b SC2 (.cten(tctonc[0]), .clk(clk), .prs(prs), .clr(orclr), .out(out[7:4]), .tc(tctonc[1]));
	GrayCounter_4b SC3 (.cten(tctonc[1]), .clk(clk), .prs(prs), .clr(orclr), .out(out[11:8]), .tc(tctonc[2]));
	SyncCounter_4b SC4 (.cten(tctonc[2]), .clk(clk), .prs(prs), .clr(orclr), .out(out[15:12]), .tc(tctonc[3]));
	SyncCounter_4b SC5 (.cten(tctonc[3]), .clk(clk), .prs(prs), .clr(orclr), .out(out[19:16]), .tc(gnd));
	
	//signal generator for clear and wakeup.
	and G1 (andout[0],out[16],out[14],out[12]);
	and G2 (andout[1],out[8],out[6],out[7]);
	and G3 (andout[2],andout[0],andout[1]);
	or G4 (orclr, andout[2],clr);
	
	//by changing the connection of .d(andout[1]), .ce(en) and .clr(clr) we can have a single period puls, 
	//we can clere the value according to our need.
	wire wclr;
	or G5 (wclr, clr,tctonc[1]);
	ms_dff D0 (.clk(clk),.ce(andout[2]),.prs(andout[2]),.clr(wclr),.d(fb),.q(wakeup),.q_b(fb)); 
	
	
	
	
endmodule