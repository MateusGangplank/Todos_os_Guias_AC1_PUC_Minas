// ------------------------- 
// Exemplo0045 - PULSE (a cada 1/3 da frequencia)
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
// -- PULSE: 6 peridos em 1 perído do clock
// --------------------------- 
module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	always @ ( clock ) 
	begin 
		signal = 1'b1; 
		#2 signal = 1'b0;
		#2 signal = 1'b1;
		#2 signal = 1'b0;
		#2 signal = 1'b1;
		#2 signal = 1'b0;
	end 
endmodule // pulse 

//-----------------------------
// -- Modulo Principal - Exercicio0045
//-----------------------------
module Exemplo0045; 
	wire clock; 
	clock clk ( clock ); 
	wire p1; 
	pulse pls1 ( p1, clock ); 
	initial begin 
		$dumpfile ( "D:/DUMPFILES/Exemplo045.vcd" ); 
		$dumpvars ( 1, clock, p1); 
		#480 $finish; 
	end 
endmodule // Exemplo0045 