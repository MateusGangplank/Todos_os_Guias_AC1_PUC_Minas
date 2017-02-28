// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "flipflop.v"
 
// -----------------------------------------------------------
// --  Twisted Ring Counter
// -----------------------------------------------------------
module twistedRingCounter (output[5:0] s, input entrada, input clk, input clear);
	wire[5:0] snot;
	wire w1;
	
	or or1(w1,snot[0],entrada);
	
	dff2 d1(s[5],snot[5],w1,clk,0,clear);
	dff2 d2(s[4],snot[4],s[5],clk,0,clear);
	dff2 d3(s[3],snot[3],s[4],clk,0,clear);
	dff2 d4(s[2],snot[2],s[3],clk,0,clear);
	dff2 d5(s[1],snot[1],s[2],clk,0,clear);
	dff2 d6(s[0],snot[0],s[1],clk,0,clear);

endmodule //twistedRingCounter

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[5:0] saida;
	reg entrada; 
	reg clear; 
	wire clock;
	
	clock c1(clock);
	twistedRingCounter TRC1 (saida,entrada,clock,clear);
			
	initial begin
		$display("CLOCK  ENTRADA   SAIDA");
		clear = 0;
		#1 clear = 1;
		#1 clear = 0;
		$monitor("%1b    %6b      %6b", clock, entrada, saida);
		#12 entrada = 0;
		#12 entrada = 1;
		#12 entrada = 0;
		#200 $finish;
	end
endmodule //teste