// ---------------------------
// Exemplo0041
// Nome: Julio Machado
// Matricula: 435666

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

	$display("Exemplo0041 - Julio Machado - 435666");
	$dumpfile ( "Exemplo0041.vcd" ); 
	$monitor($time, clk);
	$dumpvars(0); 
	#120 $finish; 
end 
endmodule // Exemplo0041 ( ) 