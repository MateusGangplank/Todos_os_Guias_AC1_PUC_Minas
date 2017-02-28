// ------------------------- 
// Exemplo0044
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

// --------------------------- 
// -- test clock generator (4) 
// --------------------------- 

`include "clock.v" 

module pulse ( signal, clock ); 
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
endmodule // pulse 


module Exemplo0044; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse pul ( p1, clock );  
	initial begin 
	$dumpfile ( "Exemplo0044.vcd" ); 
	$dumpvars ( 1, clock, p1 ); 
	#360 $finish; 
end 
endmodule // Exemplo0044