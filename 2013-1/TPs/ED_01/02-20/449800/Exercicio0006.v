// ------------------------- 
// Exercicio0006 - XOR 
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 
// ------------------------- 
// -- XOR gate 
// ------------------------- 
module xorgate ( output s, 
input p, 
input q); 
assign s = ((~p|q)+(p|~q)); 
endmodule // xorgate 
// --------------------- 
// -- test XOR gate 
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
$display("Exemplo0003 -Fabio Fiuza Pereira - 406087"); 
$display("XOR gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $monitor("%b & %b = %b", a, b, s); 
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;


end 
endmodule // testxorgate 