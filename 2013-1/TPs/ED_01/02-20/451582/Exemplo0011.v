// ------------------------- 
// Exemplo0011 - XOR 
// Nome: Joao Augusto de Moura Araujo
// Matricula: 451582
// ------------------------- 
// ------------------------- 
// -- xor gate 
// ------------------------- 
module xorgate ( output s,input p, q); 
assign s = ~p&q^p&~q ; 
endmodule // xorgate 
// --------------------- 
// -- test xor gate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
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
$display("Exemplo0011 - Joao Augusto de Moura Araujo - 451582"); 
$display("Test XOR gate"); 
$display("\na ^ b = s\n"); 
#1 a=0; b=0; 
$monitor("%b ^ %b = %b", a, b, s); 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 
 
end 
endmodule // testxorgate