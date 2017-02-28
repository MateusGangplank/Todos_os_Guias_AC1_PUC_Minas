// ------------------------- 
// Guia09_03 - Contador Decadico Descrescente
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
// -- contador Decadico down
// ----------------------------
module decadeCounterDown (s,signal,pulse,clear);
	output [4:0]s; 
	input signal; 
	input pulse;
	input clear;
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	wire nsignal, t1, t2;
	
	not NOT0(nsignal, signal);
	or OR0(t2, nsignal,t1);
	and AND0 (t1, ~qnot[0], qnot[1], ~qnot[2], qnot[3], ~qnot[4]);
	
	//---  ffjk ( output q, output qnot, input j, input k, input clk, input preset, input clear ); 
	ffjk FF5(q[4],qnot[4],signal,signal,q[3],t2,clear);
	ffjk FF4(q[3],qnot[3],signal,signal,q[2],t2,clear);
	ffjk FF3(q[2],qnot[2],signal,signal,q[1],t2,clear);
	ffjk FF2(q[1],qnot[1],signal,signal,q[0],t2,clear);
	ffjk FF1(q[0],qnot[0],signal,signal,pulse,t2,clear);
	
	assign s[0] = q[0];
	assign s[1] = q[1];
	assign s[2] = q[2];
	assign s[3] = q[3];
	assign s[4] = q[4];
	
endmodule //decadeCounterDown

module teste;
	wire [4:0]saida;
	wire pulse;
	reg signal,clear;
	
	clock clk(pulse);
	
	decadeCounterDown counter (saida,signal,pulse,clear);
	
	initial begin
		clear = 0;
		signal = 0;
		
		$display("Guia09_03 - Bruno Cezar Andrade Viallet - 396679"); 
		$monitor("%5b ",saida);
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		#768 $finish;
	end
endmodule //teste