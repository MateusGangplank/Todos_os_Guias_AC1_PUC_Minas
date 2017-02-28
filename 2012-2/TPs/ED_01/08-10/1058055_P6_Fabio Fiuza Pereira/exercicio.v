// -------------------------
// Exemplo04 - NOR
// Nome: F�bio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module orgate ( output s,
input p, q);
assign s = ~p & ~q;
endmodule // norgate
// ---------------------
// -- test nor gate
// ---------------------
module testnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
orgate NOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo04 - F�bio Fiuza Pereira - 406087");
$display("Test OR gate");
$display("\na & b = s\n");
a=0; b=0;
#1 $display("%b & %b, = %b", a, b, s);
a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);
end
endmodule // testnorgate