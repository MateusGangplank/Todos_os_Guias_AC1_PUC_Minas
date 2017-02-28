// -------------------------
// Exemplo0012 - XNOR
// Nome: HERBERT ALVES BATISTA
// Matricula: 461971
// -------------------------
// -------------------------
// -- xnor gate
// -------------------------
module xnorgate (output s,
input p,
input q);
assign s = p q+p’q’;
endmodule // xnor
// ---------------------
// -- test xnorgate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0012 - Herbert Alves - 461971");
$display("Test xnor gate");
$display("\n ab+a’b’ = s\n");
$monitor("%b%b + %b’%b’ = %b", a, b, a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testxnorgate