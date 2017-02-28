// -------------------------
// Exemplo0012 - xnor
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- xnor gate
// -------------------------
module xnorgate ( output s,
input a, b);
assign s = (a & b) | (~a & ~b);
endmodule // xorgate
// ---------------------
// -- test xor gate
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
$display("Exemplo0012 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test XNOR");
$display("\n a.b + a’.b’ = s\n");
a=0; b=0;
//execução permanente
$monitor(" %b . %b + %b’ . %b’ = %b", a, b, a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule // testxnorgate