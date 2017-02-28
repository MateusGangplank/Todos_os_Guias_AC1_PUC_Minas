// Nome: Isabella Gonçales
// Matricula: 420120


// ---------------------------
// ------ EXERCICIO 02 -------
// ---------------------------


// constant definition
`define found    1
`define notfound 0


module  exercicio02 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter        
		start  = 3'b000,
		id0    = 3'b110,
		id01   = 3'b001,
		id011  = 3'b010,
		id0110 = 3'b101;  
		
	reg [2:0] E1;
	reg [2:0] E2;


	// next state logic
		always @( x or E1 )
		begin
		y = `notfound;
		
		case( E1 )
		start:
			if ( x )
				E2 = start;
			else
				E2 = id0;
			
			id0:
				if ( x )
					E2 = id01;
				else
					E2 = id0;
			
			id01:
				if ( x )
					E2 = start;
				else
					E2 = id011;
			
			id011:
				if ( x )
					E2 = id0110;
				else
					E2 = id0;
			
			id0110:
			if ( x )
				begin
			 		E2 = start;
					y = `found;
				end
			else
				begin
					E2 = id0;
					y = `found;
				end
			
			default:   // undefined statee  
				E2 = 3'bxxx;
				
		endcase
		end // always at signal or state changing


	// state variables
		always @( posedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    // updates current state
			else
				E1 = 0;     // reset
				
		end
endmodule 


module Exercicio2;
	
	reg   clk, reset, x;
	wire  m1;

 	exercicio02  EX2 ( m1, x, clk, reset );

	initial
	begin
		
		
		$display("\nTime\tX   Seq 0110" );

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
			
	end 
endmodule 