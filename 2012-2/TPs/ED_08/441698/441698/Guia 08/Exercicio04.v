// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v" 
`include "dff.v"
 
// -----------------------------------------------------------
// --  Twisted-Ring Counters, para 5 bits
// -----------------------------------------------------------
module twistedRing (output[4:0] s, input a, input clk);
	wire nots;
	wire rotate;
	
	or OR1 (a0, a, s[4]);
	
	dff FF0 (s[0], nots, a0, clk);
	dff FF1 (s[1], nots, s[0], clk);
	dff FF2 (s[2], nots, s[1], clk);
	dff FF3 (s[3], nots, s[2], clk);
	dff FF4 (s[4], nots, s[3], clk);

endmodule //twistedRing

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire [4:0] saida;
	reg a;
	wire clock; 
	clock clk ( clock ); 
	
	twistedRing TR1 (saida, a, clock);
	
	initial begin
		$display("D  CLOCK  SAIDA");
		a = 1;
		$monitor("%1b    %1b    %4b", a, clock, saida);
		#25 a = 0;
		#200 $finish;
	end

endmodule //teste