// Exemplo0009 - OR
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
input p, 
input q, input r); 
assign s = (p | q | r); 
endmodule // orgate 
// --------------------- 
// -- test o gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0009 - Gustavo Jota Resende - 427413"); 
$display("Test OR gate"); 
$display("\na | b | c = s\n"); 
a=0; b=0; c=0; 
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=0; b=0; c=1; 
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=0; b=1; c=0; 
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=0; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=0; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=0; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=1; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
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
// 0.1 08. ( OK ) identificacao de programa 
// Resultados:  0 & 0 = 1, 0 & 1 = 0, 1 & 0 = 0, 1 & 1 = 1
// 0.1 09. ( OK ) identificacao de programa 
// Resultados:  0 & 0 & 0 = 0, 0 & 0 & 1 = 0, 0 & 1 & 0 = 0, 0 & 1 & 1 = 0, 1 & 0 & 0 = 0, 1 & 0 & 1 = 0, 1 & 1 & 0 = 0, 1 & 1 & 1 = 1
// 0.1 10. ( OK ) identificacao de programa 
// Resultados: 0 | 0 | 0 = 0, 0 | 0 | 1 = 1, 0 | 1 | 0 = 1, 0 | 1 | 1 = 1, 1 | 0 | 0 = 1, 1 | 0 | 1 = 1,  1 | 1 | 0 = 1, 1 | 1 | 1 = 1
