// Exemplo0006 - NAND 
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module nandgate ( output s, 
input p, 
input q); 
assign s =~(p & q); 
endmodule // nandgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0006 - Gustavo Jota Resende - 427413"); 
$display("Test NAND gate"); 
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
endmodule // testandgate

// 0.1 03/08 esboco 
// 
// ---------------------------------------------- testes 

// 
// Versao Teste 
// 0.1 01. ( OK ) identificacao de programa 
// Resultados: 0=0, 1=1, 0=0
// 0.1 02. ( OK ) identificacao de programa 
// Resultados: ~0=1, ~1=0 
// 0.1 03. ( OK ) identificacao de programa 
// Resultados: 0 & 0 = 0,  0&1=0, 1&0=0, 1&1=1 
// 0.1 04. ( OK ) identificacao de programa 
// Resultados: 0 & 0 = 0, 0&1=1, 1&0=1, 1&1=1 
// 0.1 05. ( OK ) identificacao de programa 
// Resultados: 0011 ^ 0101 = 0110 , 0000 ^ 0000 = 0000, 0010 ^ 0001 = 0011, 0001 ^ 0011 = 0010, 0101 ^ 0010 = 0111, 1010 ^ 0011 = 1001, 1001 ^ 0011 = 1010
// 0.1 06. ( OK ) identificacao de programa 
// Resultados:  0 & 0 = 1, 0 & 1 = 1, 1 & 0 = 1, 1 & 1 = 0