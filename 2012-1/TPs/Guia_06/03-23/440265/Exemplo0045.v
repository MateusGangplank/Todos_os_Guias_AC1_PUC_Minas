// ---------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exemplo0045
// ---------------------------
 
`include "clock.v" 

// -- o Dobro da frequencia do clock
module pulse1 ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	always @ ( posedge clock ) 
		begin 
		signal = 1'b1; 
		#6 signal = 1'b0; 
		#6 signal = 1'b1; 
		#6 signal = 1'b0; 
		#6 signal = 1'b1; 
		#6 signal = 1'b0; 
		end 
endmodule // -- pulse 


module Exemplo0045; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse1 pls1 ( p1, clock ); 
	initial 
		begin 
		$dumpfile ( "Exemplo0045.vcd" ); 
		$dumpvars ( 1, clock, p1 ); 
		#300 $finish; 
		end 
endmodule // -- Exemplo0045 