// ---------------------
// // Nome: Nádia de Souza Maciel Vieira Ferreira
// Matricula: 414511
// ---------------------

//Implementar uma máquina de estados finitos (Moore - FSM)capaz de reconhecer uma sequência (0101)sem interseção (010101 não será considerada)
 



// --- Moore FSM
// --- seq: 0101



// constant definition
`define found    1
`define notfound 0

// FSM by Moore
module  exercicio2_seq0101_moore ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter        // state identifiers
		start  = 3'b000,
		id0    = 3'b110,
		id01   = 3'b001,
		id010  = 3'b010,
		id0101 = 3'b101;  //  signal found

	reg [2:0] E1;	// current state variables
	reg [2:0] E2;	// next state logic output

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
					E2 = id010;
			
			id010:
				if ( x )
					E2 = id0101;
				else
					E2 = id0;
			
			id0101:
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
		end // always at signal changing

endmodule // exercicio2_seq0101_moore

module Exercicio2;
	
	reg   clk, reset, x;
	wire  m1;

 	exercicio2_seq0101_moore M1 ( m1, x, clk, reset );

	initial
	begin
		
		$display("Guia 11_02  Nádia de Souza Maciel Vieira Ferreira - 414511
");
		$display("\nTime\tX   Seq 0101" );

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

       
    Time		X   Seq 0101
      10 	0		0
      20 	1		0
      30 	0		0
      40 	0		0
      50 	1		0
      60 	0		0
      70 	1		0
      80 	1		1
      90 	1		0
     100 	1		0
     110 	0		0
     120 	1		0
     130 	1		0
     140 	1		0
     150 	0		0
     160 	1		0
     170 	0		0
     180 	0		0
     190 	0		0
    
   