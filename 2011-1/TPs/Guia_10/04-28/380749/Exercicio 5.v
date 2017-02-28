// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module exercicio5_seq101_010 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id10   = 3'b011,
		id0    = 3'b110,
		id01   = 3'b100;

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
					E2 = id10;
				else
					E2 = start;

			id10:
				if ( x )
				begin
					E2 =  id10;
					y  = `found;
				end
				else
				begin
					E2 =  start;
					y  = `notfound;
				end
			
			id0:
				if ( x )
					E2 = start;
				else
					E2 = id01;

			id01:
				if ( x )
				begin
					E2 =  start;
					y  = `notfound;
				end
				else
				begin
					E2 =  id01;
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

endmodule // exercicio5_seq101_010

module Exercicio5;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio5_seq101_010 M5 ( m1, x, clk, reset );

	initial
	begin
		$display("Guia 10 - Braulio Lima e Andrade - 380749");
		$display("\nTime\tX   Seq 101|010" );

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