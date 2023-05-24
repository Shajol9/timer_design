`timescale 1us/ 1ns 
module SC_4b ( clk, cten, prs, clr, out, tc );
	input wire clk;
	input wire cten;
	input wire prs;
	input wire clr;
	output wire	[3:0] out;
	output wire tc;
	
	wire [3:0] connect_q;
	wire [3:0] connect_qb;
	

	wire [7:0] andout;
	wire [2:0]xorout;
	
	//combinational logic for D0
	and G8 (andout[4],connect_qb[0],cten );	

	//combinational logic for D1
	xor G1 (xorout[0], connect_q[1], connect_q[0]);
	and	G9 (andout[5],xorout[0],cten);
	
	//combinational logic for D2
	and G2 (andout[0],connect_q[0],connect_q[1]);
	xor G3 (xorout[1],andout[0],connect_q[2]);
	and G10 (andout[6],xorout[1],cten);

	
	//combinational logic for D3
	and G4 (andout[1],connect_q[0],connect_q[1],connect_q[2]);
	xor G5 (xorout[2],andout[1],connect_q[3]);	
	and G11 (andout[7],xorout[2],cten);
	
	ms D0 (.clk(clk),.prs_b(prs),.clr_b(clr),.d(andout[4]),.q(connect_q[0]),.q_b(connect_qb[0]));
	ms D1 (.clk(clk),.prs_b(prs),.clr_b(clr),.d(andout[5]),.q(connect_q[1]),.q_b(connect_qb[1]));
	ms D2 (.clk(clk),.prs_b(prs),.clr_b(clr),.d(andout[6]),.q(connect_q[2]),.q_b(connect_qb[2]));
	ms D3 (.clk(clk),.prs_b(prs),.clr_b(clr),.d(andout[7]),.q(connect_q[3]),.q_b(connect_qb[3]));	
	
	and G6 (andout[2],connect_q[0],connect_q[1],connect_q[2]);
	and G7 (andout[3],andout[2],connect_q[3],cten);
	assign tc = andout[3];
	assign out = connect_q;
	
endmodule