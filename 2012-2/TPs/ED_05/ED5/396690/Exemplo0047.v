// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
//----------------------------
//-- Test clock generator (7)
//----------------------------

`include "clock.v"

module pulse(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (negedge clock)
	begin
		signal = 1'b1;
		#2.5 signal = 1'b0;
	end
endmodule//pulse

module Exemplo0047;
	wire clock;
	clock clk ( clock );
	wire sinal;
	pulse p1(sinal, clock);
	
	initial begin
		$dumpfile("Exemplo0047.vcd");
		$dumpvars( 1, clock, sinal );
		#430 $finish;
	end
endmodule //Exemplo0047