//-----------------------------------------------------------------------------
//
// Title       : dff
// Design      : dffDesign_pet
// Author      : Mohammad Shazzad Hossain 
// Company     : 
//
//-----------------------------------------------------------------------------
//
// File        : c:\Users\shazz\Downloads\NTNU\MS_in_ESD\4th_semestar\Specialization_project\timer_design\dffDesign_pet\src\dff.v
// Generated   : Mon Mar 27 14:35:34 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : Posetive ege triggered D flip flop. Used fro the initial design
//				 the counter.
//
//-----------------------------------------------------------------------------
`timescale 1 us / 1 ns

//{module {dff}}
module dff ( d, clk, pr_b , clr_b , q, q_b);

input d ;
wire d ; 
input clk ;
wire clk ;
input pr_b;
wire pr_b;
input clr_b;
wire clr_b;
output q ;
wire q ;
output q_b ;
wire q_b ;

//}} End of automatically maintained section
wire w1, w2, s, r; 	

//this design can be found in the moris meno book in sequential design chapter and also in digital principle and design book
nand G1 (w1,w2,s,pr_b);
nand G2 (s,clk,w1,clr_b);
nand G3 (r,s,w2,clk);
nand G4 (w2,d,r,clr_b);
nand G5 (q,s,q_b,pr_b);
nand G6 (q_b,r,q,clr_b);


endmodule
