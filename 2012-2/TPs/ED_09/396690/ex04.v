// ------------------------- 
// Guia09 - Contador Decadico Crescente
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 


`include "clock.v"

`include "flipflopjk.v"

module decadeCounterUp (s,signal,pulse,clear);
	output [5:0]s; 
	input signal; 
	input pulse;
	input clear;
	wire [5:0]q;
	wire [5:0]qnot;
	wire [5:0]s;
	wire t1, t2;
	

	nand NAND0(t2, clear,t1);
	nand NAND1 (t1, ~q[0], q[1], ~q[2], q[3], ~q[4], q[5]);
	
	ffjk FF6(q[5],qnot[5],signal,signal,qnot[4],0,t2);
	ffjk FF5(q[4],qnot[4],signal,signal,qnot[3],0,t2);
	ffjk FF4(q[3],qnot[3],signal,signal,qnot[2],0,t2);
	ffjk FF3(q[2],qnot[2],signal,signal,qnot[1],0,t2);
	ffjk FF2(q[1],qnot[1],signal,signal,qnot[0],0,t2);
	ffjk FF1(q[0],qnot[0],signal,signal,pulse,0,t2);
	
	assign s[0] = q[0];
	assign s[1] = q[1];
	assign s[2] = q[2];
	assign s[3] = q[3];
	assign s[4] = q[4];
	assign s[5] = q[5];
	
endmodule 

module teste;
	wire [5:0]saida;
	wire pulse;
	reg signal,clear;
	
	clock clk(pulse);
	
	decadeCounterUp counter (saida,signal,pulse,clear);
	
	initial begin
		clear = 0;
		signal = 0;
		
		$display("Guia09 - Gabriel Benjamim de Carvalho - 396690"); 
		$monitor("%5b %d",saida, saida);
		#1 clear = 1;
		#1 signal = 1;
		#1000 $finish;
	end
endmodule 