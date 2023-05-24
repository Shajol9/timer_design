`timescale 1ns/1ps

module SyncCounter_tb;
	reg  en, clk, prs, clr; 
	wire [19:0] out;
	wire wakeup;
	
	SyncCounter dut_SC (.en(en),.clk(clk), .prs(prs),.clr(clr),.out(out),.wakeup(wakeup));
	
	always begin
		#0.5 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,SyncCounter_tb);
		en = 0;
		clk = 0;
		prs = 0;
		clr = 1;
		$monitor ("clk time= ", $time ," out=%d, wakeup=%d, clr= %b",out,wakeup,clr);
		#4 prs = 0; clr = 0; en = 1;
		
		#200000	$finish;
		
	end
		
endmodule