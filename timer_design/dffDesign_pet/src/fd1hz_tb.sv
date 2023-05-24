`timescale 1us/1ns	  

module fd1hz_tb;
	reg  clk, pr, clr; 
	wire out;
	
	fd1hz dut_fd1hz (.clk(clk), .pr(pr),.clr(clr),.out(out));
	
	always begin
		#15.26 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,fd1hz_tb);
		clk = 0;
		pr = 1;
		clr = 0;
		$monitor ("clk time=",$time," out=%d, clr= %b", out,clr );
		#4 pr = 1; clr = 1;
		//#200500 pr = 1; clr = 0; 
		#4000000	$finish;
		
	end
		
endmodule