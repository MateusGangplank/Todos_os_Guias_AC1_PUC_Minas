
// ---------------------
// Exercicio 02 - Circuito 02
// Nome: J�ssica Daniela
// Matricula: 407450
// ---------------------

module exercicio02 (s,a,b,c,d);
input a,b,c,d;
output s;
wire q1,q2,q3,q4,q5,q6,q7,q8,q9;
not NOT1 (q1,a);
not NOT2 (q2,b);
not NOT3 (q3,c);
not NOT4 (q4,d);
and AND1 (q5,q1,q2,q4);
and AND2 (q6,a,q2,q3);
and AND3 (q7,a,q3,d);
and AND4 (q8,q1,q3,q4);
and AND5 (q9,a,q2,d);
or OR1 (s,q5,q6,q7,q8,q9);
endmodule //exercicio02

module testeexercicio02;
reg a,b,c,d;
wire s;
exercicio02 EX2 (s,a,b,c,d);
initial begin: start
a=0; b=0; c=0; d=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 02");
$display("\n | a | b | c | d | = | s |\n");
$monitor(" | %b | %b | %b | %b | = | %b |",a,b,c,d,s);
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
endmodule //testeexercicio02