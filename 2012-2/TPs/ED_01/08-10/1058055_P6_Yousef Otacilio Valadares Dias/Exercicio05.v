// -------------------------
// Exercicio 05 - NOR Morgam
// Nome: Yousef
// Matricula: 441714
// -------------------------
// -------------------------
// -- Nor gate
// -------------------------
module norgate ( output s,
input p, q);
assign s = ~p & ~q;
endmodule // norgate
// ---------------------
// -- test or gate
// ---------------------
module testnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
norgate NOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio 02 - Yousef - 441714");
$display("Test NOR gate");
$display("\n~a & ~b = s\n");
$monitor("~%b & ~%b = %b", a, b, s);
#1a=0; b=0;
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;

end
endmodule // testorgate