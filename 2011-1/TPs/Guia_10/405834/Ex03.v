`define found    1
`define notfound 0

module Ex03 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter  
		start  = 3'b000,
		id1    = 3'b001,
		id10   = 3'b010,
		id101  = 3'b100;

	reg [2:0] E1;	
	reg [2:0] E2;	

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
	 
			default:  
				E2 =  3'bxxx;
		endcase
	  
		end 
		

		always @( negedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    
			else
				E1 = 0;     
		end // always at signal changing

endmodule 

module Exercicio3;
	
	reg   clk, reset, x;
	wire  m1;

	Ex03 M3 ( m1, x, clk, reset );

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