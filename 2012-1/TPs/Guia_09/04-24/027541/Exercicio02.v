//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 02 - Guia 09
//-------------------------------------

`include "flipflop.v"

module Exercicio02(output [4:0]s, input x,
				input pulse,input [4:0]preset,input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	jkff flip5(q[4],qnot[4],x,x,pulse,preset[4],clear);
	jkff flip4(q[3],qnot[3],x,x,q[4],preset[3],clear);
	jkff flip3(q[2],qnot[2],x,x,q[3],preset[2],clear);
	jkff flip2(q[1],qnot[1],x,x,q[2],preset[1],clear);
	jkff flip1(q[0],qnot[0],x,x,q[1],preset[0],clear);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
endmodule //Exercicio 02

module principal;
	wire [4:0]s;
	wire pulse;
	reg [4:0] preset;
	reg x,clear;
	
	clock clk(pulse);
	
	Exercicio02 exe(s,x,pulse,preset,clear);
	
	initial begin
		preset = 0;
		clear = 0;
		x = 0;
		
		$display("Exercicio02 - Contador assíncrono crescente-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("binario -   decimal");
		$monitor("%5b \t- \t %d",s,s);
		#1 clear = 1;
		#1 clear = 0;
		#1 x = 1;
		
		#320 $finish;
	end
endmodule //principal