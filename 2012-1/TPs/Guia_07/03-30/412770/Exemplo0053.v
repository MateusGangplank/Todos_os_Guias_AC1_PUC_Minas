// ------------------------- 
// Exemplo0053 - Moore (1001) sem intersešao
// Nome: Rayan Darwin 
// Matricula: 412770
// ------------------------- 

// -------------- 
// --- Moore FSM 
// --------------

// constant definition 
`define found 1 
`define notfound 0 

// FSM by Moore 
module moore1001 ( y, x, clk, reset ); 
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
	id1001 = 3'b110; // signal found 
	reg [2:0] E1; // current state variables 
	reg [2:0] E2; // next state logic output 
	// next state logic 
	always @( x or E1 ) begin 
	case( E1 ) 
		start: 
			if ( x ) 
				E2 = id1; 
			else 
				E2 = start; 
		
		id1: 
			if ( x ) 
				E2 = id1; 
			else 
				E2 = id11; 
		
		id11: 
			if ( x ) 
				E2 = id1; 
			else 
				E2 = id110; 

		id110: 
			if ( x ) 
				E2 = id1001; 
			else 
				E2 = id1; 

		id1001: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = start; 
		
		default: // undefined statee 
			E2 = 3'bxxx; 
	endcase 

end // always at signal or state changing 

// state variables 
always @( posedge clk or negedge reset ) begin 
	if ( reset ) 
		E1 = E2; // updates current state 
	else 
		E1 = 0; // reset 

end // always at signal changing 

// output logic 
always @( E1 ) begin 
	y = E1[2]; // first bit of state value 

	end // always at state changing 

endmodule // moore1001 

module testMoore1001; 
	reg clk, reset, x; 
	wire m1; 
		
		moore1001 moore1 ( m1, x, clk, reset ); 

	initial begin 
		$display ("Exemplo0053 - Rayan Darwin - 412770");
		$display ( "Time 	X  Moore" ); 
		
		// initial values 
		clk = 1; 
		reset = 0; 
		x = 0; 
		
		// input signal changing 
		#5 reset = 1; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 0; 
		#10 x = 1; 
		#30 $finish; 
		
	end // initial 
		
	always 
		#5 clk = ~clk; 
		
	always @( posedge clk ) begin 
		$display ( "%4d %4b %4b", $time, x, m1 ); 
	
	end // always at positive edge clocking changing 

endmodule // testMoore1001 