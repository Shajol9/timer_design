`timescale 1us/1ns

module GrayCounter_4b (cten,clk,prs,clr,out,tc);
	
	input wire cten;
	input wire clk;
	input wire prs;
	input wire clr;
	output wire [3:0] out;
	output wire tc;
	
	
	wire [3:0] connect_q;
	wire [3:0] connect_qb;
		
	wire [14:0] andout;
	wire andoutl;
	wire [3:0] orout;
	wire norout; 
	//wire [1:0] xnorout;
	//wire  	   xorout;	
	
	//comibinational feedback logic for 1st dff	D3
	and G1 (andout[0],connect_q[2],connect_qb[1],connect_qb[0]);
	and G2 (andout[1],connect_q[3],connect_q[0]);
	and G3 (andout[2],connect_q[3],connect_q[1]);
	or  G4 (orout[0],andout[0],andout[1],andout[2]); 
	
	//comibinational feedback logic for 2nd dff	D2
	and G5 (andout[3],connect_qb[3],connect_q[1],connect_qb[0]);
	and G6 (andout[4],connect_q[2],connect_qb[1]);
	and G7 (andout[5],connect_q[2],connect_q[0]);
	or  G8 (orout[1],andout[3],andout[4],andout[5]);
	
	//comibinational feedback logic for 3rd dff	D1 
	and G9 (andout[6],connect_q[1],connect_qb[0]);
	and G10 (andout[10],connect_qb[3],connect_qb[2],connect_q[0]);
	//xnor G10 (xnorout[0],connect_q[3],connect_q[2]);
	and G11 (andout[7],connect_q[3],connect_q[2],connect_q[0]);
	or  G12 (orout[2],andout[6],andout[7],andout[10]);
	
	//comibinational feedback logic for 4th dff	D0
	//xnor G13 (xnorout[1],connect_q[3],connect_q[1]); 
	and	G13 (andout[11],connect_qb[3],connect_qb[2],connect_qb[1]);
	and G14 (andout[8],connect_q[3],connect_q[2],connect_qb[1]);
	//xor G15	(xorout,connect_q[3],connect_q[1]);	 
	and G16 (andout[9],connect_qb[3],connect_q[2],connect_q[1]);
	and G15 (andout[12],connect_q[3],connect_qb[2],connect_q[1]);
	or  G17 (orout[3],andout[8],andout[9],andout[11],andout[12]);
	
	// clock enable using cten 
	//and G18 (andout[13],cten,clk);
	
	ms_dff D0 (.clk(clk),.ce(cten),.prs(prs),.clr(clr),.d(orout[3]),.q(connect_q[0]),.q_b(connect_qb[0]));
	ms_dff D1 (.clk(clk),.ce(cten),.prs(prs),.clr(clr),.d(orout[2]),.q(connect_q[1]),.q_b(connect_qb[1]));
	ms_dff D2 (.clk(clk),.ce(cten),.prs(prs),.clr(clr),.d(orout[1]),.q(connect_q[2]),.q_b(connect_qb[2]));
	ms_dff D3 (.clk(clk),.ce(cten),.prs(prs),.clr(clr),.d(orout[0]),.q(connect_q[3]),.q_b(connect_qb[3]));
	
	/*
	dff D0 (.clk(andout[13]),.pr_b(prs),.clr_b(clr),.d(orout[3]),.q(connect_q[0]),.q_b(connect_qb[0]));
	dff D1 (.clk(andout[13]),.pr_b(prs),.clr_b(clr),.d(orout[2]),.q(connect_q[1]),.q_b(connect_qb[1]));
	dff D2 (.clk(andout[13]),.pr_b(prs),.clr_b(clr),.d(orout[1]),.q(connect_q[2]),.q_b(connect_qb[2]));
	dff D3 (.clk(andout[13]),.pr_b(prs),.clr_b(clr),.d(orout[0]),.q(connect_q[3]),.q_b(connect_qb[3]));
	*/
		
	assign out = connect_q;
	
	// triger count signal generator for next counter.
	nor G19 (norout, connect_q[0],connect_q[1],connect_q[2]);
	and G20 (andout[13], norout, connect_q[3],cten);
	assign tc = andout[13];
	
	
endmodule
