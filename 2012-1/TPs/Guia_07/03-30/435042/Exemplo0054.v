// -------------------------
// Exemplo0054 - 1110 apenas uma vez
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A sequência 1110 será
// reconhecida pela máquina
// uma vez, mesmo havendo mais
// de uma na entrada (os valores
// assinalados ao x).
// -------------------------
// constant definitions
`define found 1
`define notfound 0

// Exemplo0054
module Exemplo0054 ( y, x, clk, reset );
	output y;
	input x;
	input clk;
	input reset;
	reg y;
	parameter // state identifiers
	start  = 3'b000,
	id1    = 3'b001,
	id11   = 3'b010,
	id111  = 3'b011,
	id1110 = 3'b100; // signal found
	reg [2:0] E1; // current state variables
	reg [2:0] E2; // next state logic output
	// next state logic
	always @( x or E1 )
	begin
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
					E2 = id111;
				else
					E2 = start;
			id111:
				if ( x )
					E2 = id111;
				else
					E2 = id1110;
			id1110:
				E2 = id1110;
			default: // undefined state
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
endmodule // Exemplo0054

module Exemplo0054_testes;
	reg clk, reset, x;
	wire m;
	Exemplo0054 maquina ( m, x, clk, reset );
	initial
	begin
		$display ( "Time X Machine" );
		// initial values
		clk = 1;
		reset = 0;
		x = 0;
		// input signal changing
		#5 reset = 1;
		#10 x = 1;
		#30 x = 0;
		#10 x = 1;
		#30 x = 0;
		#10 x = 1;
		#30 $finish;
	end // initial
	always
	#5 clk = ~clk;
	always @( posedge clk )
	begin
		$display ( "%4d %4b %4b", $time, x, m );
	end // always at positive edge clocking changing
endmodule // Exemplo0054_testes