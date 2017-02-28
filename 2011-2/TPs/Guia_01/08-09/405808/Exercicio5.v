// ------------------------- 
// Exercicio0005 - AND(NN) 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andNNgate ( output s, 
input p, q, c); 
assign s = (~((((~p) & (~q)) & (~c)))); 
endmodule // andNNgate 
// --------------------- 
// -- test andNN gate 
// --------------------- 
module testandNNgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andNNgate ANDNN1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0004 - José Ferreira Reis Fonseca  - 405808"); 
$display("Test AND(NN)3 gate"); 
$display("\n~((~a & ~b) & ~c) = s\n"); 
$monitor("~((~%b & ~%b) & ~%b) = %b", a, b, c, s); 
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
endmodule // testandNNgate 