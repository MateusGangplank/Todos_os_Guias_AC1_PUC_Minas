// ---------------------
// guia10_03 - Mealy - FSM capaz de reconhecer uma sequ�ncia (1010)
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

//----------------------------------------
// -- Exercicio 03
//----------------------------------------
// --- Mealy FSM, com sequencia : 1010
//----------------------------------------

// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module ex3_seq1010_mealy ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id10   = 3'b010,
		id101  = 3'b100;

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
					E2 = id101;

			id101:
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

endmodule // fim ex3_seq1010_mealy

//--------------------------
// -- test ex03
//--------------------------

module testex3;
	
	reg   clk, reset, x;
	wire  m1;

	ex3_seq1010_mealy M3 ( m1, x, clk, reset );

	initial
	begin
		$display("Guia10_03 - Anderson Belchior de Carvalho - 396673");
		$display("\n Time \t\t\tX  \t\t\t Seq 1010" );

		// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

	// input signal changing
		#10   reset = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 0;
		
		#5 $finish;
	
	end // initial

	always
		#5 clk = ~clk;

	always @( posedge clk )
	begin
		$display ( "%4d \t\t \t%b\t\t\t    %b", $time, x, m1);
	end // always at positive edge clocking changing

endmodule //  fim testex3