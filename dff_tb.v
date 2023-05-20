//-----------------------------------------------------------------------------
//
// Title       : dff_tb
// Design      : dffDesign_pet
// Author      : Mohammad Shazzad Hossain 
// Company     : 
//
//-----------------------------------------------------------------------------
//
// File        : c:\Users\shazz\Downloads\NTNU\MS_in_ESD\4th_semestar\Specialization_project\timer_design\dffDesign_pet\src\dff_tb.v
// Generated   : Mon Mar 27 14:35:34 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : Posetive ege triggered D flip flop testbench. Used fro the initial design
//				 the counter.
//
//-----------------------------------------------------------------------------	
`timescale 1 us/1 ns 

module dff_tb;
	reg d, clk, pr_b, clr_b;
	wire q, q_b;
	
	dff dut_dff (.d(d),.clk(clk),.pr_b(pr_b),.clr_b(clr_b),.q(q),.q_b(q_b)); //convention .port(signal) => port is from dut signal is from tb
	
	always begin
		#15.26 clk = ~clk;
	end
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars(0,dff_tb);
		clk = 0;
		pr_b = 1;
		clr_b = 0;
		
		$monitor ("clk time= ", $time, "d=%b, pr_b=%b, clr_b=%b, q=%b", d,pr_b,clr_b,q );
		#14 pr_b =0; clr_b=1;
		#14 pr_b =1; clr_b=0;
		
		#14 pr_b =1; clr_b=1; d = 0;
		#14 pr_b =1; clr_b=1; d = 1;
		#14 pr_b =1; clr_b=1; d = 0;
		#14 pr_b =1; clr_b=1; d = 1;
		
		#14 pr_b =0; clr_b=1; d = 0;
		#14 pr_b =0; clr_b=1; d = 1;
		
		#14 pr_b =1; clr_b=0; d = 0;
		#14 pr_b =1; clr_b=0; d = 1;
		
		#14 pr_b =1; clr_b=1; d = 0;
		#14 pr_b =1; clr_b=1; d = 1;
		#14 pr_b =1; clr_b=1; d = 0;
		#14 pr_b =1; clr_b=1; d = 1;
		#14 pr_b =1; clr_b=1; d = 0;
		#14 pr_b =1; clr_b=1; d = 1;
		#14 pr_b =1; clr_b=1; d = 0;
		#10 $finish;
	end
		
endmodule
		