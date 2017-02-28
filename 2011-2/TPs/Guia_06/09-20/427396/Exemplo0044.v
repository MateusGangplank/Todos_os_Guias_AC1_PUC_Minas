// ------------------------- 
// Exemplo0044 - PULSE (a cada metade da frequencia)
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

// --------------------------- 
// -- PULSE: 2 peridos em 1 perído do clock
// --------------------------- 
module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	always @ ( clock ) 
	begin 
		signal = 1'b1; 
		#6 signal = 1'b0; 
	end 
endmodule // pulse 

//-----------------------------
// -- Modulo Principal - Exercicio0044
//-----------------------------
module Exemplo0044; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse pls1 ( p1, clock ); 
	initial begin 
		$dumpfile ( "D:/DUMPFILES/Exemplo044.vcd" ); 
		$dumpvars ( 1, clock, p1); 
		#480 $finish; 
	end 
endmodule // Exemplo0044