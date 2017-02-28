
// Exercicio0008 - AND
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// -- and gate
module andgate ( output s,
input p,
input q,
input r,
input t);
and(s, p, q, r, t);
endmodule // andgate

// -- test and gate
module testandgate;

// -- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)

// -- instancia
andgate AND1 (s, a, b, c, d);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end

// --- parte principal
initial begin
$display("Exercicio0008 - Átila Martins - 449014");
$display("Test AND gate");
$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=1; b=1; c=1; d=1;
end
endmodule // testandgate