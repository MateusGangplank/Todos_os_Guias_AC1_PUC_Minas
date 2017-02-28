// ------------------------- 
// Exercicio 01 - NAND 
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// -- not gate 
// ------------------------- 
module nandgate (output s, 
input a, input b); 
assign s = ~(a&b); 
endmodule // nandgate 
// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente)
reg b; 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a = 0; // valor inicial 
b = 0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercício 1 - Nand Gate - Gabriel Benjamim de Carvalho - 396690"); 
$display("Test Nand gate"); 
$display("\na&b = s\n"); 
a=0; b = 0; 
#1 $display("%b %b = %b", a, b, s); 
a=0; b =1; 
#1 $display("%b %b = %b", a, b, s);
a=1; b = 0; 
#1 $display("%b %b = %b", a, b, s);
a=1; b = 1; 
#1 $display("%b %b = %b", a, b, s); 
end 
endmodule // testnandgate 