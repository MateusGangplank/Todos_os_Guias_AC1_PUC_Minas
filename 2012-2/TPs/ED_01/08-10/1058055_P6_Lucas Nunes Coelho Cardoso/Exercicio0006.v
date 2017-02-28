// ---------------------
// Exercicio0006 - XOR
// Nome: Lucas Cardoso
// Matricula: 441694
// ---------------------
// ---------------------
// -- xor gate
// ---------------------
module xorgate ( output s,
input a,
input b);

//expressão a’b+a b’

assign s = (~a|b)&(a|~b);

endmodule //
// ---------------------
// -- test xorgate
// ---------------------
module testxorgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
xorgate XOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio0006 - Lucas Cardoso - 441694");
$display("Test XOR gate");
$display("\na & b = s\n");
$monitor("%b & %b = %b", a, b, s);
a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testxorgate