// -------------------------
// Exemplo0054 - GUIA-07
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

// constant definitions
`define found 1
`define notfound 0
// FSM by Mealy
module mealy1100 ( y, x, clk, reset );
output y;
input x;
input clk;
input reset;
reg y;

parameter // state identifiers
start = 2'b00,
id1   = 2'b01,
id11  = 2'b11,
id110 = 2'b10;
reg [1:0] E1; // current state variables
reg [1:0] E2; // next state logic output
// next state logic
always @( x or E1 ) begin

y = `notfound;
case ( E1 )

start:
if ( x )
E2 = id1;
else
E2 = start;

id1:
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
E2 = id1;
y = `notfound;
end
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
always @( posedge clk or negedge reset ) begin
if ( reset )
E1 = E2; // updates current state
else
E1 = 0; // reset
end // always at signal changing
endmodule // mealy1100

module Exemplo0054;
reg clk, reset, x;
wire m1;
mealy1100 mealy1 ( m1, x, clk, reset );

initial begin
$display ( "Tempo Entrada Saida" );
// initial values
clk = 1;
reset = 0;
x = 0;
// input signal changing
#5 reset = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#10 x = 0;
#20 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d     %4b          %4b", $time, x, m1 );
end // always at positive edge clocking changing
endmodule // Exemplo0054