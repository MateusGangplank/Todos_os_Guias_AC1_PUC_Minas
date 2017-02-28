// ---------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exemplo0043
// ---------------------------

`include "clock.v" 

// -- modulo com 1/3 da frenquencia do clock
module pulse1 ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	always @ ( posedge clock ) 
		begin 
		signal = 1'b1; 
		#36 signal = 1'b0; 
		#36 signal = 1'b1; 
		#36 signal = 1'b0; 
		#36 signal = 1'b1; 
		#36 signal = 1'b0; 
		end 
endmodule // -- pulse 


module Exemplo0044; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse1 pls1 ( p1, clock );  
	initial 
		begin 
		$dumpfile ( "Exemplo0044.vcd" ); 
		$dumpvars ( 1, clock, p1 ); 
		#360 $finish; 
		end 
endmodule // -- Exemplo0044