// ---------------------
// Exercicio06 - xor (De Morgan)
// Nome: Raphael Quintao
// Matricula: 445171
// ---------------------
// ---------------------
// -- xor gate
// ---------------------
module xorgate (output s, input p, q);
assign s = (~p & q) | (p & ~q);
endmodule // xor
// ---------------------
// -- test xorgate
// ---------------------
module testxorgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
xorgate xor1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0; 
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio06 - Raphael Quintao - 445171");
$display("Test xor gate (De morgan)");
$display("\n~a & ~b = s\n");
$monitor("~%b & ~%b = %b", a, b, s);

#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1;

end
endmodule // testxorgate