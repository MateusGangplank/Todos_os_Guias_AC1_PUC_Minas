// Exemplo0007 - NOR
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s, 
input p, q); 
assign s = ~(p | q); 
endmodule // norgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0007 - Gustavo Jota Resende - 427413"); 
$display("Test NOR gate"); 
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
endmodule // testorgate 

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
// 0.1 07. ( OK ) identificacao de programa 
// Resultados:  0 & 0 = 1, 0 & 1 = 0, 1 & 0 = 0, 1 & 1 = 0