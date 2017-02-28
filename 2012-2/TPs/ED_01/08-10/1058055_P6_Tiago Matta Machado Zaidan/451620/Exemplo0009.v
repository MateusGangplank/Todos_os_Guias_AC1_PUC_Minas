// -------------------------
// Exemplo0009 - nand de morgan
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- nand gate
// -------------------------
module nandgate ( output s,
input a, b);
assign s = (~a | ~b);
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
$display("Exemplo0009 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test NAND gate de morgan");
$display("\n~a | ~b = s\n");
a=0; b=0;
//execução permanente
$monitor("~%b | ~%b = %b", a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testnandgate