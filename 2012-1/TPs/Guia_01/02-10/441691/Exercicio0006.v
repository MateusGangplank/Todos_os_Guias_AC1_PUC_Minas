// --------------------- 
// Exercicio0006 - xor 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// --------------------- 
// --------------------- 
// -- xor gate 
// --------------------- 
module xorgate (output  s, 
input  p, 
input  q); 
assign s = (~p&q) | (p&~q); 
endmodule // xor 
// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
reg  a,b; // definir registrador 
wire  s; // definir conexao (fio) 
// ------------------------- instancia 
xorgate XOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;
b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio0006 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test xor gate"); 
$display("\n (~a&b)|(a&~b) = s\n");  
$monitor("%b ^ %b = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1;  
end 
endmodule // testxorgate 