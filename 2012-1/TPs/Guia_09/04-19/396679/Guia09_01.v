// ------------------------- 
// Guia09_01 - Contador Assincrono Decrescente
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
// -- contador assincrono down
// ----------------------------
module asynchCounterDown (s,signal,pulse,preset,clear);
	output [4:0]s; 
	input signal; 
	input pulse;
	input [4:0]preset; 
	input clear;
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	//---  ffjk ( output q, output qnot, input j, input k, input clk, input preset, input clear ); 
	ffjk FF5(q[4],qnot[4],signal,signal,pulse,preset[4],clear);
	ffjk FF4(q[3],qnot[3],signal,signal,qnot[4],preset[3],clear);
	ffjk FF3(q[2],qnot[2],signal,signal,qnot[3],preset[2],clear);
	ffjk FF2(q[1],qnot[1],signal,signal,qnot[2],preset[1],clear);
	ffjk FF1(q[0],qnot[0],signal,signal,qnot[1],preset[0],clear);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
	
endmodule //asynchCounterDown

module teste;
	wire [4:0]saida;
	wire pulse;
	reg [4:0] preset;
	reg signal,clear;
	
	clock clk(pulse);
	
	asynchCounterDown counter (saida,signal,pulse,preset,clear);
	
	initial begin
		preset = 0;
		clear = 0;
		signal = 0;
		
		$display("Guia09_01 - Bruno Cezar Andrade Viallet - 396679"); 
		$monitor("%5b ",saida);
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		#744 $finish;
	end
endmodule //teste