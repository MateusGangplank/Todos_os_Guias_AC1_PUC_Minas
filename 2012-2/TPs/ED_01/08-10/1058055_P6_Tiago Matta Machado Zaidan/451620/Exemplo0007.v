// -------------------------
// Exemplo0007 - nor
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module norgate ( output s,
input a, b);
assign s = (~(a | b));
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
$display("Exemplo0007 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test NOR gate");
$display("\na ~| b = s\n");
a=0; b=0;
//execução permanente
$monitor("%b ~| %b = %b", a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testnorgate