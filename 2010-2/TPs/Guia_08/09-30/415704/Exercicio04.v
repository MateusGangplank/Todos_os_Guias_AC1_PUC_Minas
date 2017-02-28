// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 08 - 30/09/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

module simplificada (s, a, b, c ,d);
input a,b,c,d;
output s;
wire q0,q1,q2,q3,q4,q5;

nand NAND1 (q0,a,a);
nand NAND2 (q1,b,b);
nand NAND3 (q2,d,d);
nand NAND4 (q3,q0,c);
nand NAND5 (q4,q1,c);
nand NAND6 (q5,a,b,q2);
nand NAND7 (s,q3,q4,q5);
endmodule

module Teste ;
reg a,b,c,d;
wire s;
simplificada test  (s,a,b,c,d);
initial begin : start
a=0; b=0; c=0; d=0; 
end

initial begin: main
$display ("Nome: Jonathan Felipe Xavier 	Matricula:415704");
$display ("Circuito simplificado com NAND");
$display ("\n a | b | c | d | = | s |");
$monitor (" %b | %b | %b | %b | = | %2b |",a,b,c,d,s);
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
endmodule