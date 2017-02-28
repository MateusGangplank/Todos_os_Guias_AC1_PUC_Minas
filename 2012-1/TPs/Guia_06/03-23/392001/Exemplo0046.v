// -------------------------
// Exemplo0046 - 
// Nome: Flávio Andrade Amaral Motta 
// Matricula: 427460 
// --------------------------- 


// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
	`include "clock1.v" 
	
	module pulse1 ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	
	always @ ( posedge clock ) 
	begin 

	#12 signal = 1'b1; 
	#60 signal = 1'b0; 
	end 

	endmodule // pulse 


	module Exemplo0057; 
	
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse1 pls1 ( p1, clock ); 
	 
	initial begin 
	$display ("Flavio Andrade Amaral Motta");
	$dumpfile ( "Exemplo0057.vcd" ); 
	$dumpvars ( clock, p1); 
	#480 $finish; 
end 
endmodule // Exemplo0057 