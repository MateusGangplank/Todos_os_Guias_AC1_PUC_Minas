 // ----------------------------
// -- Miller 449048 - Guia 7 --
// ------- Exemplo0052 --------
// ----------------------------
// 

	`include "Mealy1001.v" 
	
	module Exemplo0052; 
	reg   clk, reset, x; 
	wire  m1; 

	mealy1001	mealy1( m1, x, clk, reset );  

	initial 
	begin 
   $display ( "Time     x    Mealy1001" ); 
 
// initial values 
	clk	=	1;
	reset	=	0;
	x		=	0; 

// input signal changing 
	#5	reset = 1;
	#10  x = 1;
	#10  x = 0; 
	#10  x = 0; 
	#10  x = 1;
	#10  x = 0; 
	#10  x = 0; 
	#10  x = 1;
	#10  x = 1;
	 
	#10 $finish; 
	end // initial 
 
	always 
	#5 clk = ~clk; 

	always @( posedge clk ) 
	begin 
	$display ( "%4d  %4b  %4b ", $time, x, m1 ); 
	end // always at positive edge clocking changing 

endmodule // Exemplo0052