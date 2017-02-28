// ------------------------- 
// Guia09 - Contador Modulo 8
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 


`include "clock.v"
`include "flipflopt.v"

// como eu representaria a conta final ate dez, sendo que eu posso representar
// ate 8 com 3 bits e 16 com 4 bits?

module counterBase8 (s, pulse, clear);
	output [3:0]s;
	input pulse; 
	input clear;
	wire [3:0]q;
	wire [3:0]qnot;
	wire w1,w2;
	
	and and1(w1,q[0],qnot[1],qnot[2],qnot[3]);
	or or1(w2,w1,clear);
	
	fft t4(q[3],qnot[3],pulse,pulse,0,w2);
	fft t3(q[2],qnot[2],qnot[3],qnot[3],0,w2);
	fft t2(q[1],qnot[1],qnot[2],qnot[2],0,w2);
	fft t1(q[0],qnot[0],qnot[1],qnot[1],0,w2);
	
	assign s[0] = q[3];
	assign s[1] = q[2];
	assign s[2] = q[1];
	assign s[3] = q[0];
endmodule 

module teste;
	reg clear;
	wire [3:0]saida;
	wire pulse;
	
	clock clk(pulse);
	
	counterBase8 counter(saida,pulse,clear);
	
	initial begin
		clear = 0;
		$display("Guia09 - Gabriel Benjamim de Carvalho - 396690"); 
		$monitor("%4b",saida);
		#1 clear = 1;
		#1 clear = 0;
		#240 $finish;
	end
	
endmodule 