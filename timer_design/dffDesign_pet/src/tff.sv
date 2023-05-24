`timescale 1 us / 1 ns

module tff (t,prs_b,clr_b,clk,q,q_b);
	
	input wire t;
	input wire prs_b;
	input wire clr_b;
	input wire clk;
	output wire q;
	output wire q_b;
	
	wire xorout;
	wire fb;
	
	xor G1 (xorout,t,fb);
	
	dff d0 (.clk(clk),.pr_b(prs_b),.clr_b(clr_b),.d(xorout),.q_b(q_b),.q(fb)); 
	
	assign q = fb;
		
	
endmodule
