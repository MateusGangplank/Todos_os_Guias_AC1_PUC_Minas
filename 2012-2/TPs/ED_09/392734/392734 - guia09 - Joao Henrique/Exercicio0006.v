//------------------------------------------------
//Exercicio0006
//Nome: João Henrique Mendes de Oliveira
//Matrícula: 392734
//------------------------------------------------

`include "flipflops.v"

module ringCounter(output [4:0]s,input signal,
							input clk, input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	
	wire w1,w2;
	
	or or1(w1,q[4],signal);
	not not1(w2,w1);
	
	jkff flip1(q[0],qnot[0],w1,w2,clk,0,clear);
	jkff flip2(q[1],qnot[1],q[0],qnot[0],clk,0,clear);
	jkff flip3(q[2],qnot[2],q[1],qnot[1],clk,0,clear);
	jkff flip4(q[3],qnot[3],q[2],qnot[2],clk,0,clear);
	jkff flip5(q[4],qnot[4],q[3],qnot[3],clk,0,clear);
	
	assign s[0] = q[4];
	assign s[1] = q[3];
	assign s[2] = q[2];
	assign s[3] = q[1];
	assign s[4] = q[0];
	
endmodule //ringCounter

module principal;
	reg clear, sinal;
	wire [4:0]s;
	wire clk;
	
	clock clk1(clk);
	
	ringCounter rc1(s,sinal,clk,clear);
	
	initial begin
		clear = 0;
		sinal = 0;
		$display("Exercicio0006 - 5 bits ringCounter - João Henrique - 392734");
		$display("bin \t- \tdecimal");
		$monitor("%5b \t- \t%d",s,s);
		#1 clear = 1;
		#1 clear = 0;
		#1 sinal = 1;
		#3 sinal = 0;
		#300 $finish;
	end
endmodule //principal