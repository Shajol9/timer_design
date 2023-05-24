`timescale 1ns/1ps

module counter_tb;
	reg  en, clk, prs, clr; 
	wire [16:0] out;
	wire tcc;
	
	counter dut_counter (.en(en),.clk(clk), .prs(prs),.clr(clr),.out(out),.tcc(tcc));
	
	always begin
		#0.5 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,counter_tb);
		en = 0;
		clk = 0;
		prs = 0;
		clr = 1;
		$monitor ("clk time= ", $time, "out=%d, tcc=%d, clr= %b", out,tcc,clr);
		#4 prs = 0; clr = 0; en = 1;
		
		#200000	$finish;
		
	end
		
endmodule