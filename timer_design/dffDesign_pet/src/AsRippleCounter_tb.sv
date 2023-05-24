`timescale 1ns/1ps

module AsRippleCounter_tb;
	reg  clk, prs, clr; 
	wire [16:0] out;
	wire wakeup;
	
	AsRippleCounter dut_AsRC (.clk(clk),.prs(prs),.clr(clr),.out(out),.wakeup(wakeup));
	
	always begin
		#2 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,AsRippleCounter_tb);
		clk = 0;
		//en = 1;
		prs = 1;
		clr = 0;
		$monitor ("clk time= ", $time, "out=%d, clr= %b", out,clr );
		#4 prs = 1; clr = 1;
		
		#400000	$finish;
		
	end
		
endmodule