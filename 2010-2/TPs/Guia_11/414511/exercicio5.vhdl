// ---------------------
// Guia 11_05 - Mealy - FSM capaz de identificar uma sequência de três bits alternados (111) ou (000).
// Nome:Nádia de souza Maciel Vieira Ferreira
// Matricula: 414511
// ---------------------

//Implementar um máquina de estados finitos capaz de identificar uma sequência de três bits alternados (111) ou (000).
 



// --- Mealy FSM
// --- seq: 000 ou 111


// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module exercicio5_seq000_111 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id11   = 3'b011,
		id0    = 3'b110,
		id00   = 3'b100;

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

endmodule // exercicio5_seq000_111

module Exercicio5;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio5_seq000_111 M5 ( m1, x, clk, reset );

	initial
	begin
		$display("Guia 11_05 -Nádia de Souza Maciel Vieira Ferreira - 414511);
		$display("\nTime\tX   Seq 000|111" );

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

/* Resultado obtido
         
    Time		X   Seq 000|111
      10 	0		0
      20 	1		0
      30 	0		0
      40 	0		0
      50 	1		0
      60 	0		0
      70 	1		0
      80 	1		0
      90 	1		0
     100 	1		1
     110 	0		0
     120 	1		0
     130 	1		0
     140 	1		1
     150 	0		0
     160 	1		0
     170 	0		0
     180 	0		0
     190 	0		0
    
    */