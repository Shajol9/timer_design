`timescale 1ns/1ps

module RippleCounter_4b_tb;
	reg  clk, prs, clr; 
	wire [3:0] out;
	wire tc;
	
	RippleCounter_4b dut_RC (.clk(clk), .prs(prs),.clr(clr),.out(out),.tc(tc));
	
	always begin
		#2 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,RippleCounter_4b_tb);
		clk = 0;
		prs = 1;
		clr = 0;
		$monitor ("clk time= ", $time, "out=%d, tc=%d, clr= %b", out,tc,clr);
		#4 prs = 1; clr = 1;
		
		#4000	$finish;
		
	end
		
endmodule