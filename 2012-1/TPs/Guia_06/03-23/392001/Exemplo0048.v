// -------------------------
// Exemplo0048 - 
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

	#12 signal = 1'b0; 
	#60 signal = 1'b1; 
	end 

	endmodule // pulse 


	
	module pulse2 ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	
	always @ ( negedge clock ) 
	begin 
	signal = 1'b1; 
	#12 signal = 1'b0; 
	#60 signal = 1'b1; 
	end 
endmodule // pulse 


	module Exemplo0059; 
	
	wire clock; 
	clock clk ( clock ); 
	wire p1, p2; 
	pulse1 pls1 ( p1, clock ); 
	pulse2 pls2 ( p2, clock ); 
	 
	initial begin 
	$display ("Flavio Andrade Amaral Motta");
	$dumpfile ( "Exemplo0059.vcd" ); 
	$dumpvars ( 1, clock, p1, p2); 
	#480 $finish; 
end 
endmodule // Exemplo0059 