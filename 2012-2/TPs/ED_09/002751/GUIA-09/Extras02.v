//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Extras 02 - Guia 09
//-------------------------------------
`include "flipflop.v"

module Extras02(output [5:0]s,input x,
							input clk, input clear);
	wire [5:0]q;
	wire [5:0]qnot;
	
	wire w1,w2,w3;
	
	or or1(w1,w3,x);
	not not1(w2,w1);
	not not2(w3,qnot[5]);
	
	jkff flip1(q[0],qnot[0],w1,w2,clk,0,clear);
	jkff flip2(q[1],qnot[1],q[0],qnot[0],clk,0,clear);
	jkff flip3(q[2],qnot[2],q[1],qnot[1],clk,0,clear);
	jkff flip4(q[3],qnot[3],q[2],qnot[2],clk,0,clear);
	jkff flip5(q[4],qnot[4],q[3],qnot[3],clk,0,clear);
	jkff flip6(q[5],qnot[5],q[4],qnot[4],clk,0,clear);
	
	assign s[0] = q[5];
	assign s[1] = q[4];
	assign s[2] = q[3];
	assign s[3] = q[2];
	assign s[4] = q[1];
	assign s[5] = q[0];
		
endmodule //Extras02

module principal;
	reg clear, x;
	wire [5:0]s;
	wire clk;
	
	clock clk1(clk);
	
	Extras02 ext02(s,x,clk,clear);
	
	initial begin
		clear = 0;
		x = 0;
		$display("Extras02-contador em anel torcido -Nome: Milton costa teles da silva-Matricula: 002751 ");
		$display("binario -  decimal");
		$monitor("%6b \t- \t%d",s,s);
		#1 clear = 1;
		#1 clear = 0;
		#1 x = 1;
		#3 x = 0;
		#300 $finish;
	end
endmodule //principal