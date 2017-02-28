// -------------------------
// Exercicio 06 - XOR Morgam
// Nome: Yousef
// Matricula: 441714
// -------------------------
// -------------------------
// -- Nor gate
// -------------------------
module xorgate ( output s,
input p, q);
assign s = (~p & q)|(p & ~q);
endmodule // xorgate
// ---------------------
// -- test or gate
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
$display("Exercicio 06 - Yousef - 441714");
$display("Test XOR gate");
$display("\n(~a & b) | (a & ~b) = s\n");
$monitor("%b Y %b = %b", a, b, s);
#1a=0; b=0;
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;

end
endmodule // testxorgate