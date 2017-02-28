// -------------------------
// Exercicio0008 - AND
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input a,
input b,
input c);
assign s = a&b&c;
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b, c);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio0008 - Flavio Andrade Amaral Motta - 392001");
$display("Test AND gate");
$display("\na & b & c = s\n");
a=0; b=0;
$monitor("%b %b %b = %b",a, b, c, s);
#1 c=1;
#2 c=0;
#2 b=1;
#3 c=1;
#4 a=1;
#4 b=0;
#4 c=0;
#4 b=1;
#4 c=1;
end
endmodule // testandgate