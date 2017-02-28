// -----------------------------------------------------------------
// Guia 11 - Exericio 05 - máquina de estados finitos capaz de 
// identificar uma sequência de três bits alternados
// (111) ou (000).
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -----------------------------------------------------------------

// constant definitions
`define found 1
`define notfound 0

// FSM by Mealy
module guia11_ex05 ( y, x, clk, reset );
output y;
input x;
input clk;
input reset;

reg y;

parameter // state identifiers 
start = 3'b000,
id1 = 3'b001,
id11 = 3'b011,
id0 = 3'b110,
id00 = 3'b100;

reg [2:0] E1; // current state variables
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
E2 = id0;

id1:
if ( x )
E2 = id11;
else
E2 = start;

id11:
if ( x )
begin
E2 =  id11;
y  = `found;
end
else
begin
E2 =  start;
y  = `notfound;
end

id0:
if ( x )
E2 = start;
else
E2 = id00;

id00:
if ( x )
begin
E2 =  start;
y  = `notfound;
end
else
begin
E2 =  id00;
y  = `found;
end

default: // undefined state
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

endmodule // numero05_seq000_111