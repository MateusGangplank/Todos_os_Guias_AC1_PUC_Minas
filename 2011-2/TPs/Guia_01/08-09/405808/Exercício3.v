// ------------------------- 
// Exercício0003 - XNOR 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808 
// ------------------------- 
// ------------------------- 
// -- XNor gate 
// ------------------------- 
module XNorgate ( output s, 
input p, q); 
assign s = (~(p^q)); 
endmodule // XNorgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testXNorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
XNorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0003 - Jose Ferreira Reis Fonseca  - 405808"); 
$display("Test XNOR gate"); 
$display("\na ~^ b = s\n"); 
$monitor("%b ~^ %b = %b", a, b, s);
a=0; b=0; 
#1;
a=0; b=1; 
#1; 
a=1; b=0; 
#1; 
a=1; b=1; 
#1; 
end 
endmodule // testXNorgate 