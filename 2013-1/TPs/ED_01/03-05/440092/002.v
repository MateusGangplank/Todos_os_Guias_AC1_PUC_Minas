// -------------------------
// Exercico 002 - NOR
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module norgate ( output s,
input p, q);
assign s = ~(p | q);
endmodule // orgate
// ---------------------
// -- test nor gate
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
a=1; b=1;
end
// ------------------------- parte principal
initial begin
$display("Exercico 002 - Ailton Gomes - 440092");
$display("Test NOR gate");
$display("\n~(a | b) = s\n");
a=0; b=0;
#1 $display("~(%b | %b) = %b", a, b, s);
a=0; b=1;
#2 $display("~(%b | %b) = %b", a, b, s);
a=1; b=0;
#3 $display("~(%b | %b) = %b", a, b, s);
a=1; b=1;
#4 $display("~(%b | %b) = %b", a, b, s);
end
endmodule // testorgate