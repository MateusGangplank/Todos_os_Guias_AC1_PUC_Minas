//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 03 - Guia 09
//-------------------------------------
`include "flipflop.v"

module Exercicio03(output [5:0]s, input x, input pulse,input clear);
	wire [5:0]q;
	wire [5:0]qnot;
	wire w1,w2,w3,w4,w5;
	
	not not1(w1,x);
	not not2(w4,q[3]);

	
	and and1(w2,q[0],qnot[1],q[2],qnot[3],q[4],qnot[5]);
	and and2(w5,qnot[1],w4);

	
	or or1(w3,w1,w2,w5);
	
	jkff flip1(q[0],qnot[0],x,x,pulse,w3,clear);
	jkff flip2(q[1],qnot[1],x,x,q[0],w3,clear);
	jkff flip3(q[2],qnot[2],x,x,q[1],w3,clear);
	jkff flip4(q[3],qnot[3],x,x,q[2],w3,clear);
	jkff flip5(q[4],qnot[4],x,x,q[3],w3,clear);
	jkff flip6(q[5],qnot[5],x,x,q[4],w3,clear);
	
	assign s = q;
	
endmodule //Exercicio03

module principal;
	reg x,clear;
	wire pulse;
	wire [5:0]s;
	
	clock clk(pulse);
	
	Exercicio03 exe03(s,x,pulse,clear);
	
	initial begin
		x = 0;
		clear = 0;
		$display("Exercicio03 -contador decádico decrescente- Nome: Milton costa teles da silva-Matricula:002751");
		$display("binario -  decimal");
		$monitor("%6b \t- \t",s,s);
		#1 clear = 1;
		#1 clear = 0;
		#1 x = 1;
		
		#310 $finish;
	end
endmodule //principal