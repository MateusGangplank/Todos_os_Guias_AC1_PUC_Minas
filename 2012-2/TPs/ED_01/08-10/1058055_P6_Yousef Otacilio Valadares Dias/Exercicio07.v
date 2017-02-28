// -------------------------
// Exercicio 07 - XNOR Morgam
// Nome: Yousef
// Matricula: 441714
// -------------------------
// -------------------------
// -- Nor gate
// -------------------------
module xnorgate ( output s,
input p, q);
assign s = (~p & q)|(p & ~q);
endmodule // xnorgate
// ---------------------
// -- test or gate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate NXOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio 10 - Yousef - 441714");
$display("Test NXOR gate");
$display("\n(~a & b) | (a & ~b) = s\n");
$monitor("%b Y %b = %b", a, b, s);
#1a=0; b=0;
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;

end
endmodule // testxorgate