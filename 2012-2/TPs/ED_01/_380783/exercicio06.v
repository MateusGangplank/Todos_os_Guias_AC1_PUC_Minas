// --------------------- 
// Exercicio01-05 - XOR
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
// -- XOR
// --------------------- 
module xorgate (output s, 
input p, 
input q); 
assign s = (~p&q)|(p&~q); 
endmodule // xorgate 
// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xorgate XOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
b=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01-06 - Lucas Siqueira Chagas - 380783"); 
$display("Test XOR gate "); 
$display("\n (~a&b)|(a&~b) = s\n"); 
a=0; b=0;
$monitor("(~%b&%b)|(%b&~%b) = %b", a, b, a,b,s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testxorgate 