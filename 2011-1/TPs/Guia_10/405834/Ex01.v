//Rafael Moreira Melo-405834 

`define found    1
`define notfound 0

module Ex01 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter   
		start  = 2'b00,
		id0    = 2'b01,
		id01   = 2'b10;

	reg [1:0] E1;	// current state variables
	reg [1:0] E2;	// next state logic output

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
	 
			default:				E2 =  2'bxx;
		endcase
	  
		end 		

		always @( posedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    // updates current state
			else
				E1 = 0;     // reset
		end // always at signal changing

endmodule 


module Teste;
	
	reg   clk, reset, x;
	wire  m1;

	Ex01 M1( m1, x, clk, reset );

	initial
	begin
		$display("Rafael Moreira Melo");
		$display("\n Tempo\tX   Sequencia a ser encontrada: 010" );

       clk   = 1;
       reset = 0;
       x     = 0;

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
	
	end

	always
		#5 clk = ~clk;

	always @( posedge clk )
	begin
		$display ( "%4d \t%b\t%b", $time, x, m1);
	end 

endmodule  
