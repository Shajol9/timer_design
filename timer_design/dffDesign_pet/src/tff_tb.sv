`timescale 1 us/1 ns 

module tff_tb;
	reg t, clk, prs_b, clr_b;
	wire q, q_b;
	
	tff dut_dff (.t(t),.clk(clk),.prs_b(prs_b),.clr_b(clr_b),.q(q),.q_b(q_b)); //convention .port(signal) => port is from dut signal is from tb
	
	always begin
		#5 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,tff_tb);
		clk = 0;
		prs_b = 1;
		clr_b = 0;
		
		$monitor ("clk time= ", $time, "t=%b, prs_b=%b, clr_b=%b, q=%b", t,prs_b,clr_b,q );
		#5 prs_b =0; clr_b=1;
		#5 prs_b =1; clr_b=0;
		
		#4 prs_b =1; clr_b=1; t = 0;
		#10 prs_b =1; clr_b=1; t = 1;
		#10 prs_b =1; clr_b=1; t = 0;
		#10 prs_b =1; clr_b=1; t = 1;
		
		#10 prs_b =0; clr_b=1; t = 0;
		#10 prs_b =0; clr_b=1; t = 1;
		
		#10 prs_b =1; clr_b=0; t = 0;
		#10 prs_b =1; clr_b=0; t = 1;
		
		#10 prs_b =1; clr_b=1; t = 0;
		#10 prs_b =1; clr_b=1; t = 1;
		#10 prs_b =1; clr_b=1; t = 0;
		#10 prs_b =1; clr_b=1; t = 1;
		#10 prs_b =1; clr_b=1; t = 0;
		#10 prs_b =1; clr_b=1; t = 1;
		#10 prs_b =1; clr_b=1; t = 0;
		#10 $finish;
	end
		
endmodule