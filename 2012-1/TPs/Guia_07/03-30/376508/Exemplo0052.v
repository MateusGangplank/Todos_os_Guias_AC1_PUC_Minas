

// constant definitions 
`define found 1 
`define notfound 0 


 
// FSM by Mealy 
module mealy1001 ( y, x, clk, reset ); 
output y; 
input x; 
input clk; 
input reset; 
reg y; 
parameter // state identifiers 
start = 2'b00, 
id1 = 2'b01, 
id10 = 2'b10, 
id100 = 2'b10; 
reg [1:0] E1; // current state variables 
reg [1:0] E2; // next state logic output 
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
E2 = id10; 
else 
E2 = id100; 
id100: 
if ( x ) 
begin 
E2 = id1; 
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
endmodule