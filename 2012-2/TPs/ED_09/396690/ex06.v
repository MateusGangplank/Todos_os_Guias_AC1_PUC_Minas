// ------------------------- 
// Guia09 - Contador em Anel
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 

`include "clock.v"
`include "flipflopjk.v"

module ringCounter (s, signal, clk, clear);
	output [5:0]s;
	input signal;
	input clk;
	input clear;
	wire [5:0]q;
	wire [5:0]qnot;
	wire t1,t2;
	
	or OR0(t1,q[5],signal);
	not NOT0(t2,t1);
	
	ffjk FF6(q[5],qnot[5],q[4],qnot[4],clk,0,clear);
	ffjk FF5(q[4],qnot[4],q[3],qnot[3],clk,0,clear);
	ffjk FF4(q[3],qnot[3],q[2],qnot[2],clk,0,clear);
	ffjk FF3(q[2],qnot[2],q[1],qnot[1],clk,0,clear);
	ffjk FF2(q[1],qnot[1],q[0],qnot[0],clk,0,clear);
	ffjk FF1(q[0],qnot[0],t1,t2,clk,0,clear);
	
	assign s[0] = q[5];
	assign s[1] = q[4];
	assign s[2] = q[3];
	assign s[3] = q[2];
	assign s[4] = q[1];
	assign s[5] = q[0];
	
endmodule 

module teste;
	reg clear, sinal;
	wire [5:0]s;
	wire clk;
	
	clock clk1(clk);
	
	ringCounter counter(s,sinal,clk,clear);
	
	initial begin
		clear = 0;
		sinal = 0;
		$display("Guia09 - Gabriel Benjamim de Carvalho - 396690"); 
		$monitor("%5b %d", s, s);
		#1 clear = 1;
		#1 clear = 0;
		#1 sinal = 1;
		#12 sinal = 0;
		#1000 $finish;
	end
endmodule 