// -------------------------
// Exemplo0003 - OR
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate ( output s,
input p,
input q);
assign s = p | q;
endmodule // orgate
module orgate2 ( output s2,
input r,
input w);
assign s2 =  r | w;
endmodule // orgate
module orgate3 ( output s3,
input s,
input s2);
assign s3 = s | s2;
endmodule // orgate
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s, s2, s3; // definir conexao (fio)
// ------------------------- instancia
orgate OR1 (s, a, b);
orgate2 OR2 (s2, c, d);
orgate3 OR3 (s3, s, s2);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0003 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test OR gate");
$display("\na | b = s\n");
a=0; b=0; c=0; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=0; c=0; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=0; c=1; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=0; c=1; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=1; c=0; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=1; c=0; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=1; c=1; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=0; b=1; c=1; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=0; c=0; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=0; c=0; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=0; c=1; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=0; c=1; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=1; c=0; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=1; c=0; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=1; c=1; d=0;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);
a=1; b=1; c=1; d=1;
#1 $display("(%b | %b)|(%b | %b) = %b", a, b, c, d, s3);

end
endmodule // testorgate