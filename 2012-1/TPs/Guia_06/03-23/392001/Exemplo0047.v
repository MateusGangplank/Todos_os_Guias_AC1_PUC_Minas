// -------------------------
// Exemplo0047 - 
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
	
	always @ ( negedge clock ) 
	begin 
	signal = 1'b1; 
	#5 signal = 1'b0; 
	#5 signal = 1'b1; 
	end 
endmodule // pulse 


	module Exemplo0058; 
	
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse1 pls1 ( p1, clock ); 
	 
	initial begin 
	$display ("Flavio Andrade Amaral Motta");
	$dumpfile ( "Exemplo0058.vcd" ); 
	$dumpvars ( 1, clock, p1); 
	#480 $finish; 
end 
endmodule // Exemplo0058 