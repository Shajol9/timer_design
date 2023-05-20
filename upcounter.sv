//-----------------------------------------------------------------------------
//
// Title       : Up Counter till 10101000110000000
// Design      : dffDesign_pet
// Author      : Mohammad Shazzad Hossain 
// Company     : 
//
//-----------------------------------------------------------------------------
//
// File        : c:\Users\shazz\Downloads\NTNU\MS_in_ESD\4th_semestar\Specialization_project\timer_design\dffDesign_pet\src\upcounter.sv
// Generated   : Mon Mar 27 14:35:34 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : Design of a simple up counter using posetive ege triggered asynchronous D flip flop.
//				 This countre counts up to 10101000110000000 which is 86400 ticks, so if each tick is
//				 one second it counts up till a day. 
//
//-----------------------------------------------------------------------------
`timescale 1us/ 1ns 
module upcounter (clk, pr, clr, out);
	input wire clk;
	input wire pr;
	input wire clr;
	output wire	[16:0] out;
	
	wire [16:0] fb;
	wire [16:0] i_wire;
	
	wand andedclr;
	
	const int n = 16;
	genvar i;
	
	wire and1, and2, nandout;
	generate
	for (i = 0; i<=n; i++) begin
		//int j = i;
		if (i == 0)begin
			dff di (.clk(clk),.pr_b(pr),.clr_b(andedclr),.d(fb[i]),.q_b(fb[i]),.q(i_wire[i]));
		end	else begin 
			dff di (.clk(fb[i-1]),.pr_b(pr),.clr_b(andedclr),.d(fb[i]),.q_b(fb[i]),.q(i_wire[i]));
		end
		assign out[i] = i_wire[i];
	end
	endgenerate	
	//Signal Genetarot circuit
	and G1 (and1,i_wire[7],i_wire[8]);
	and G2 (and2,i_wire[12],i_wire[14]);
	nand G3 (nandout,and1,and2,i_wire[16]);
	assign andedclr = clr;
	assign andedclr = nandout;

endmodule		 

	
/*	dff d0 (.clk(clk),.pr_b(pr),.clr_b(andedclr),.d(fb[0]),.q_b(fb[0]),.q(i_wire[0]));
	dff d1 (.clk(fb[0]),.pr_b(pr),.clr_b(andedclr),.d(fb[1]),.q_b(fb[1]),.q(i_wire[1]));
	dff d2 (.clk(fb[1]),.pr_b(pr),.clr_b(andedclr),.d(fb[2]),.q_b(fb[2]),.q(i_wire[2]));
	dff d3 (.clk(fb[2]),.pr_b(pr),.clr_b(andedclr),.d(fb[3]),.q_b(fb[3]),.q(i_wire[3]));
	dff d4 (.clk(fb[3]),.pr_b(pr),.clr_b(andedclr),.d(fb[4]),.q_b(fb[4]),.q(i_wire[4]));
	dff d5 (.clk(fb[4]),.pr_b(pr),.clr_b(clr),.d(fb[5]),.q_b(fb[5]),.q(i_wire[5]));
	dff d6 (.clk(fb[5]),.pr_b(pr),.clr_b(clr),.d(fb[6]),.q_b(fb[6]),.q(i_wire[6]));
	dff d7 (.clk(fb[6]),.pr_b(pr),.clr_b(clr),.d(fb[7]),.q_b(fb[7]),.q(i_wire[7]));
	dff d8 (.clk(fb[7]),.pr_b(pr),.clr_b(clr),.d(fb[8]),.q_b(fb[8]),.q(i_wire[8]));
	dff d9 (.clk(fb[8]),.pr_b(pr),.clr_b(clr),.d(fb[9]),.q_b(fb[9]),.q(i_wire[9]));
	dff d10 (.clk(fb[9]),.pr_b(pr),.clr_b(clr),.d(fb[10]),.q_b(fb[10]),.q(i_wire[10]));
	dff d11 (.clk(fb[10]),.pr_b(pr),.clr_b(clr),.d(fb[11]),.q_b(fb[11]),.q(i_wire[11]));
	dff d12 (.clk(fb[11]),.pr_b(pr),.clr_b(clr),.d(fb[12]),.q_b(fb[12]),.q(i_wire[12]));
	dff d13 (.clk(fb[12]),.pr_b(pr),.clr_b(clr),.d(fb[13]),.q_b(fb[13]),.q(i_wire[13]));
	dff d14 (.clk(fb[13]),.pr_b(pr),.clr_b(clr),.d(fb[14]),.q_b(fb[14]),.q(i_wire[14]));
	dff d15 (.clk(fb[14]),.pr_b(pr),.clr_b(clr),.d(fb[15]),.q_b(fb[15]),.q(i_wire[15]));
	dff d16 (.clk(fb[15]),.pr_b(pr),.clr_b(clr),.d(fb[16]),.q_b(fb[16]),.q(i_wire[16]));
	
	 
	
	for ( i = 0; i<=n; i++) begin
		assign out[i] = i_wire[i];
	end	  
	and G1 (and1,i_wire[7],i_wire[8]);
	and G2 (and2,i_wire[12],i_wire[14]);
	nand G3 (nandout,and1,and2,i_wire[16]);	*/
	