// Exercicio0006 - XOR
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// -- xor gate
module xorgate ( output s,
input p,
input q);
wire temp1, temp2;
and(temp1, ~p, q);
and(temp2, p, ~q);
or(s, temp1, temp2);
endmodule // xorgate

// -- test xor gate
module testxorgate;

// -- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)

// --- instancia
xorgate XOR1 (s, a, b);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end

// -- parte principal
initial begin
$display("Exercicio0002 - Átila Martins - 449014");
$display("Test XOR gate");
$display("\na | b = s\n");
a=0; b=0;
#1 $display("%b | %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b | %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b | %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b | %b = %b", a, b, s);
end
endmodule // testxorgate