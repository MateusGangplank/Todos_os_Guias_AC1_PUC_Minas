// ---------------------
// Exercicio10 - or (4 entradas)
// Nome: Raphael Quintao
// Matricula: 445171
// ---------------------
// ---------------------
// -- or gate
// ---------------------
module orgate (output s, input a, b);
assign s = a | b;
endmodule // and

module ornovo (output s, input a, b, c, d);
wire resp, resp2;
orgate and1 (resp, a, b);
orgate and2 (resp2, c, d);
orgate and3 (s, resp, resp2);
endmodule // and
// ---------------------
// -- test orgate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a,b,c,d; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
ornovo orx (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
c=0;
d=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio08 - Raphael Quintao - 445171");
$display("Test or gate(4 entradas)");
$display("\na x b = s\n");
$monitor("%b x %b x %b x %b = %b", a, b, c, d, s);

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