//Henrique Carvalho Parreira
//347133

`define found    1
`define notfound 0


module exercicio5_seq000_111 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         
		start  = 3'b000,
		id1    = 3'b001,
		id11   = 3'b011,
		id0    = 3'b110,
		id00   = 3'b100;

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
					E2 = id11;
				else
					E2 = start;

			id11:
				if ( x )
				begin
					E2 =  id11;
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
					E2 = id00;

			id00:
				if ( x )
				begin
					E2 =  start;
					y  = `notfound;
				end
				else
				begin
					E2 =  id00;
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
		end // always at signal changing

endmodule 

module Exercicio5;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio5_seq000_111 M5 ( m1, x, clk, reset );

	initial
	begin
				 $display("Henrique Carvalho Parreira - 347133");
			$display("Guia 11 Ex:05\n");
		$display("\nTime\tX   Seq 000|111" );


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


//Henrique Carvalho Parreira
//347133

    
    Time	X   Seq 000|111
      10 	0	0
      20 	1	0
      30 	0	0
      40 	0	0
      50 	1	0
      60 	0	0
      70 	1	0
      80 	1	0
      90 	1	0
     100 	1	1
     110 	0	0
     120 	1	0
     130 	1	0
     140 	1	1
     150 	0	0
     160 	1	0
     170 	0	0
     180 	0	0
     190 	0	0
    
*/