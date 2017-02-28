// -------------------------
// Exemplo0015 - OR
// Nome: Lucas Porto Lopes
// Matricula: 451408
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate ( output s, input p, input q);
assign s = p | q;
endmodule // orgate
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire s, f; // definir conexao (fio)
// ------------------------- instancia
orgate OR1 (s, a, b);
orgate OR2 (f, s, c);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0014 - Lucas Porto Lopes - 451408");
$display("Test OR gate");
$monitor("\na | b | c = s\n");
c=0; a=0; b=0;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=0; a=0; b=1;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=0; a=1; b=0;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=0; a=1; b=1;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=1; a=0; b=0;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=1; a=0; b=1;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=1; a=1; b=0;
#1 $display("%b | %b | %b = %b", c, b, a, f);
c=1; a=1; b=1;
#1 $display("%b | %b | %b = %b", c, b, a, f);

end
endmodule // testandgate