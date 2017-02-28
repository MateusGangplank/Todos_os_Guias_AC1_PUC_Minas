// ------------------------- 
// Exemplo0044.v  
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 


// --------------------------- 
// -- test clock  
// --------------------------- 


`include "clock.v"
 
module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	always @ ( clock ) begin 
	signal = 1'b1; 
	#4 signal = 1'b0; 
	#4 signal = 1'b1; 
	#4 signal = 1'b0; 
end 

endmodule // pulse 

module Exemplo0044; 
	wire clock; 
	clock clk (clock); 
	reg p; 
	wire p1; 
	pulse pulse1 ( p1, clock ); 

initial begin 
	p = 1'b0; 
end 

initial begin 
	$display("Exercicio 04 - Lorena Danielle Gonçalves Bento - 435049");
	$dumpfile ( "Exemplo0044.vcd" );
	$monitor($time,clock,p1,p); 
	$dumpvars ( 1, clock, p1, p);
	#480 $finish; 
 
end 
endmodule // Exemplo0044 

