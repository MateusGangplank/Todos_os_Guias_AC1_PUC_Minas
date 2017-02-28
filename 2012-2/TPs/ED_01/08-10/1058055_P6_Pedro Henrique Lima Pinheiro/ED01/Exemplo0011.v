// -------------------------
// Exemplo0006 - XOR
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// 

module xorgate ( output s,
input p,
input q);
assign s = ( (~p&q)|(p&~q) );
endmodule // xorgate
// ---------------------
// -- 
// ---------------------
module testxorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
xorgate xor1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0003 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test XOR gate");
$display("\n ( (~p&q)|(p&~q) ) = s\n");
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