// ------------------------------
// Guia 11
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ------------------------------


// ---------------
// --- Mealy FSM
// --- seq: 1001
// ---------------


// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module numero03_seq1001_mealy ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id10   = 3'b010,
		id100  = 3'b100;

	reg [2:0] E1;	// current state variables
	reg [2:0] E2;	// next state logic output

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
					E2 = id1;
				else
					E2 = id10;
			
			id10:
				if ( x )
					E2 = id1;
				else
					E2 = id100;

			id100:
				if ( x )
				begin
					E2 =  id1;
					y  = `found;
				end
				else
				begin
					E2 =  start;
					y  = `notfound;
				end
	 
			default:   // undefined state
				E2 =  3'bxxx;
		endcase
	  
		end // always at signal or state changing
		

	// state variables
		always @( negedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    // updates current state
			else
				E1 = 0;     // reset
		end // always at signal changing

endmodule // numero03_seq1001_mealy
