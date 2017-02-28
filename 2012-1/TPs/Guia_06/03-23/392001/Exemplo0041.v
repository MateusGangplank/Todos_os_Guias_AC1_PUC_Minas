// ------------------------- 
// Exemplo00041 - FULL ADDER 
// Nome: Flavio Andrade Amaral Motta 
// Matricula: 392001
// ------------------------- 

// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock (clk);
	output clk;
	reg clk;

initial
	begin
		clk = 1'b0;
	end
		always
	begin
		#12 clk = ~clk;
	end
	endmodule // clock ( )
	
	
	module Exemplo0041;
	
	wire  clk;
	clock CLK1 ( clk );
	
	initial begin
	$display("Exemplo 0041 - Flavio Andrade Amaral Motta - 392001");
	$display("Test clock");
	$dumpfile ( "Exemplo041.vcd" );
	$dumpvars;
	#120 $finish;
	end
	
endmodule // Exemplo041 ( )