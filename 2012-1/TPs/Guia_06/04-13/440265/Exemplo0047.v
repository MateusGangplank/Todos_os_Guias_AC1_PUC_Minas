// ---------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exemplo0047
// ---------------------------
 
`include "clock.v" 

// -- sincronizador
module sincronizador ( signal, clock ); 
	input on, clock; 
	output signal; 
	reg signal; 
	always @ ( posedge clock ) 
		begin 
		#0 signal = 1'b1;
		#5 signal = ~signal;
		end 
	
	always @ ( negedge clock ) 
		begin 
		#0 signal = 1'b1;
		#5 signal = ~signal;
		end 
endmodule // -- trigger

module Exemplo0047; 
	wire clock; 
	clock clk ( clock );  
	wire t1;  
	sincronizador sinc1 ( t1, clock );  
	initial 
		begin 
		$dumpfile ( "Exemplo0047.vcd" ); 
		$dumpvars ( 1, clock, t1); 
		#300 $finish; 
		end
endmodule // -- Exemplo0047 