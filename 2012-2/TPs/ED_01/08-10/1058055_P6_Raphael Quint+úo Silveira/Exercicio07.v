// ---------------------
// Exercicio07 - xnor
// Nome: Raphael Quintao
// Matricula: 445171
// ---------------------
// ---------------------
// -- xnor gate
// ---------------------
module xnorgate (output s, input p, q);
assign s = (p & q) | (~p & ~q);
endmodule // xnor
// ---------------------
// -- test xorgate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate xnor1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0; 
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio07 - Raphael Quintao - 445171");
$display("Test xnor gate");
$display("\na x b = s\n");
$monitor("%b x %b = %b", a, b, s);

#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1;

end
endmodule // testxorgate