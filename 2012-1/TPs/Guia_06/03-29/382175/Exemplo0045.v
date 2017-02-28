// ------------------------- 
// Exemplo0045
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

// --------------------------- 
// -- test clock generator (5) 
// --------------------------- 

`include "clock.v" 

module pulse ( signal, clock ); 
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
endmodule // pulse 

module Exemplo0045; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse pul ( p1, clock ); 
	initial begin 
	$dumpfile ( "Exemplo0045.vcd" ); 
	$dumpvars ( 1, clock, p1 ); 
	#300 $finish; 
end 
endmodule // Exemplo0045 