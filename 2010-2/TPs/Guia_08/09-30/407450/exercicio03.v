// ---------------------
// Exercicio 03 - Circuito 03
// Nome: Jéssica Daniela
// Matricula: 407450
// ---------------------

module exercicio03 (s,a,b,c,d,e);
input a,b,c,d,e;
output s;
wire q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14;
not NOT1 (q1,a);
not NOT2 (q2,b);
not NOT3 (q3,c);
not NOT4 (q4,d);
not NOT5 (q5,e);
and AND1 (q6,b,c,e);
and AND2 (q7,b,c,d);
and AND3 (q8,c,d,e);
and AND4 (q9,q1,q2,q4);
and AND5 (q10,q1,b,q3,q4);
and AND6 (q11,a,q2,c,q4);
and AND7 (q12,a,b,d,e);
and AND8 (q13,a,q2,q3,q4,e);
and AND8 (q14,a,q2,q3,d,q5);
or OR1 (s,q6,q7,q8,q9,q10,q11,q12,q13,q14);
endmodule //exercicio03

module testeexercicio03;
reg a,b,c,d,e;
wire s;
exercicio03 EX3 (s,a,b,c,d,e);
initial begin: start
a=0; b=0; c=0; d=0; e=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 03");
$display("\n | a | b | c | d | e  = | s |\n");
$monitor(" | %b | %b | %b | %b | %b | = | %b |",a,b,c,d,e,s);
#1 a=0; b=0; c=0; d=0; e=1;
#1 a=0; b=0; c=0; d=1; e=0;
#1 a=0; b=0; c=0; d=1; e=1;
#1 a=0; b=0; c=1; d=0; e=0;
#1 a=0; b=0; c=1; d=0; e=1;
#1 a=0; b=0; c=1; d=1; e=0;
#1 a=0; b=0; c=1; d=1; e=1;
#1 a=0; b=1; c=0; d=0; e=0;
#1 a=0; b=1; c=0; d=0; e=1;
#1 a=0; b=1; c=0; d=1; e=0;
#1 a=0; b=1; c=0; d=1; e=1;
#1 a=0; b=1; c=1; d=0; e=0;
#1 a=0; b=1; c=1; d=0; e=1;
#1 a=0; b=1; c=1; d=1; e=0;
#1 a=0; b=1; c=1; d=1; e=1;
#1 a=1; b=0; c=0; d=0; e=0;
#1 a=1; b=0; c=0; d=0; e=1;
#1 a=1; b=0; c=0; d=1; e=0;
#1 a=1; b=0; c=0; d=1; e=1;
#1 a=1; b=0; c=1; d=0; e=0;
#1 a=1; b=0; c=1; d=0; e=1;
#1 a=1; b=0; c=1; d=1; e=0;
#1 a=1; b=0; c=1; d=1; e=1;
#1 a=1; b=1; c=0; d=0; e=0;
#1 a=1; b=1; c=0; d=0; e=1;
#1 a=1; b=1; c=0; d=1; e=0;
#1 a=1; b=1; c=0; d=1; e=1;
#1 a=1; b=1; c=1; d=0; e=0;
#1 a=1; b=1; c=1; d=0; e=1;
#1 a=1; b=1; c=1; d=1; e=0;
#1 a=1; b=1; c=1; d=1; e=1;

end
endmodule //testeexercicio03