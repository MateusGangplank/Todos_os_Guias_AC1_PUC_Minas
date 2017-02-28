//Henrique Carvalho Parreira
//347133

`define found    1
`define notfound 0


module exercicio4_seq010_101 ( y, x, clk, reset );

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

module Exercicio4;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio4_seq010_101 M4( m1, x, clk, reset );

	initial
	begin
		 $display("Henrique Carvalho Parreira 347133");
$display("Guia 11 Ex:04\n");
		$display("Time\tX   Seq 101|010" );



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

/* 	TESTE

Henrique Carvalho Parreira
347133

    
    Time	X   Seq 101|010
      10 	0	0
      20 	1	0
      30 	0	1
      40 	0	0
      50 	1	0
      60 	0	1
      70 	1	0
      80 	1	0
      90 	1	0
     100 	1	0
     110 	0	0
     120 	1	1
     130 	1	0
     140 	1	0
     150 	0	0
     160 	1	1
     170 	0	0
     180 	0	0
     190 	0	0

*/