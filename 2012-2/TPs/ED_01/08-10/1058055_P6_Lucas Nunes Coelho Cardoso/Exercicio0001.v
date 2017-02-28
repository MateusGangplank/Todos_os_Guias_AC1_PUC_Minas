// ---------------------
// Exercicio0001 - NAND
// Nome: Lucas Cardoso
// Matricula: 441694
// ---------------------
// ---------------------
// -- nand gate
// ---------------------
module nandgate ( output s,
input a,
input b);
assign s = ~(a&b);
endmodule //
// ---------------------
// -- test nandgate
// ---------------------
module testnandgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
nandgate NAND1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio0001 - Lucas Cardoso - 441694");
$display("Test NAND gate");
$display("\na & b = s\n");
a=0; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);
end
endmodule // testnandgate