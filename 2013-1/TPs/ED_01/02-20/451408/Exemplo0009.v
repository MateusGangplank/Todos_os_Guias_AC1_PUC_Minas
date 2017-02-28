// -------------------------
// Exemplo0009 - NAND
// Nome: Lucas Porto Lopes
// Matricula 451408
// -------------------------
// -------------------------
// -- nand gate usando Morgan
// -------------------------
module nandgate (output s, input p,q);
assign s = (~(p | q));
endmodule // norgate
// ------------------------
// -- teste nand gate
// ------------------------
module testenandgate;
// ------------------------ dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------ instancia
nandgate NAND1 (s, a, b);
// ------------------------ preparacao
initial begin:start
// atribuicao simultanea dos valores iniciais
a=0; b=0;
end
// ------------------------ parte principal
initial begin
$display("Exemplo0009 - Lucas Porto Lopes - 451408");
$display("Test NAND gate usando Morgan");
$display("\na ~^ b = s\n");
a=0; b=0;
#1 $display("%b ~^ %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b ~^ %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b ~^ %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b ~^ %b = %b", a, b, s);
end
endmodule // testenandgate
