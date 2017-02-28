
// 
// Ex 03
// Vinicius Dos Santos Bordoni
// 365595
//


module XNOR ( s1, e1, e2, e3, e4);

output s1;
input e1, e2, e3, e4;

assign s1 = ~( e1 ^ e2 ^ e3 ^ e4 );

endmodule

module Exe_XNOR;

reg a, b, c, d;
wire e;

XNOR XNOR1( e, a, b, c, d);

initial begin

$display("Guia 01 Ex03");
$display("Vinicius dos Santos Bordoni");
$display("365595");
$display("Teste da porta XNOR com 4 entradas.");
$display("\n e1 e2 e3 e4 s1\n");
$monitor(" %b  %b  %b %b  %b", a, b, c, d, e);

#1		a=0; b=0; c=0; d=0;
#1		a=0; b=0; c=0; d=1;
#1		a=0; b=0; c=1; d=0;
#1		a=0; b=0; c=1; d=1;
#1		a=0; b=1; c=0; d=0;
#1		a=0; b=1; c=0; d=1;
#1		a=0; b=1; c=1; d=0;
#1		a=0; b=1; c=1; d=1;
#1		a=1; b=0; c=0; d=0;
#1		a=1; b=0; c=0; d=1;
#1		a=1; b=0; c=1; d=0;
#1		a=1; b=0; c=1; d=1;
#1		a=1; b=1; c=0; d=0;
#1		a=1; b=1; c=0; d=1;
#1		a=1; b=1; c=1; d=0;
#1		a=1; b=1; c=1; d=1;
end

endmodule