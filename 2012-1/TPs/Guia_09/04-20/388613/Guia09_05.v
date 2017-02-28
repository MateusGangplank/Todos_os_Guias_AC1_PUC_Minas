// ------------------------- 
// Guia09_05 - Contador Modulo 8
// Nome: Marden Santos Batista
// Matricula: 388613
// ------------------------- 


// CLOCK

`include "clock.v"

// FLIP FLOP T
`include "flipflopt.v"

// contador modulo 8

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
endmodule // counterBase8

module teste;
	reg clear;
	wire [3:0]out;
	wire pulse;
	
	clock clk(pulse);
	
	counterBase8 counter(out,pulse,clear);
	
	initial begin
		clear = 0;
		$display("Guia09_05 - Marden Santos Batista - 388613"); 
		$monitor("%4b",out);
		#1 clear = 1;
		#1 clear = 0;
		#240 $finish;
	end
	
endmodule //teste