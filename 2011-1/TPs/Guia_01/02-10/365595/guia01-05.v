
// 
// Ex 05 extra
// Vinicius Dos Santos Bordoni
// 365595
//


module XOR ( s1, e1, e2);

output s1;
input e1, e2;

assign s1 = (( ~e1&e2 | e1&~e2));

endmodule

module Exe_XOR;

reg a, b;
wire e;

XOR XOR1( e, a, b);

initial begin

$display("Guia 01 Ex05");
$display("Vinicius dos Santos Bordoni");
$display("365595");
$display("Teste da porta XOR com 2 entradas.");
$display("\n e1 e2 e3\n");
$monitor(" %b  %b  %b", a, b, e);

#1		a=0; b=0; 
#1		a=0; b=1; 
#1		a=1; b=0; 
#1		a=1; b=1; 
end

endmodule