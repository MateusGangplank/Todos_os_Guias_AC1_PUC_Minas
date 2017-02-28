// -------------------------
// Exercicio02 - NOR
// Nome: Raphael Quintao
// Matricula: 445171
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module norgate ( output s, input p, q);
assign s = ~(p | q);
endmodule // orgate
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
$display("Exercicio02 - Raphael Quintao - 445171");
$display("Test NOR gate");
$display("\na & b = s\n");
$monitor("~(%b | %b) = %b", a, b, s);

#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testandgate