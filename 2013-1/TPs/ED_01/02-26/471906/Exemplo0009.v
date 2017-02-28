// -------------------------
// Exemplo0009 - NAND
// Nome: Ana Paula da Silva
// Matricula: 471906
// -------------------------
// -------------------------
// -- nand gate
// -------------------------
module nandgate ( output s, input p, input q);
assign s = ~p | ~q; //nand por de morgan
endmodule // nandgate
// ---------------------
// -- test nand gate
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
$display("Exemplo0009 - Ana Paula- 471906");
$display("Test NAND gate");
$display("\na ~& b = s\n");
a=0; b=0;
#1 $display("%b ~& %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b ~& %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b ~& %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b ~& %b = %b", a, b, s);
end
endmodule // testnandgate