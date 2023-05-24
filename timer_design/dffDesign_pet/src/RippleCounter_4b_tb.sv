`timescale 1us/1ns

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
		//en = 1;
		prs = 1;
		clr = 0;
		$monitor ("clk time= ", $time, "out=%d, tc=%d, clr= %b", out,tc,clr);
		#4 prs = 1; clr = 1;
		#3000 prs = 1; clr = 0;
		#1000	$finish;
		
	end
		
endmodule