// -------------------------
// Exemplo0014 - and 4 entradas
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate1 ( output s,
input a, b);
assign s = a & b;
endmodule // and
module andgate2 ( output t,
input c, d);
assign t = c & d;
endmodule // and2
module andgate3 ( output e,
input s, t);
assign e = s & t;
endmodule // and3
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s,t,e; // definir conexao (fio)
// ------------------------- instancia
andgate1 AND1 (s, a, b);
andgate2 AND2 (t, c, d);
andgate3 AND3 (e, s, t);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
#0 a=0; b=0; c=0; d=0;
$display("Exemplo0014 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test AND");
$display("\n a & b = s,     c & d = t,         s & t = e \n ");
#0 a=0; b=0; c=0; d=0;
//execução permanente
$monitor(" %b & %b = %b,    %b & %b = %b,      %b & %b = %b ", a, b, s, c, d, t, s, t, e);
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