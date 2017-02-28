// -------------------------
// Exemplo0015 - or 4 entradas
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate1 ( output s,
input a, b);
assign s = a | b;
endmodule // or
module orgate2 ( output t,
input c, d);
assign t = c | d;
endmodule // or2
module orgate3 ( output e,
input s, t);
assign e = s | t;
endmodule // or3
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s,t,e; // definir conexao (fio)
// ------------------------- instancia
orgate1 OR1 (s, a, b);
orgate2 OR2 (t, c, d);
orgate3 OR3 (e, s, t);
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
$display("\n a | b = s,     c | d = t,         s | t = e \n ");
#0 a=0; b=0; c=0; d=0;
//execução permanente
$monitor(" %b | %b = %b,    %b | %b = %b,      %b | %b = %b ", a, b, s, c, d, t, s, t, e);
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