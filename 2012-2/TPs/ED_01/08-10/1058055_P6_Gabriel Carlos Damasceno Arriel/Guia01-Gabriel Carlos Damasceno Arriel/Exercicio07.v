// Exercicio06 - XNOR
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -- xnor gate
// -------------------------
module orgate ( output s,
input p, q);
assign s = ((p&q)+((~p)&(~q)));
endmodule // orgate
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
orgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio02 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Test XNOR gate");
$display("\n(ab +a'b') = s\n");
a=0; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);
end
endmodule // testorgate