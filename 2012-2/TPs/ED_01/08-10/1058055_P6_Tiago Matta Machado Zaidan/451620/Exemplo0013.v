// -------------------------
// Exemplo0013 - and 4 entradas
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input a, b, c, d);
assign s = a & b & c & d;
endmodule // and
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND4 (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0013 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test AND");
$display("\n a & b & c & d = s\n");
#0 a=0; b=0; c=0; d=0;
//execução permanente
$monitor(" %b & %b & %b & %b = %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=1;
#2 a=0; b=0; c=1; d=0;
#3 a=0; b=0; c=1; d=1;
#4 a=0; b=1; c=0; d=0;
#5 a=0; b=1; c=0; d=1;
#6 a=0; b=1; c=1; d=0;
#7 a=0; b=1; c=1; d=1;
#8 a=1; b=0; c=0; d=0;
#9 a=1; b=0; c=0; d=1;
#10 a=1; b=0; c=1; d=0;
#11 a=1; b=0; c=1; d=1;
#12 a=1; b=1; c=0; d=0;
#13 a=1; b=1; c=0; d=1;
#14 a=1; b=1; c=1; d=0;
#15 a=1; b=1; c=1; d=1;
end
endmodule // testandgate