
// ---------------------
// Exercicio 04 - Circuito 04
// Nome: Jéssica Daniela
// Matricula: 407450
// ---------------------

module exercicio04 (s,a,b,c,d);
input a,b,c,d;
output s;
wire q1,q2,q3,q4,q5,q6;
nand NAND5 (q1,a,a);
nand NAND6 (q2,b,b);
nand NAND7 (q3,d,d);
nand NAND1 (q4,q1,c);
nand NAND2 (q5,q2,c);
nand NAND3 (q6,a,b,q3);
nand NAND4 (s,q4,q5,q6);
endmodule //exercicio04

module testeexercicio03;
reg a,b,c,d;
wire s;
exercicio03 EX3 (s,a,b,c,d);
initial begin: start
a=0; b=0; c=0; d=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 03");
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
endmodule //testeexercicio03
