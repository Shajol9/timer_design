`timescale 1us/ 1ns 
module PLSC_4b (in, clk, cten, load, prs, clr, out, tc );
	input wire [3:0] in;
	input wire clk;
	input wire cten;
	input wire load;
	input wire prs;
	input wire clr;
	output wire	[3:0] out;
	output wire tc;
	
	wire [3:0] connect_q;
	wire [3:0] connect_qb;
	
	wire [3:0] logical_in;
	wire [3:0] loaded_in;
	wire [3:0] or_in;
	wire and_cten;
	wire load_b;
	wire [4:0] andout;
	wire [2:0]xorout;
	
	//load enable circuit for parallel loading
	not G0 (load_b,load);
	and G8 (and_cten, cten, load_b);
	
	and G9 (loaded_in[0], load, in[0]);
	and G10 (loaded_in[1], load, in[1]);
	and	G11 (loaded_in[2], load, in[2]);
	and G12 (loaded_in[3], load, in[3]);
	
	//contol logic for D0
	and G19 (logical_in[0], and_cten, connect_qb[0]);
	or G20 (or_in[0], logical_in[0], loaded_in[0]);
	
	//combinational logic for D1
	xor G1 (xorout[0], connect_q[1], connect_q[0]);
	and G17 (logical_in[1], and_cten,xorout[0]);
	or G18 (or_in[1], logical_in[1], loaded_in[1]);
	
	//combinational logic for D2
	and G2 (andout[0],connect_q[0],connect_q[1]);
	xor G3 (xorout[1],andout[0],connect_q[2]);
	and G15 (logical_in[2], and_cten,xorout[1]);
	or G16 (or_in[2], logical_in[2], loaded_in[2]);
	
	//combinational logic for D3
	and G4 (andout[1],connect_q[0],connect_q[1],connect_q[2]);
	xor G5 (xorout[2],andout[1],connect_q[3]);	
	and G13 (logical_in[3], and_cten,xorout[2]);
	or G14 (or_in[3], logical_in[3], loaded_in[3]);
	
	ms_dff D0 (.clk(clk),.ce(and_cten),.prs(prs),.clr(clr),.d(or_in[0]),.q(connect_q[0]),.q_b(connect_qb[0]));
	ms_dff D1 (.clk(clk),.ce(and_cten),.prs(prs),.clr(clr),.d(or_in[1]),.q(connect_q[1]),.q_b(connect_qb[1]));
	ms_dff D2 (.clk(clk),.ce(and_cten),.prs(prs),.clr(clr),.d(or_in[2]),.q(connect_q[2]),.q_b(connect_qb[2]));
	ms_dff D3 (.clk(clk),.ce(and_cten),.prs(prs),.clr(clr),.d(or_in[3]),.q(connect_q[3]),.q_b(connect_qb[3]));	
	
	and G6 (andout[2],connect_q[0],connect_q[1],connect_q[2]);
	and G7 (andout[3],andout[2],connect_q[3],cten);
	assign tc = andout[3];
	assign out = connect_q;
	
endmodule