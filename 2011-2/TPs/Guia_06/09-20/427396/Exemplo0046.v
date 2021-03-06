// ------------------------- 
// Exemplo0046 - PULSE (a cada 1/6 da frequencia)
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
// -- PULSE: 12 peridos em 1 per�do do clock
// --------------------------- 
module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	always @ ( clock ) 
	begin 
		signal = 1'b1; 
		#1 signal = 1'b0;
		#1 signal = 1'b1;
		#1 signal = 1'b0;
		#1 signal = 1'b1;
		#1 signal = 1'b0;
		#1 signal = 1'b1; 
		#1 signal = 1'b0;
		#1 signal = 1'b1;
		#1 signal = 1'b0;
		#1 signal = 1'b1;
		#1 signal = 1'b0;
	end 
endmodule // pulse 

//-----------------------------
// -- Modulo Principal - Exercicio0046
//-----------------------------
module Exemplo0046; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse pls1 ( p1, clock ); 
	initial begin 
		$dumpfile ( "D:/DUMPFILES/Exemplo046.vcd" ); 
		$dumpvars ( 1, clock, p1); 
		#480 $finish; 
	end 
endmodule // Exemplo0046