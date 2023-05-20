`timescale 1ns/1ps

module counter_tb;
	reg  en, clk, prs, clr; 
	wire [7:0] out;
	wire tc,count_triger;
	
	counter dut_counter (.en(en),.clk(clk), .prs(prs),.clr(clr),.out(out),.tc(tc),.count_triger(count_triger));
	
	always begin
		#2 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,counter_tb);
		en = 0;
		clk = 0;
		prs = 1;
		clr = 0;
		$monitor ("clk time= ", $time, "out=%d, tc=%d, clr= %b", out,tc,clr);
		#4 prs = 1; clr = 1; en = 1;
		
		#4000	$finish;
		
	end
		
endmodule