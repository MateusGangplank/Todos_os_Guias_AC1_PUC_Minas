// -----------------------------------------------------------------
// Guia 11 - Exericio 02 - máquina de estados finitos (Moore - FSM)
// capaz de reconhecer uma sequência (0101)
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -----------------------------------------------------------------

// constant definitions
`define found 1
`define notfound 0

// FSM by Moore
module  guia11_ex02 ( y, x, clk, reset );
output y;
input x;
input clk;
input reset;

reg y;

parameter //state identifiers
start = 3'b000,
id0 = 3'b110,
id01 = 3'b001,
id010 = 3'b010,
id0101 = 3'b101;  //signal found

reg [2:0] E1;	// current state variables
reg [2:0] E2;	// next state logic output

// next state logic

always @( x or E1 )
begin
y = `notfound;

case( E1 )
start:
if ( x )
E2 = start;
else
E2 = id0;

id0:
if ( x )
E2 = id01;
else
E2 = id0;

id01:
if ( x )
E2 = start;
else
E2 = id010;

id010:
if ( x )
E2 = id0101;
else
E2 = id0;

id0101:
if ( x )
begin
E2 = start;
y = `found;
end
else
begin
E2 = id0;
y = `found;
end

default: // undefined statee  
E2 = 3'bxxx;

endcase
end //always at signal or state changing


// state variables
always @( posedge clk or negedge reset )
begin
if ( reset )
E1 = E2; // updates current state
else
E1 = 0; // reset
end // always at signal changing

endmodule //--fim guia11_ex02
