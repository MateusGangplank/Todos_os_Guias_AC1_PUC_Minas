// ------------------------- 
// Guia09_06 - Contador em Anel
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//-----------------------------
// -- CLOCK
//-----------------------------
`include "clock.v"

// -------------------------
// -- FLIP FLOP JK
// -------------------------
`include "flipflopjk.v"

// ----------------------------
// -- contador  em anel
// ----------------------------
module ringCounter (s, signal, clk, clear);
	output [4:0]s;
	input signal;
	input clk;
	input clear;
	wire [4:0]q;
	wire [4:0]qnot;
	wire t1,t2;
	
	or OR0(t1,q[4],signal);
	not NOT0(t2,t1);
	
	//---  ffjk ( output q, output qnot, input j, input k, input clk, input preset, input clear ); 
	ffjk FF5(q[4],qnot[4],q[3],qnot[3],clk,0,clear);
	ffjk FF4(q[3],qnot[3],q[2],qnot[2],clk,0,clear);
	ffjk FF3(q[2],qnot[2],q[1],qnot[1],clk,0,clear);
	ffjk FF2(q[1],qnot[1],q[0],qnot[0],clk,0,clear);
	ffjk FF1(q[0],qnot[0],t1,t2,clk,0,clear);
	

	

	assign s[0] = q[4];
	assign s[1] = q[3];
	assign s[2] = q[2];
	assign s[3] = q[1];
	assign s[4] = q[0];
	
endmodule //ringCounter

module teste;
	reg clear, sinal;
	wire [4:0]s;
	wire clk;
	
	clock clk1(clk);
	
	ringCounter counter(s,sinal,clk,clear);
	
	initial begin
		clear = 0;
		sinal = 0;
		$display("Guia09_06 - Bruno Cezar Andrade Viallet - 396679"); 
		$monitor("%5b", s);
		#1 clear = 1;
		#1 clear = 0;
		#1 sinal = 1;
		#12 sinal = 0;
		#480 $finish;
	end
endmodule //teste