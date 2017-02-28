// -------------------------
// Exemplo0004 - NOR
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module orgate ( output s,
input a, b);
assign s = ~(a | b);
endmodule //norgate
// ---------------------
// -- test nor gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
orgate OR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0007 - Ana Carolina - 449517");
$display("Test NOR gate");
$display("\n~(a | b) = s\n");
$monitor("%b ^ %b = %b", a, b, s);
#1 a=0; b=0;

#1 a=0; b=1;

#1 a=1; b=0;

#1 a=1; b=1;
end
endmodule // testorgate