// -------------------------
// Exemplo0003 - AND
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input p,
input q);
assign s = p & q;
endmodule // andgate
module andgate2 ( output s2,
input r,
input w);
assign s2 =  r & w;
endmodule // andgate
module andgate3 ( output s3,
input s,
input s2);
assign s3 = s & s2;
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s, s2, s3; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b);
andgate2 AND2 (s2, c, d);
andgate3 AND3 (s3, s, s2);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0003 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test AND gate");
$display("\na & b = s\n");
a=0; b=0; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=0; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=0; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=0; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=1; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=1; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=1; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=0; b=1; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=0; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=0; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=0; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=0; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=1; c=0; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=1; c=0; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=1; c=1; d=0;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);
a=1; b=1; c=1; d=1;
#1 $display("(%b & %b)&(%b & %b) = %b", a, b, c, d, s3);

end
endmodule // testandgate