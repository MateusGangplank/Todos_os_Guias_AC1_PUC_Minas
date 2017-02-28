// -------------------------
// Exemplo0013 - AND
// Nome: Lucas Porto Lopes
// Matricula: 451408
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s, input p, input q, input t);
assign s = (p & q) & t;
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b, c);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0013 - Lucas Porto Lopes - 451408");
$display("Test AND gate");
$monitor("\na & b & c = s\n");
c=0; a=0; b=0;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=0; a=0; b=1;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=0; a=1; b=0;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=0; a=1; b=1;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=1; a=0; b=0;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=1; a=0; b=1;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=1; a=1; b=0;
#1 $display("%b & %b & %b = %b", c, b, a, s);
c=1; a=1; b=1;
#1 $display("%b & %b & %b = %b", c, b, a, s);

end
endmodule // testandgate
