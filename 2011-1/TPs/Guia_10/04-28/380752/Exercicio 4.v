// ---------------------
// Mealy - FSM capaz de identificar uma sequência de três bits iguais a (111) ou (000).
// Nome: Bruno Rafael Nicolletti 
// Matricula: 380752
// ---------------------

//Implementar um máquina de estados finitos capaz de identificar uma sequência de três bits iguais a (111) ou (000).
 
//


// --- Mealy FSM
// --- seq: 111 ou 000



// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module exercicio4_seq111_000 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id0    = 3'b110,
		id11   = 3'b010,
		id00   = 3'b101;

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
					E2 = id0;
				
			id1:
				if ( x )
					E2 = id1;
				else
					E2 = id11;

			id11:
				if ( x )
				begin
					E2 =  id1;
					y  = `found;
				end
				else
				begin
					E2 =  id0;
					y  = `notfound;
				end
			
			id0:
				if ( x )
					E2 = id00;
				else
					E2 = id0;

			id00:
				if ( x )
				begin
					E2 =  id1;
					y  = `notfound;
				end
				else
				begin
					E2 =  id0;
					y  = `found;
				end
	 
			default:   // undefined state
				E2 =  3'bxxx;
		endcase
	  
		end // always at signal or state changing
		

	// state variables
		always @( posedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    // updates current state
			else
				E1 = 0;     // reset
		end // always at signal changing

endmodule // exercicio4_seq111_000

module Exercicio4;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio4_seq111_000 M4( m1, x, clk, reset );

	initial
	begin
		$display("Guia 10 - Bruno Rafael Nicolletti");
		$display("\nTime\tX   Seq 111|000" );


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
		$display ( "%4d \t%b\t%b", $time, x, m1);
	end // always at positive edge clocking changing

endmodule 
