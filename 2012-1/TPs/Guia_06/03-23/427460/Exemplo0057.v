// -------------------------
// Exemplo0057 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
	`include "clock1.v" 
	
	module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
		always @ ( clock ) 
begin 
	signal = 1'b1; 
	#5 signal = 1'b0; 
	#5 signal = 1'b1; 
	#5 signal = 1'b0; 
end 
endmodule // pulse 
	
	module trigger ( signal, on, clock ); 
	input on, clock; 
	output signal; 
	reg signal; 
	always @ ( posedge clock & on ) 
begin 
	#60 signal = 1'b1; 
	#60 signal = 1'b0; 
end 
endmodule // trigger 

	
	module Exemplo0057; 
	
	wire clock; 
	clock clk ( clock ); 
	wire p1, p2; 
	pulse pls1 ( p1, clock ); 
	trigger tr (p2, pls1, clock)
	 
	initial begin 
	$dumpfile ( "Exemplo0057.vcd" ); 
	$dumpvars ( clock, p2); 
	#480 $finish; 
end 
endmodule // Exemplo0057 