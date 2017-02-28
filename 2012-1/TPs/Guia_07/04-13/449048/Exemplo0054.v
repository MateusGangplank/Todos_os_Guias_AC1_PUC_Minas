 // ----------------------------
// -- Miller 449048 - Guia 7 --
// ------- Exemplo0054 --------
// ----------------------------
// 

	`include "Moore1110.v" 
	
	module Exemplo0054; 
	reg   clk, reset, x; 
	wire  m1; 

	moore1110	moore1( m1, x, clk, reset );  

	initial 
	begin 
   $display ( "Time     x    Moore1001" ); 
 
// initial values 
	clk	=	1;
	reset	=	0;
	x		=	0; 

// input signal changing 
	#5	reset = 1;
	#10  x = 1;
	#10  x = 1;
	#10  x = 1; 
	#10  x = 1;
	#10  x = 0; 
	#10  x = 0;
	#10  x = 0; 
	#10  x = 0;
	#10  x = 1;
	#10  x = 1; 
	#10  x = 1;
	#10  x = 0;
	#10  x = 0;
	 
	#10 $finish; 
	end // initial 
 
	always 
	#5 clk = ~clk; 

	always @( posedge clk ) 
	begin 
	$display ( "%4d  %4b  %4b ", $time, x, m1 ); 
	end // always at positive edge clocking changing 

endmodule // Exemplo0054