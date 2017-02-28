// ------------------------- 
// Exercicio0001 - NAND 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// -- Nand gate 
// ------------------------- 
module Nandgate ( output s, input p, input q); 
assign s = (~(p & q)); 
endmodule // andgate 
// --------------------- 
// -- test Nand gate 
// --------------------- 
module testNandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
Nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:setup 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercício0001 - José Ferreira Reis Fonseca  - 405808"); 
$display("Test NAND gate"); 
$display("\na ~& b = s\n"); 
a=0; b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=0; b=1; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1; b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1; b=1; 
#1 $display("%b ~& %b = %b", a, b, s); 
end 
endmodule // testNandgate 