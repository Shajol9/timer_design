`timescale 1us/1ns

module PLSC_4b_tb;
	reg  [3:0] in;
	reg load, cten, clk, prs, clr; 
	wire [3:0] out;
	wire tc;
	
	
	PLSC_4b dut_PLSC(.in(in),.load(load),.cten(cten),.clk(clk),.prs(prs),.clr(clr),.out(out),.tc(tc));
	
	always begin
		#2 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,SyncCounter_4b_tb);
		cten = 1;
		clk = 0;
		load = 1;
		in = 4'b0100;
		prs = 0;
		clr = 1;
		//#4 cten = 0;
		$monitor ("clk time=",$time," out=%d, clr=%b", out,clr );
		#4 prs = 0; clr = 0; cten = 1; load = 0 ;
		#200  prs = 0; clr = 0; cten = 1;load = 1; in=4'b1010 ;
		#400	$finish;
		
	end
		
endmodule