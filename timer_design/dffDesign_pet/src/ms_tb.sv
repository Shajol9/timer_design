`timescale 1 us/1 ns 

module ms_tb;
	reg d, clk, clr_b, prs_b;  //ce; 
	wire q, q_b;
	
	ms dut_ms (.d(d),.clk(clk),.clr_b(clr_b),.prs_b(prs_b),.q(q),.q_b(q_b)); //,.convention .port(signal) => port is from dut signal is from tb
	
	always begin
		#15.26 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,ms_tb);
		clk = 0;
		clr_b = 0;
		prs_b = 1;
		d = 1;
		//ce = 0;
		
		$monitor ("clk time= ", $time, "d=%b, prs_b =%d, clr_b =%d, q=%b",d,prs_b,clr_b,q );
		#14  clr_b = 0; d = 1; 
		#14  clr_b = 1; d = 1;
		#14	 clr_b = 1; d = 1;
		#14  clr_b = 0; d = 1; //ce =1 ;
		#14  d = 1;
		#14 clr_b = 1 ;
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		
		#14  d = 1; clr_b = 1;
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		
		#14  d = 1;clr_b = 1;
		#14  d = 0;
		#14  d = 1;
		
		#14  d = 0; prs_b=0;
		#14  d = 1;
		#14  d = 0;
		#14  d = 1;
		#14  d = 0;
		#10 $finish;
	end
		
endmodule
		