// -------------------------
// Exemplo0015 - OR (com 4 entradas)
// Nome: Ana Carolina Concei��o de Jesus
// Matricula: 449517
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate ( output s,
input p, q);
assign s = p | q;
endmodule // orgate
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s, s1, s2; // definir conexao (fio)
// ------------------------- instancia
orgate OR1 (s, a, b);        // DEFINIR EM OUTRO MODULO
orgate OR2(s1, c,d);
orgate OR3 (s2, s, s1);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
 //--------- parte principal
initial begin
$display ("Exemplo0015 - Ana Carolina - 449517 ");
$display ("Test AND gate com 4 entradas");
$display ("\n a | b =  s \n");
$monitor(" ((%b | %b) | (%b | %b)) = %b", a,b,c,d, s2);

#1 a = 0; b = 0; c = 0; d = 0;

#1 a = 0; b = 0; c = 0; d = 1;

#1 a = 0; b = 0; c = 1; d = 0;

#1 a = 0; b = 0; c = 1; d = 1;

#1 a = 0; b = 1; c = 0; d = 0;

#1 a = 0; b = 1; c = 0; d = 1;

#1 a = 0; b = 1; c = 1; d = 0;

#1 a = 0; b = 1; c = 1; d = 1;

#1 a = 1; b = 0; c = 0; d = 0;

#1 a = 1; b = 0; c = 0; d = 1;

#1 a = 1; b = 0; c = 1; d = 0;

#1 a = 1; b = 0; c = 1; d = 1;

#1 a = 1; b = 1; c = 0; d = 0;

#1 a = 1; b = 1; c = 0; d = 1;

#1 a = 1; b = 1; c = 1; d = 0;

#1 a = 1; b = 1; c = 1; d = 1;

end
endmodule // test orgate

