// ------------------------- 
// Exemplo0041.v  
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 


// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 


module clock ( clk ); 
	output clk; 
	reg clk; 
	initial begin 
	clk = 1'b0; 
end 

always begin 
	#12 clk = ~clk; 
end 

endmodule // clock ( ) 


module Exemplo0041; 
	wire clk; 
	clock CLK1 ( clk );
 
initial begin

	$display("Exercicio01 - Lorena Danielle Gonçalves Bento - 435049");
	$dumpfile ( "Exemplo041.vcd" ); 
	$monitor($time, ,clk);
	$dumpvars(0); 
	#480 $finish; 
end 
endmodule // Exemplo041 ( ) 