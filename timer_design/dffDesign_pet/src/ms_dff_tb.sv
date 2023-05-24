`timescale 1 us/1 ns 

module ms_dff_tb;
	reg d, clk, prs, clr, ce; //
	wire q, q_b;
	
	ms_dff dut_ms_dff (.d(d),.clk(clk),.clr(clr),.prs(prs),.ce(ce),.q(q),.q_b(q_b)); //,.convention .port(signal) => port is from dut signal is from tb
	
	always begin
		#15.26 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,ms_dff_tb);
		clk = 0;
		clr = 1;
		prs = 1;
		ce = 0;
		
		$monitor ("clk time= ", $time, "d=%b, clr =%d, q=%b", d,clr,q );
		#14  clr = 1; d = 1; prs =0;
		#14  clr = 0; d = 1; prs =1;
		#14  clr = 1; d = 1;ce =1 ; prs =0;
		#14  d = 1;
		#14 clr = 0 ;
		
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		#14  d = 1; clr =1;
		#10	 clr = 0;
		#4   d = 0;
		#14  d = 1;
		
		#14  d = 0;
		#14  d = 1;
		
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		#10 $finish;
	end
		
endmodule
		