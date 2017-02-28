// ------------------------- 
// Guia09_04 - Contador Decadico Crescente
// Nome: Marden Santos Batista
// Matricula: 388613
// ------------------------- 


// CLOCK

`include "clock.v"


// FLIP FLOP JK
`include "flipflopjk.v"

// contador Decadico
module decadeCounterUp (s,signal,pulse,clear);
	output [4:0]s; 
	input signal; 
	input pulse;
	input clear;
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	wire t1, t2;
	

	nand NAND0(t2, clear,t1);
	nand NAND1 (t1, ~q[0], q[1], ~q[2], q[3], ~q[4]);
	
	//---  ffjk ( output q, output qnot, input j, input k, input clk, input preset, input clear ); 
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
	
endmodule //decadeCounter

module teste;
	wire [4:0]out;
	wire pulse;
	reg signal,clear;
	
	clock clk(pulse);
	
	decadeCounterUp counter (out,signal,pulse,clear);
	
	initial begin
		clear = 0;
		signal = 0;
		
		$display("Guia09_04 - Marden Santos Batista - 388613"); 
		$monitor("%5b ",out);
		#1 clear = 1;
		#1 signal = 1;
		#768 $finish;
	end
endmodule //teste