// -------------------------
// Exemplo0015 - OR
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// -- OR gate
// -------------------------
module orgate ( output s,
input p,
input q);
assign s = p | q;
endmodule // orgate
// ---------------------
module orgate2 ( output u,
input a,
input b,
input c,
input d);
orgate OR1 (s, a, b);
orgate OR2 (t, c, d);

assign u = s | t;
endmodule // orgate
// ---------------------

// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire u, s, t; // definir conexao (fio)
// ------------------------- instancia
orgate2 OR3( u, a, b, c, d);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0015 - Ailton Gomes - 440092");
$display("Test OR gate");
$display("\n(a | b )|(c | d)= s\n");
#1 $monitor("(%b | %b )|(%b | %b) = %b", a, b, c, d, u);
#1 a=0; b=0; c=0; d=0;
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;
end
endmodule // testandgate