// ---------------------
// Guia 11_03 - Mealy - FSM capaz de reconhecer uma sequência (1001).
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// ---------------------

//Implementar uma máquina de estados finitos (Mealy - FSM)capaz de reconhecer uma sequência (1001)com interseção (1001001 será considerada).
 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ---------------
// --- Mealy FSM
// --- seq: 1001
// ---------------


// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module exercicio3_seq1001_mealy ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         // state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id10   = 3'b010,
		id100  = 3'b100;

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
					E2 = id100;

			id100:
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
	 
			default:   // undefined state
				E2 =  3'bxxx;
		endcase
	  
		end // always at signal or state changing
		

	// state variables
		always @( negedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    // updates current state
			else
				E1 = 0;     // reset
		end // always at signal changing

endmodule // exercicio3_seq1001_mealy

module Exercicio3;
	
	reg   clk, reset, x;
	wire  m1;

	exercicio3_seq1001_mealy M3 ( m1, x, clk, reset );

	initial
	begin
		$display("Guia 11_03 - Marcia Cibele Martins Carneiro - 404591");
		$display("\nTime\tX   Seq 1001" );

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
     ----jGRASP exec: D:\MeusDocumentos\2010-2_arq1_programas\Icarus_Verilog\bin\vvp exercicio3.vvp
    
    Guia 11_01 - Marcia Cibele Martins Carneiro - 404591
    
    Time		X   Seq 1001
      10 	0		0
      20 	1		0
      30 	0		0
      40 	0		0
      50 	1		1
      60 	0		0
      70 	1		0
      80 	1		0
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
    
     ----jGRASP: operation complete.
 */