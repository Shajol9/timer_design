`timescale 1ns/1ps

module GrayCounter_4b_tb;
	reg  cten, clk, prs, clr; 
	wire [3:0] out;
	wire tc;
	
	GrayCounter_4b dut_GC(.cten(cten),.clk(clk),.prs(prs),.clr(clr),.out(out),.tc(tc));
	
	always begin
		#2 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,GrayCounter_4b_tb);
		cten = 0;
		clk = 0;
		prs = 1;
		clr = 0;
		$monitor ("clk time= ", $time, "out=%d, clr= %b", out,clr );
		#4 prs = 1; clr = 1; cten = 1;
		#200  prs = 1; clr = 1; cten = 0;
		#400	$finish;
		
	end
		
endmodule