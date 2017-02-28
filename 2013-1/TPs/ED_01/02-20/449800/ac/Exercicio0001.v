// ------------------------- 
// Exercicio0001 - NAND 
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 
// ------------------------- 
// -- NAND gate 
// ------------------------- 
module nandgate ( output s, 
input p, 
input q); 
assign s = ~(p & q); 
endmodule // nandgate 
// --------------------- 
// -- test NAND gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0001 -Fabio Fiuza Pereira - 406087"); 
$display("NAND gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=0; b=1; 
#1 $display("%b & %b = %b", a, b, s); 
a=1; b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=1; b=1; 
#1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testnandgate 