// -------------------------
// Exemplo0013 - AND
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input p,
input m,
input n,
input q);
assign s = ((p & q) & (n & m));
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0013 - Ailton Gomes - 440092");
$display("Test AND gate");
$display("\na & b = s\n");
a=0; b=0; c=0; d=0;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=0; c=0; d=0;
#1 $display("%b & %b = %b", a, b, s);
a=0; b=1; c=0; d=0;
#1 $display("%b & %b = %b", a, b, s);
a=0; b=0; c=1; d=0;
#1 $display("%b & %b = %b", a, b, s);
end
endmodule // testandgate