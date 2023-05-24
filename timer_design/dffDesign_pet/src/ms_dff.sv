`timescale 1us/1ns

module ms_dff (d, clk, ce, clr, prs, q , q_b);  
	input wire d;
	input wire clk;
	input wire clr;
	input wire ce;
	input wire prs;
	output wire q;
	output wire q_b;
	
	wire d_b, clk_b;
	wire [5:0] icw; //inter connect wire 
	
	not G1 (d_b,d);
	not G2 (clk_b,clk);
	
	and G3 (icw[0], d, clk_b,ce);
	and G4 (icw[1], d_b, clk_b,ce);
	nor G5 (icw[2], icw[3], icw[0],prs);
	nor G6 (icw[3], icw[2], icw[1],clr); 
	and G7 (icw[4], icw[2], clk);
	and G8 (icw[5], icw[3], clk);
	nor G9 (q, icw[4], q_b);
	nor G10 (q_b, icw[5], q);
	
endmodule
