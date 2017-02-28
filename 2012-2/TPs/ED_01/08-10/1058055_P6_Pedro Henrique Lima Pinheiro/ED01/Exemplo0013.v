// -------------------------
// Exemplo0003 - AND
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input p,
input q,
input r,
input w);
assign s = p & q & r & w;
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
$display("Exemplo0003 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test AND gate");
$display("\na & b = s\n");
a=0; b=0; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=0; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=0; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=0; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=1; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=1; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=1; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=0; b=1; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=0; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=0; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=0; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=0; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=1; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=1; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=1; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);
a=1; b=1; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s);

end
endmodule // testandgate