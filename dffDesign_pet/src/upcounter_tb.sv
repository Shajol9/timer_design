`timescale 1ns/1ps

module upcounter_tb;
	reg  clk, pr, clr; 
	wire [16:0] out;
	
	upcounter dut_upcounter(.clk(clk), .pr(pr),.clr(clr),.out(out));
	
	always begin
		#2 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,upcounter_tb);
		clk = 0;
		pr = 1;
		clr = 0;
		$monitor ("clk time= ", $time, "out=%d, clr= %b", out,clr );
		#4 pr = 1; clr = 1;
		
		#400000	$finish;
		
	end
		
endmodule