//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 04 - Guia 09
//-------------------------------------
`include "flipflop.v"

module Exercicio04(output [4:0]s, input x, input pulse,input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	wire w1,w2,w3,w4,w5;
	not not1(w3,q0);
	not not2(w4,q2);
	not not3(w5,q4);
	nand nand1(w1,w3,q[1],w4,q[3],w5);
	nand nand2(w2,clear,w1);
	
	jkff flip1(q[0],qnot[0],x,x,pulse,0,w2);
	jkff flip2(q[1],qnot[1],x,x,qnot[0],0,w2);
	jkff flip3(q[2],qnot[2],x,x,qnot[1],0,w2);
	jkff flip4(q[3],qnot[3],x,x,qnot[2],0,w2);
	jkff flip5(q[4],qnot[4],x,x,qnot[3],0,w2);
	
	assign s = q;
	
endmodule //Exercicio04

module principal;
	reg x,clear;
	wire pulse;
	wire [4:0]s;
	
	clock clk(pulse);
	
	Exercicio04 exe04(s,x,pulse,clear);
	
	initial begin
		x = 0;
		clear = 0;
		$display("Exercicio04-contador decádico crescente -Nome: Milton costa teles da silva-Matricula: 002751");
		$display("binario -   decimal");
		$monitor("%5b \t- \t",s,s);
		#1 clear = 1;
		#1 x = 1;
		
		#90 $finish;
	end
endmodule //principal