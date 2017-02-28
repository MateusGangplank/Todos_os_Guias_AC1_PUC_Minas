// Exercicio0011
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// -- NOR gate
module norgate ( output s,
input[7:0] p);
assign s = ~(p[7] | p[6] | p[5] | p[4] | p[3] | p[2] | p[1] | p[0]);
endmodule // orgate

// -- test nor gate
module testnorgate;

// -- dados locais
reg[7:0] a; // definir registradores
wire s; // definir conexao (fio)

// -- instancia
norgate NOR1 (s, a);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=8'b00000000;
end

// --- parte principal
initial begin
$display("Exercicio0010 - Átila Martins - 449014");
$display("Test NOR gate");
$monitor("%b = %b", a, s);
#1 a=8'b10110110;
#1 a=8'b11111111;
end
endmodule // testorgate