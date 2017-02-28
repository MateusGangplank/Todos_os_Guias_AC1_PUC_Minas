// Nome: Giselle Caroline Vieira
// Matrícula: 424649



`define found    1
`define notfound 0


module exe05_seq_101_010 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter     
		start  = 3'b000,
		id1    = 3'b001,
		id0    = 3'b110,
		id10   = 3'b010,
		id01   = 3'b101;

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
					E2 = id0;
				
			id1:
				if ( x )
					E2 = id1;
				else
					E2 = id10;

			id10:
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
					E2 = id01;
				else
					E2 = id0;

			id01:
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
	 
			default:   
				E2 =  3'bxxx;
		endcase
	  
		end 		

	
		always @( posedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    
							else
				E1 = 0;    
		end 

endmodule 

module Exercicio5;
	
	reg   clk, reset, x;
	wire  g;

	exe05_seq_101_010 G1( g, x, clk, reset );

	initial
	begin
		$display("Giselle caroline Vieira" );
		$display("Sequencia 101 ou 010\n" );



       clk   = 1;
       reset = 0;
       x     = 0;

	
		#10   reset = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
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
		$display ( "%4d \t%b\t%b", $time, x, g);
		
	end
endmodule 

