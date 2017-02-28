// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 08 - 30/09/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

module simplificado (s,a,b,c,d,e);
input a,b,c,d,e;
output s;
wire q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15;
not NOT1 (q0,a); //A'
not NOT2 (q1,b); //B'
not NOT3 (q2,c); //C'
not NOT3 (q3,d); //D'
not NOT4 (q4,e); //E'
and AND1 (q5,b,c,e);
and AND2 (q6,b,c,d);
and AND3 (q7,c,d,e);
and AND4 (q8,q0,q1,q3);
and AND5 (q9,q0,b,q2,q3);
and AND6 (q10,a,q1,c,q3);
and AND7 (q11,a,b,d,e);
and AND8 (q12,a,q1,q2,q3,e);
and AND9 (q13,a,q1,q2,d,q4);
or  OR1  (q14,q5,q6,q7,q8);
or  OR2  (q15,q9,q10,q11,q12,q13);
or  OR3  (s,q14,q15);
endmodule

module Teste ;
reg a,b,c,d,e;
wire s;
simplificado test  (s,a,b,c,d,e);
initial begin : start
a=0; b=0; c=0; d=0; e=0; 
end

initial begin: main
$display ("Nome: Jonathan Felipe Xavier 	Matricula:415704");
$display ("Circuito simplificado");
$display ("\n a | b | c | d | | e | = | s |");
$monitor (" %b | %b | %b | %b | %b | = | %2b |",a,b,c,d,e,s);

#1 	a=0; b=0; c=0; d=0; e=1; 
#1 	a=0; b=0; c=0; d=1; e=0;
#1 	a=0; b=0; c=0; d=1; e=1;
#1 	a=0; b=0; c=1; d=0; e=0; 
#1 	a=0; b=0; c=1; d=0; e=1; 
#1 	a=0; b=0; c=1; d=1; e=0;
#1 	a=0; b=0; c=1; d=1; e=1;
#1 	a=0; b=1; c=0; d=0; e=0; 
#1 	a=0; b=1; c=0; d=0; e=1;
#1 	a=0; b=1; c=0; d=1; e=0; 
#1 	a=0; b=1; c=0; d=1; e=1;
#1 	a=0; b=1; c=1; d=0; e=0; 
#1 	a=0; b=1; c=1; d=0; e=1;
#1 	a=0; b=1; c=1; d=1; e=0;
#1 	a=0; b=1; c=1; d=1; e=1;
#1 	a=1; b=0; c=0; d=0; e=0;
#1 	a=1; b=0; c=0; d=0; e=1; 
#1 	a=1; b=0; c=0; d=1; e=0;
#1 	a=1; b=0; c=0; d=1; e=1;
#1 	a=1; b=0; c=1; d=0; e=0; 
#1 	a=1; b=0; c=1; d=0; e=1; 
#1 	a=1; b=0; c=1; d=1; e=0;
#1 	a=1; b=0; c=1; d=1; e=1;
#1 	a=1; b=1; c=0; d=0; e=0; 
#1 	a=1; b=1; c=0; d=0; e=1;
#1 	a=1; b=1; c=0; d=1; e=0; 
#1 	a=1; b=1; c=0; d=1; e=1;
#1 	a=1; b=1; c=1; d=0; e=0; 
#1 	a=1; b=1; c=1; d=0; e=1;
#1 	a=1; b=1; c=1; d=1; e=0;
#1 	a=1; b=1; c=1; d=1; e=1;
end
endmodule