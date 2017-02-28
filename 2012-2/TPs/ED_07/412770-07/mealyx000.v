// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------

// --------------
// --- Mealy FSM
// --------------

//Mealy FSM Diagram x000

// constant definitions
`define found 1
`define notfound 0

// FSM by Mealy
module mealyx000 ( y, x, clk, reset );
output y;
input x;
input clk;
input reset;
reg y;
parameter // state identifiers

start = 2'b00,
id1 = 2'b01,
id10 = 2'b10,
id11 = 2'b11;

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
E2 = id1;

id1:
if ( x )
E2 = id1;
else
E2 = id10;

id10:
if ( x )
E2 = id1;
else
E2 = id11;

id11:
if ( x )
E2 = id1;
else
begin
E2 = start;
y = `found;
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
endmodule // mealyx000