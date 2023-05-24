`timescale 1us/1ns

module ms (d, clk, clr_b, prs_b , q , q_b); // active low clear and preset clr_b prs_b 
	input wire d;
	input wire clk;
	input wire clr_b;
	input wire prs_b;
//	input wire ce;
	output wire q;
	output wire q_b;
	
	wire d_b, clk_b;
	wire [5:0] icw; //inter connect wire 
	
	//and G10 (enclk_b,clk,ce)
	not G1 (d_b,d);
	not G2 (clk_b,enclk);
	
	nand G3 (icw[0],d,clk_b,clr_b);
	nand G4 (icw[1],d_b,clk_b,prs_b);
	nand G5 (icw[2],prs_b,icw[0],icw[3]);
	nand G6 (icw[3],clr_b,icw[1],icw[2]);
	nand G7 (icw[4],icw[2],clk);
	nand G8 (icw[5],icw[3],clk);
	nand G9 (q,icw[4],q_b,prs_b);
	nand G10 (q_b,icw[5],q,clr_b);
	
	
endmodule