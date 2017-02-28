// -------------------------
// Exemplo0052 - Mealy 1001 com interseção
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A sequência 1001 será reconhecida pela
// máquina duas vezes, segundo a sequência
// de valores assinalados ao x.
// -------------------------
// constant definitions
`define found 1
`define notfound 0

// Exemplo0052
module Exemplo0052 ( y, x, clk, reset );
	output y;
	input x;
	input clk;
	input reset;
	reg y;
	parameter // state identifiers
	start = 2'b00,
	id1   = 2'b01,
	id10  = 2'b10,
	id100 = 2'b11;
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
				begin
					E2 = id1;
					y = `notfound;
				end
				else
				begin
					E2 = id10;
					y = `notfound;
				end
			id10:
				if ( x )
					E2 = id1;
				else
					E2 = id100;
			id100:
				if ( x )
				begin
					E2 = id1;
					y = `found;
				end
				else
					E2 = start;
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
endmodule // Exemplo0052

module Exemplo0052_testes;
	reg clk, reset, x;
	wire m;
	Exemplo0052 maquina ( m, x, clk, reset );
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
		#10 x = 0;
		#10 x = 1;
		#20 x = 0;
		#10 x = 1;
		#10 x = 0;
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
		$display ( "%4d %4b %4b", $time, x, m );
	end // always at positive edge clocking changing
endmodule // Exemplo0052_testes