// -------------------------
// Exemplo0011 - XOR
// Nome: Lucas Porto Lopes
// Matricula 451408
// -------------------------
// -------------------------
// -- xor gate
// -------------------------
module xorgate (output s, input p,q);
assign s = ((~(p) & (q)) | (~(q) & (p)));
endmodule // xorgate
// ------------------------
// -- teste xor gate
// ------------------------
module testexorgate;
// ------------------------ dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------ instancia
xorgate XOR1 (s, a, b);
// ------------------------ preparacao
initial begin:start
// atribuicao simultanea dos valores iniciais
a=0; b=0;
end
// ------------------------ parte principal
initial begin
$display("Exemplo0009 - Lucas Porto Lopes - 451408");
$display("Test XOR gate");
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
endmodule // testexorgate
