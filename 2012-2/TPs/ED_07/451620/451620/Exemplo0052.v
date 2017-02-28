//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
// --------------
// --- Mealy FSM
// --------------
// constant definitions
`define found 1
`define notfound 0
// FSM by Mealy
module mealy1010 ( y, x, clk, reset ); // devera ser reconhecido 1001001
output y;
input x;
input clk;
input reset;
reg y;
parameter // state identifiers
start = 2'b00,
id1 = 2'b01,
id11 = 2'b10,
id110 = 2'b11;
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
E2 = start;
else
E2 = id11;
id11:
if ( x )
E2 = id110;
else
E2 = id11;
id110:
if ( x )
E2 = start;
else
begin
E2 = id1;
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
endmodule // mealy1010
module teste;
reg clk, reset, x;
wire m1, m2;
mealy1010 mealy1 ( m1, x, clk, reset );
initial
begin
$display ( "Time X Mealy" );
// initial values
clk = 1;
reset = 0;
x = 0;
// input signal changing
#5 reset = 1;
#10 x = 1;
#10 x = 0;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 0;
#10 x = 0;
#10 x = 1;
#40 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d %4b %4b", $time, x, m1 );
end // always at positive edge clocking changing
endmodule // teste