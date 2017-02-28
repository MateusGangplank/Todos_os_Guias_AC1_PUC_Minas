// -------------------------
// Exemplo0056 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
	`include "clock3.v" 
	
	module pulse1 ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	
	always @ ( posedge clock ) 
	begin 

	signal = 1'b0; 
	#4 signal = 1'b1; 
	#4 signal = 1'b0; 
	#4 signal = 1'b1; 
	#4 signal = 1'b0; 
	#4 signal = 1'b1; 
end 

	endmodule // pulse 


	module Exemplo0056; 
	
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse1 pls1 ( p1, clock ); 
	 
	initial begin 
	$dumpfile ( "Exemplo0056.vcd" ); 
	$dumpvars ( 1, clock, p1); 
	#480 $finish; 
end 
endmodule // Exemplo0056 