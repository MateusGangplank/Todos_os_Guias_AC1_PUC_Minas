// ------------------------- 
// Exemplo0053
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

//`include "moore1101.v" 
// -------------- 
// --- Moore FSM 
// -------------- 

// constant definition 
	`define found 1 
	`define notfound 0 
// FSM by Moore 
module moore1101 ( y, x, clk, reset ); 
	output y; 
	input x; 
	input clk; 
	input reset; 
	reg y; 
	
	parameter // state identifiers 
		start = 4'b000,
		id1 = 4'b0001, 
		id10 = 4'b0010, 
		id101 = 4'b0101,
		id1010 = 4'b1010; // signal found 

		
		reg [3:0] E1; // current state variables 
		reg [3:0] E2; // next state logic output 
	// next state logic 
	always @( x or E1 ) 
		begin 
		case( E1 ) 
		start: 
			if ( x ) 
				E2 = id1; 
			else 
				E2 = start; 
		
		id1: 
			if ( x ) 
				E2 = start; 
			else 
				E2 = id10; 
		
		id10: 
			if ( x ) 
				E2 = id101; 
			else 
				E2 = start; 
		
		id101: 
			if ( x ) 
				E2 = start; 
			else 
				E2 = id1010; 
				
		id1010:
			if (x)
				E2 = id1;
			else
				E2 = start;
		
		default: // undefined statee 
			E2 = 4'bxxxx; 
		
		endcase 
	end // always at signal or state changing 
	
	// state variables 	
	always @( posedge clk or negedge reset ) 
	begin 
		if ( reset ) 
		E1 = E2; // updates current state 
		else 
		E1 = 0; // reset 
	end // always at signal changing 
	
	// output logic 
	always @( E1 ) 
	begin 
		y = E1[3]; // first bit of state value 
	end // always at state changing 
endmodule // moore1101 

//---------------
// -- Exemplo0053
//---------------
module Exemplo0053; 
	reg clk, reset, x; 
	wire m2; 
	
	moore1101 moore1 ( m2, x, clk, reset ); 
	
	initial begin 
		$display ( " Time   X   Moore" ); 
		// initial values 
		clk = 1; 
		reset = 0; 
		x = 1; 
		// input signal changing 
		#5 reset = 1;
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 0; 
		#20 x = 1; 
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 0; 
		#20 x = 1; 
		#30 $finish; 
	end // initial 
	
	always 
	#5 clk = ~clk; 
	
	always @( posedge clk ) 
	begin 
		$display ( "%4d %4b %5b", $time, x, m2 ); 
	end // always at positive edge clocking changing 
endmodule // Exemplo0053