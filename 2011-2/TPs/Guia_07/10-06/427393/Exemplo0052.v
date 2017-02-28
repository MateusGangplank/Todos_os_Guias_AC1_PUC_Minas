// ------------------------- 
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// -------------- 
// --- Mealy FSM 
// -------------- 
/* 
Mealy FSM Diagram 
                  _____________ 
                 /             \ 
          1     v     0       1| // found 
[start] ---> [id11] ---> [id110] 
^ \0          1/ ^         0 |
\_/            \__/         |  
\                          /    
 \                        /   
  \______________________/     
    
*/ 

// constant definitions 
`define found 1 
`define notfound 0 

// FSM by Mealy 
module Mealy101 ( y, x, clk, reset );
	output y; 
	input x; 
	input clk; 
	input reset; 
	reg y; 

parameter // state identifiers 
	start = 2'b00, 
	id11 = 2'b11, 
	id110 = 2'b10; 	
	reg [1:0] E1; // current state variables 
	reg [1:0] E2; // next state logic output 

// next state logic 
	always @( x or E1 ) 
	
	begin 
		y = `notfound; 
		
		case ( E1 ) 
			start: 
			
				if ( x ) 
					E2 = id11; 			
				else 
					E2 = start; 
					
				id11: 
				if ( x ) 
					E2 = id11; 				
				else 
					E2 = id110; 
				
				id110: 
					if ( x ) 
					begin 
						E2 = id11; 
						y = `found; 
					end 				
				else 
					begin 
						E2 = start; 
						y = `notfound; 
					end 

			default: // undefined state 
			E2 = 2'bxx; 
		endcase 
	end // always at signal or state changing 

// state variables 
	always @( posedge clk or negedge reset ) 
	begin 
		
		if ( reset ) 
			E1 = E2; // updates current state 
		else 
			E1 = 0; // reset 
	end // always at signal changing 
endmodule // mealy101 
module Teste; 
	reg clk, reset, x; 
	wire m1;
	 
	Mealy101 mealy ( m1, x, clk, reset ); 
	
initial begin 
	$display ( "Guia 07 - Camila Guedes Silveira - 427393" );
	$display ( "Exemplo0052" ); 

	// valores iniciais 
	clk = 1; 
	reset = 1; 
	x = 0; 

	//#5 reset = 0;
	#10 x = 1; 	
	#10 x = 0;
	#10 x = 1; 
	  
	#10 $finish; 
end // initial
 
always 
	#5 clk = ~clk; 

always @( posedge clk ) 
	begin 
		$display ( "%4d %4b %4b ", $time, x, m1); // -- resultado de m1 é 0 (notfound)
	end // always at positive edge clocking changing 
endmodule //teste
