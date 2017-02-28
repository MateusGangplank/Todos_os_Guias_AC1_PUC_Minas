// ------------------------- 
// Exercício0002 - NOR 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808 
// ------------------------- 
// ------------------------- 
// -- Nor gate 
// ------------------------- 
module Norgate ( output s, 
input p, q); 
assign s = (~(p | q)); 
endmodule // Norgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testNorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
Norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0002 - Jose Ferreira Reis Fonseca  - 405808"); 
$display("Test NOR gate"); 
$display("\na ~| b = s\n"); 
$monitor("%b ~| %b = %b", a, b, s);
a=0; b=0; 
#1;
a=0; b=1; 
#1; 
a=1; b=0; 
#1; 
a=1; b=1; 
#1; 
end 
endmodule // testorgate 