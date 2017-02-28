// ----------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Mealy - Moore FSM
// -- Exemplo0051 
// ---------------------------------------------------- 
`include "Mealy1101.v" 
`include "Moore1101.v" 
module Exemplo0051; 
	reg clk, reset, x; 
	wire m1, m2; 
	mealy1101 mealy1 ( m1, x, clk, reset ); 
	moore1101 moore1 ( m2, x, clk, reset ); 
	initial 
		begin 
		$display ( "Time\tX\tMealy\tMoore" ); 
		// -- initial values 
		clk = 1; 
		reset = 0; 
		x = 0; 
		// -- input signal changing 
		#5 reset = 1; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 1; 
		#20 x = 0; 
		#10 x = 1; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 1; 
		#30 $finish; 
		end // -- initial 
	always 
		#5 clk = ~clk; 
	always @( posedge clk ) 
		begin 
		$display ( "%3d\t%b\t%b\t%b", $time, x, m1, m2 ); 
		end // -- always at positive edge clocking changing 
endmodule // -- Exemplo0051 