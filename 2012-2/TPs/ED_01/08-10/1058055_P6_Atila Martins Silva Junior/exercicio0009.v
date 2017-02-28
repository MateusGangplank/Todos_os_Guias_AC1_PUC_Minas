// Exercicio0009 - AND
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// -- and gate
module andgate1 ( output s1,
input p1,
input q1);
and(s1, p1, q1);
endmodule // andgate

module andgate2 ( output s,
input r,
input t,
input s1);
wire temp;
and(temp, r, t);
and(s, temp, s1);
endmodule // andgate

// -- test and gate
module testandgate;

// -- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)

// -- instancia
andgate1 AND1 (s1, a, b);
andgate2 AND2 (s, c, d, s1);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end

// --- parte principal
initial begin
$display("Exercicio0009 - Átila Martins - 449014");
$display("Test AND gate");
$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=1; c=1; d=1;
end
endmodule // testandgate