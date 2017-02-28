// -------------------------
// Exercicio0003 - XNOR
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001
// -------------------------

// -------------------------
// -- xnor gate
// -------------------------
module xnorgate ( output s,
input a,
input b);
assign s = (~(a^b));
endmodule // xnorgate
// ---------------------
// -- test xnor gate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio0003 - Flavio Andrade Amaral Motta - 392001");
$display("Test XNOR gate");
$display("\na ~| b = s\n");
a=0; b=0;
$monitor("%d %b = %b",a, b, s);
#1 b=1;
#2 b=0;
#2 a=1;
#3 b=1;
end
endmodule // testxnorgate