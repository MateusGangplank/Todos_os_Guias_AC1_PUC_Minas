// ---------------------
// Exercicio0003 - XNOR
// Nome: Lucas Cardoso
// Matricula: 441694
// ---------------------
// ---------------------
// -- xnor gate
// ---------------------
module xnorgate ( output s,
input a,
input b);
assign s = ~(a^b);
endmodule //
// ---------------------
// -- test xnorgate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio0003 - Lucas Cardoso - 441694");
$display("Test XNOR gate");
$display("\na & b = s\n");
$monitor("%b & %b = %b", a, b, s);
a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testxnorgate