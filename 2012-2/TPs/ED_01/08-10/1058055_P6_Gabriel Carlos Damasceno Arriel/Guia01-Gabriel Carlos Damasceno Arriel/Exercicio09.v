// -------------------------
// Exemplo0003 - AND
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input p,
input q);
assign s = (p & q);
endmodule // andgate
module andgate1 ( output s1,
input r,
input o);
assign s1 = (r & o);
endmodule // andgate1
module andgate2 (output s2, input s, input s1);
assign s2 = (s1 & s);
endmodule // andgate2
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s, s1, s2; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b);
andgate1 AND2 (s1, c, d);
andgate2 AND3 (s2, s, s1);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0003 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Test AND gate");
$display("\n(a & b) & (c & d) = s\n");
a=0; b=0; c=0; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=0; c=0; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=0; c=1; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=0; c=1; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=1; c=0; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=1; c=0; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=1; c=1; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=0; b=1; c=1; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=0; c=0; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=0; c=0; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=0; c=1; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=0; c=1; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=1; c=0; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=1; c=0; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=1; c=1; d=0;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
a=1; b=1; c=1; d=1;
#1 $display("(%b & %b) & (%b & %b) = %b", a, b, c, d, s2);
end
endmodule // testandgate