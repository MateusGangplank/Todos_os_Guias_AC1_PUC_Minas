// ---------------------------------------- 
// Mealy000or111
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ----------------------------------------

// -------------- 
// --- Mealy FSM 
// -------------- 
/* 
					Mealy FSM Diagram 
					__________________ 
				/							   \ 
			1 v    1	 	0		        1 | // found 
		[start] ---> [id1] --->   [id11] ---> [id110] 
		   ^ \0    0 |     1 / ^      0 | // not found
			\_/       /      \__/   	  |
		    \_______/					    / 
			  \                        / 
			   \______________________/ 
*/ 


//-- constant definitions 
`define found 1 
`define notfound 0 

//-- FSM by Mealy 

module mealy000or111 ( y, x, clk, reset ); 
output y; 
input x; 
input clk; 
input reset; 
reg y; 

parameter //-- state identifiers 

start = 2'b00, 
id1 = 2'b01, 
id11 = 2'b11, 
id110 = 2'b10,
id010 = 2'b10;

reg [1:0] E1; //-- current state variables 
reg [1:0] E2; //-- next state logic output 

//-- next state logic 

always @( x or E1 ) 

begin 
	y = `notfound; 

case ( E1 ) 

start: 

if ( x ) 
	E2 = id1; //-- Achou 1
else 
	E2 = id11; //-- Achou 0


//-- Estado que vem 1 e acha 1	
id1: 

if ( x ) 
	E2 = id110; //-- Achou 1 ate aqui, 11 manda para o final
else 
	E2 = id11; //-- Achou 0 ate aqui 0


//-- Estado que vem 0 e acha 0
id11: 

if ( x ) 
	E2 = id1; //-- Achou 1 ate aqui 1
else 
	E2 = id010; //-- Achou 0 ate aqui 00 , manda00 final


//--Estado final 111
id110: 

if ( x ) 

begin 
	E2 = start; 
	y = `found; //--achou  1 ate aqui 1
end 
//-- Caso  seja 0 volta no comeco
else 
	begin 
	E2 = id11; 
	y = `notfound; 
end 

//--Estado final 000
id010: 

if ( x ) 

begin 
	E2 = id1; 
	y = `notfound; //--achou  1 ate aqui 1
end 
//-- Caso  seja 1 volta no comeco
else 
	begin 
	E2 = start; 
	y = `found; 
end 

default: //-- undefined state 

E2 = 2'bxx; 

endcase 

end //-- always at signal or state changing 
//-- state variables 

always @( posedge clk or negedge reset ) 

	begin 
if ( reset ) 
	E1 = E2; //-- updates current state 
else 
	E1 = 0; //-- reset 
	end // always at signal changing 

endmodule //-- mealy000or111