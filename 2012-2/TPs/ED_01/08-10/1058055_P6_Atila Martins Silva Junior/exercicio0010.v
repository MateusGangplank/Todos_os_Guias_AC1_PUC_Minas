// Exercicio0010 - OR
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// -- and gate
module orgate1 ( output s1,
input p1,
input q1);
or(s1, p1, q1);
endmodule // orgate

module orgate2 ( output s,
input r,
input t,
input s1);
wire temp;
or(temp, r, t);
or(s, temp, s1);
endmodule // andgate

// -- test or gate
module testorgate;

// -- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)

// -- instancia
orgate1 OR1 (s1, a, b);
orgate2 OR2 (s, c, d, s1);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end

// --- parte principal
initial begin
$display("Exercicio0010 - Átila Martins - 449014");
$display("Test OR gate");
$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=1; c=1; d=1;
end
endmodule // testorgate