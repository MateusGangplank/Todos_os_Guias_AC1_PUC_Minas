//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 05 - Guia 09
//-------------------------------------

`include "flipflop.v"

module Exercicio05(output [2:0]s,input pulse, input clear);
	wire [2:0]q;
	wire [2:0]qnot;
	wire w1,w2;
	
	and and1(w1,q[0],qnot[0],qnot[1],qnot[2]);
	or or1(w2,w1,clear);
	
	tff t3(q[2],qnot[2],pulse,pulse,0,w2);
	tff t2(q[1],qnot[1],qnot[2],qnot[2],0,w2);
	tff t1(q[0],qnot[0],qnot[1],qnot[1],0,w2);
	
	assign s[0] = q[2];
	assign s[1] = q[1];
	assign s[2] = q[0];
	
endmodule //Exercicio05

module principal;
	reg clear;
	wire [2:0]s;
	wire pulse;
	
	clock clk(pulse);
	
	Exercicio05 exe05(s,pulse,clear);
	
	initial begin
		clear = 0;
		$display("Exercicio05-contador módulo 8-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("binario -   decimal");
		$monitor("%5b \t- \t %d",s,s);
		#1 clear = 1;
		#1 clear = 0;
		#70 $finish;
	end
endmodule //principal