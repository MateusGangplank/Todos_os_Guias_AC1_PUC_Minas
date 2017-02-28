// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0046
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// --------------------------- 
// -- test clock generator (6) 
// --------------------------- 
`include "Clock.v"

module pulse ( signal, clock );
	input clock;
	output signal;
	reg signal;
	
	always @ ( posedge clock ) begin
		signal = 1'b1;
		#5 signal = 1'b0;
		#5 signal = 1'b1;
		#5 signal = 1'b0;
	end
endmodule // pulse

module Exemplo0046;
	wire clock;
	clock clk ( clock );
	
	reg p;
	
	wire p1,t1;
	pulse pulse1 ( p1, clock );
	
	initial begin
		p = 1'b0;
	end
	
	initial begin
		$dumpfile ( "Exemplo0046.vcd" );
		$dumpvars ( 1, clock, p1 );
		#060 p = 1'b1;
		#120 p = 1'b0;
		#180 p = 1'b1;
		#240 p = 1'b0;
		#300 p = 1'b1;
		#360 p = 1'b0;
		#376 $finish;
	end
endmodule // Exemplo0046