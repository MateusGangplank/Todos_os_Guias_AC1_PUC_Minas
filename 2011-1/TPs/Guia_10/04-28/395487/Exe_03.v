//-- ---------------------
//--	Mealy - FSM capaz de reconhecer uma sequ�ncia (1010).
//-----------------------------
//  Nome: Alvaro Henrique
//  Matr�cula: 395487
//-----------------------------

//----------------------------
//-- -- Guia10 Exercicio 03 --
//----------------------------


//--Implementar uma m�quina de estados finitos (Mealy - FSM)capaz de reconhecer uma sequ�ncia (1010)com interse��o (101010 ser� considerada).
 


//-- ---------------
//-- --- Mealy FSM
//-- --- seq: 1010
//-- ---------------


//-- constant definitions
`define found    1
`define notfound 0


module exe_03 ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter         //-- state identifiers 
		start  = 3'b000,
		id1    = 3'b001,
		id10   = 3'b010,
		id101  = 3'b100;

	reg [2:0] E1;	//-- current state variables
	reg [2:0] E2;	//-- next state logic output

	//-- next state logic
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
	 
			default:   //-- undefined state
				E2 =  3'bxxx;
		endcase
	  
		end //-- always at signal or state changing
		

	//-- state variables
		always @( negedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    //-- updates current state
			else
				E1 = 0;     //-- reset
		end //-- always at signal changing

endmodule //-- exe_03

module exe03;
	
	reg   clk, reset, x;
	wire  m1;

	exe_03 M3 ( m1, x, clk, reset );

	initial
	begin
	
		$display("Guia 10 EX_03 - Alvaro Rungue");
		$display("\nTime\tX   Seq 1010" );

		//-- initial values
       clk   = 1;
       reset = 0;
       x     = 0;

	//-- input signal changing
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
	
	end //-- initial

	always
		#5 clk = ~clk;

	always @( posedge clk )
	begin
		$display ( "%4d \t%b\t%b", $time, x, m1);
	end //-- always at positive edge clocking changing

endmodule 