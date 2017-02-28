// -------------------------
// Exercicio0005 - NOR
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001
// -------------------------

// -------------------------
// -- nor gate
// -------------------------
module norgate ( output s,
input a,
input b);
assign s = ((~a)&(~b));
endmodule // norgate
// ---------------------
// -- test nor gate
// ---------------------
module testnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
norgate NOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio0005 - Flavio Andrade Amaral Motta - 392001");
$display("Test NOR gate");
$display("\na ~| b = s\n");
a=0; b=0;
$monitor("%d %b = %b",a, b, s);
#1 b=1;
#2 b=0;
#2 a=1;
#3 b=1;
end
endmodule // testnorgate