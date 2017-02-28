
// Exercicio0001 - NAND
// Nome: �tila Martins Silva J�nior
// Matricula: 449014

// -- nand gate
module nandgate ( output s,
input p,
input q);
assign s = ~(p & q);
endmodule // nandgate

// -- test nand gate
module testnandgate;

// -- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)

// -- instancia
nandgate NAND1 (s, a, b);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end

// -- parte principal
initial begin
$display("Exercicio0001 - �tila Martins - 449014");
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