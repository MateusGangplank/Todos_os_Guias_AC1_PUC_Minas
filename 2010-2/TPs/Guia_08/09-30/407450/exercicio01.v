
// ---------------------
// Exercicio 01 - Circuito 01
// Nome: Jéssica Daniela
// Matricula: 407450
// ---------------------


module exercicio01 (s,a,b,c,d);
input a,b,c,d;
output s;
wire q1,q2,q3,q4,q5,q6;
not NOT1 (q1,a);
not NOT2 (q2,b);
not NOT3 (q3,d);
and AND1 (q4,q1,c);
and AND2 (q5,q2,c);
and AND3 (q6,a,b,q3);
or OR1 (s,q4,q5,q6);
endmodule //exercicio01

module testeexercicio01;
reg a,b,c,d;
wire s;
exercicio01 EX1 (s,a,b,c,d);
initial begin: start
a=0; b=0; c=0; d=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 01");
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
endmodule //testeexercicio01