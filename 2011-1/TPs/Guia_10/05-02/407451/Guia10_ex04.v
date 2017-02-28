// Guia 10
// Karen Alves Pereira
// Matricula: 407451

// ---Exercicio 04 


 `define found    1
 `define notfound 0


 module exercicio4 ( y, x, clk, reset );

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

// --------------------
// --- TESTE
// --------------------

 module testeexercicio4;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio4 M4 ( m1, x, clk, reset );

	initial
	begin
      $display("Karen Alves Pereira" );
      $display("Time\tX   Seq 000|111" );


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
		#10  x = 0;
		#10  x = 0;
		#10  x = 0;
		#10  x = 1;
		
		#5 $finish;
	
	end 

	always
		#5 clk = ~clk;

	always @( posedge clk )
	begin
		$display ( "%4d \t%b\t%b", $time, x, m1);
	end

endmodule 