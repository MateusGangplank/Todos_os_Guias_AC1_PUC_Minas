// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 08 - 30/09/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

module simplificada (s, a, b, c ,d);
input a,b,c,d;
output s;
wire q0,q1,q2,q3,q4,q5;
not NOT1 (q0,a); //A'
not NOT2 (q1,b); //B'
not NOT3 (q2,c); //C'
not NOT3 (q3,d); //D'
and AND1 (q4,q0,q1,q3);
and AND2 (q5,a,q1,q2);
and AND3 (q6,a,q3,d);
and AND4 (q7,a,q2,d);
and AND5 (q8,q0,q2,q3);
or OR1   (s,q4,q5,q6,q7,q8);

endmodule //fim do modulo simplificada

module Teste ;
reg a,b,c,d;
wire s;
simplificada test  (s,a,b,c,d);
initial begin : start
a=0; b=0; c=0; d=0; 
end

initial begin: main
$display ("Nome: Jonathan Felipe Xavier 	Matricula:415704");
$display ("Circuito simplificado");
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
