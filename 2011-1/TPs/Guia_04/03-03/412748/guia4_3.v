// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 04_03
// -- Nome: Jessica Luisa Betonico Andradde	Matricula: 412748

module HalfSub (s0,s1,a,b);
input a,b;
output s0,s1;
wire q0;
xor XOR1 (s0,a,b);
not NOT1 (q0,a);
and AND1 (s1,q0,b);
endmodule //fim da construcao do circuito de meia-diferença

module Subtractor (s0,s1,a,b,c);
input a,b,c;
output s0,s1;
wire q0,q1,q2;
HalfSub D1 (q0,q1,a,b);
HalfSub D2 (s0,q2,q0,c);
or OR1 (s1,q1,q2);
endmodule

module TesteSub;
reg a,b,c;
wire s0,s1;
Subtractor D (s0,s1,a,b,c);
initial begin: start
a=0; b=0; c=0;
end

initial begin: main
$display ("Nome: Jessica Luisa Betonico Andradde	Matricula: 412748");
$display ("Circuito Diferença completa ");
$display ("\n a | b | vem um | = | s1 | s0 |");
$monitor (" %b | %b | %6b    | = | %2b | %2b |",a,b,c,s1,s0);
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end
endmodule