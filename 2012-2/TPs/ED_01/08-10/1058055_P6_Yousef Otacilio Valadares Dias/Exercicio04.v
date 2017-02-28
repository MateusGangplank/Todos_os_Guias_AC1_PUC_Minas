// -------------------------
// Exercicio 04 - NAND Morgan
// Nome: Yousef
// Matricula: 441714
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module nandgate ( output s, input p, input q);
assign s = ~p | ~q;
endmodule // nandgate
// ---------------------
// -- test and gate
// ---------------------
module testnandgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
nandgate NAND1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Yousef - 441714");
$display("Test NAND gate (Morgan)");
$display("\na & b = s\n");
$monitor("~%b | ~%b = %b", a, b, s);
#1a=0; b=0;
#1a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end
endmodule // testandgate