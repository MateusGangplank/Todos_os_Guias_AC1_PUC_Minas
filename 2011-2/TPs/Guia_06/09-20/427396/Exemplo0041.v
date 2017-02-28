// ------------------------- 
// Exemplo0041 - CLOCK
// Nome: Eduardo Manoel 
// Matricula: 427396 
// ------------------------- 

//-----------------------------
// -- CLOCK
//-----------------------------
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

//-----------------------------
// -- Modulo Principal - Exercicio0041
//-----------------------------
module Exemplo0041;
	wire  clk;
	clock CLK1 ( clk );
	initial begin
	  $monitor("%d -> %1b", $time, clk);
	  $dumpfile ( "D:/DUMPFILES/Exemplo041.vcd" );
	  $dumpvars(clk);
	#120 $finish;
	end
endmodule // Exemplo041 ( )