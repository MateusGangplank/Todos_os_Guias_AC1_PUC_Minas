// ------------------------- 
// Exercicio0004 - OR(NN) 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808 
// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orNNgate ( output s, 
input p, q, c); 
assign s = (~((((~p) | (~q)) | (~c)))); 
endmodule // orNNgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorNNgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orNNgate ORNN1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0004 - José Ferreira Reis Fonseca  - 405808"); 
$display("Test OR(NN)3 gate"); 
$display("\n~((~a | ~b) | ~c) = s\n"); 
$monitor("~((~%b | ~%b) | ~%b) = %b", a, b, c, s); 
a=0; b=0; c=0;
#1;
a=0; b=0; c=1;
#1;
a=0; b=1; c=0;
#1; 
a=0; b=1; c=1;
#1; 
a=1; b=0; c=0;
#1; 
a=1; b=0; c=1;
#1; 
a=1; b=1; c=0;
#1; 
a=1; b=1; c=1;
#1; 
end 
endmodule // testorNNgate 