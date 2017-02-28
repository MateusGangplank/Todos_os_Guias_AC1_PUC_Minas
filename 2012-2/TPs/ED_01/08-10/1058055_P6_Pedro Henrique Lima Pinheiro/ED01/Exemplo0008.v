// -------------------------
// Exemplo0006 - XNOR
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// 

module xnorgate ( output s,
input p,
input q);
assign s = ( ~(p^q) );
endmodule // xnorgate
// ---------------------
// -- 
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate xnor1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0003 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test XNOR gate");
$display("\n ~(a ^ b) = s\n");
a=0; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);
end
endmodule // testnorgate