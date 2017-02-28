// -------------------------
// Exercicio07 - XNOR
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// -- xnor gate
// -------------------------
module norgate ( output s,
input p, q);
//assign s = (p*q+p'*q');
assign s = (p&q+~p&~q);
endmodule // xnorgate
// ---------------------
// -- test or gate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
//orgate XNOR1 (s, a, b);
norgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo04 - Fábio Fiuza Pereira - 406087");
$display("Test XNOR gate");
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