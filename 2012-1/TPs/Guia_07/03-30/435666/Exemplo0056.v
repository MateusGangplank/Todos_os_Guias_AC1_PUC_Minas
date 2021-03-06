// Exemplo0056 - EXTRA 
// Aluno: Julio Machado
// Matricula: 435666

// -------------- 
// --- Moore FSM 
// -------------- 

// constant definition 
`define found 1 
`define notfound 0 

// FSM by Moore 
module moorexxxx ( y, x, clk, reset ); 
output y; 
input x; 
input clk; 
input reset; 
reg y; 
reg z;
parameter // state identifiers 

start = 3'b000, 
id1 = 3'b001, 
id11 = 3'b011, 
id110 = 3'b010, 
id1101 = 3'b110; // signal found 

reg [2:0] E1; // current state variables 
reg [2:0] E2; // next state logic output 

// next state logic 
always @( x or E1 ) 
	begin 
	case( E1 ) 
	start:   
	begin
     E2 = id1; 
	  z = x;
	 end
	id1: 
		if ( x == z ) 
			E2 = id11; 
		else 
		   E2 = start; 
	id11: 
		if ( x == z ) 
			E2 = id110; 
		else 
			E2 = start; 
	id110: 
		if ( x == z ) 
			E2 = id1101; 
		else 
			E2 = start; 
	id1101: 
		if ( x == z ) 
			E2 = id11; 
		else
			E2 = start;
default: // undefined statee 
E2 = 3'bxxx; 
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

// output logic 
always @( E1 ) 
begin 
y = E1[2]; // first bit of state value 

end // always at state changing 

endmodule // moorexxxx 