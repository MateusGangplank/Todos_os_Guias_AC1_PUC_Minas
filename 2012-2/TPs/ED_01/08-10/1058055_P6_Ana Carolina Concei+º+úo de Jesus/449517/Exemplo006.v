// -------------------------
// Exemplo0006 - NAND
// Nome: Ana Carolina Concei��o de Jesus
// Matricula: 449517
// -------------------------
// -------------------------
// -- nand gate
// -------------------------
module nandgate ( output s,
input a,
input b);
assign s = ~(a & b);
endmodule // nandgate
// ---------------------
// -- test nand gate
// ---------------------
module testandgate;
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
$display("Exemplo0006 - Ana Carolina  - 449517");
$display("Test NAND gate");
$display("\n ~(a & b) = s\n");
a=0; b=0;
#1 $display("~(%b & %b) = %b", a, b, s);
a=0; b=1;
#1 $display("~(%b & %b) = %b", a, b, s);
a=1; b=0;
#1 $display("~(%b & %b = %b)", a, b, s);
a=1; b=1;
#1 $display("~(%b & %b = %b)", a, b, s);
end
endmodule // testandgate