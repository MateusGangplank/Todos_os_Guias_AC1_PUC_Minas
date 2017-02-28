// -------------------------
// Exercicio0006 - XOR
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xorgate ( output s,
input a,
input b);
assign s = (~a)&b|a&(~b);
endmodule // xorgate
// ---------------------
// -- test xor gate
// ---------------------
module testxorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
xorgate XOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio0006 - Flavio Andrade Amaral Motta - 392001");
$display("Test XOR gate");
$display("\na a'b+a b' = s\n");
a=0; b=0;
$monitor("%d %b = %b",a, b, s);
#1 b=1;
#2 b=0;
#2 a=1;
#3 b=1;
end
endmodule // testxorgate