// ------------------------- 
// Exemplo0051
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 
// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
//`include "mealy1101.v" 
// -------------- 
// --- Mealy FSM 
// -------------- 
// constant definitions 
	`define found 1 
	`define notfound 0 
// FSM by Mealy 
module mealy1101 ( y, x, clk, reset ); 
	output y; 
	input x; 
	input clk; 
	input reset; 
	reg y; 
	
	parameter // state identifiers 
		start = 2'b00, 
		id1 = 2'b01, 
		id11 = 2'b11, 
		id110 = 2'b10; 
		reg [1:0] E1; // current state variables 
		reg [1:0] E2; // next state logic output 
	// next state logic 
	always @( x or E1 ) 
		begin 
		y = `notfound; 
		case ( E1 ) 
			start: 
			if ( x ) 
				E2 = id1; 
			else 
				E2 = start; 
			
			id1: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = start; 
			
			id11: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = id110; 
			
			id110: 
			if ( x ) 
			begin 
				E2 = id1; 
				y = `found; 
			end 
			else 
			begin 
				E2 = start; 
				y = `notfound; 
			end 
			
			default: // undefined state 
				E2 = 2'bxx; 
		
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
endmodule // mealy1101 

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
		start = 3'b000, 
		id1 = 3'b001, 
		id11 = 3'b011, 
		id110 = 3'b010, 
		id1101 = 3'b110; // signal found 
		reg [2:0] E1; // current state variables 
		reg [2:0] E2; // next state logic output 
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
				E2 = id11; 
			else 
				E2 = start; 
		
		id11: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = id110; 
		
		id110: 
			if ( x ) 
				E2 = id1101; 
			else 
				E2 = start; 
		
		id1101: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = start; 
		
		default: // undefined statee 
			E2 = 3'bxxx; 
		
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
		y = E1[2]; // first bit of state value 
	end // always at state changing 
endmodule // moore1101 

//---------------
// -- Exemplo0051
//---------------
module Exemplo0051; 
	reg clk, reset, x; 
	wire m1, m2; 
	
	mealy1101 mealy1 ( m1, x, clk, reset ); 
	moore1101 moore1 ( m2, x, clk, reset ); 
	
	initial begin 
		$display ( "Time X Mealy Moore" ); 
		// initial values 
		clk = 1; 
		reset = 0; 
		x = 0; 
		// input signal changing 
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
	end // initial 
	
	always 
	#5 clk = ~clk; 
	
	always @( posedge clk ) 
	begin 
		$display ( "%4d %4b %4b %5b", $time, x, m1, m2 ); 
	end // always at positive edge clocking changing 
endmodule // Exemplo0051 