// ------------------------- 
// Exercicio0006 - XOR
// Nome: Guilherme Moreira Nunes 
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// -- xor gate 
// ------------------------- 
module xorgate ( output s, input p, q ); 
assign s = (~p & q) | (p & ~q) ; 
endmodule // xorgate 
// --------------------- 
// -- test xor gate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
reg a;
reg b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xorgate XOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0006 - Guilherme Moreira Nunes - 408947"); 
$display("Test XOR gate de Morgan"); 
$display("\na ^ b = s\n"); 
a=0; b=0; 
$monitor("%b ^ %b = %b", a, b, s); 
#1 a=0; b=1;  
#1 a=1; b=0; 
#1 a=1; b=1; 
end 
endmodule // testxorgate 