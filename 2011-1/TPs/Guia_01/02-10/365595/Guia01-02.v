
// 
// Ex 02
// Vinicius Dos Santos Bordoni
// 365595
//


module NOR ( s1, e1, e2, e3);

output s1;
input e1, e2, e3;

assign s1 = ~( e1 | e2 | e3 );

endmodule

module Exe_NOR;

reg a, b, c;
wire e;

NOR NOR1( e, a, b, c);

initial begin
$display("Guia 01 Ex02");
$display("Vinicius dos Santos Bordoni");
$display("365595");

$display("Teste da porta NOR com 3 entradas.");
$display("\n e1 e2 e3 s1\n");
$monitor(" %b  %b  %b   %b", a, b, c, e);

#1 a=0; b=0; c=0; 
#1 a=0; b=0; c=1; 
#1 a=0; b=1; c=0; 
#1 a=0; b=0; c=1; 
#1 a=0; b=1; c=1; 
#1 a=1; b=0; c=0; 
#1 a=1; b=0; c=1; 
#1 a=1; b=1; c=0; 
#1 a=1; b=1; c=1; 

end

endmodule