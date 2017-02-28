// ---------------------
// Guia 11 - Exercicio 01 - Mealy 
// Nome: Bruno César Lopes Silva - 415985
// ---------------------

// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module exercicio01_seq010_mealy ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 2'b00,
		id0    = 2'b01,
		id01   = 2'b10;

	reg [1:0] E1;	// current state variables
	reg [1:0] E2;	// next state logic output

	// next state logic
   always @( x or E1 )
		begin
		y = `notfound;
		
		case ( E1 )
			start:
				if ( x )
					E2 = id0;
				else
					E2 = start;
				
			id0:
				if ( x )
					E2 = id0;
				else
					E2 = id01;

			id01:
				if ( x )
				begin
					E2 =  id0;
					y  = `found;
				end
				else
				begin
					E2 =  start;
					y  = `notfound;
				end
	 
			default:   // undefined state
				E2 =  2'bxx;
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

endmodule // exercicio01_seq010_mealy


module Exercicio1;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio01_seq010_mealy M1( m1, x, clk, reset );

	initial
	begin
		$display("Guia 10 - Bruno Cesar Lopes Silva - 415985");
		$display("\nTime\tX   Seq 010" );

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
