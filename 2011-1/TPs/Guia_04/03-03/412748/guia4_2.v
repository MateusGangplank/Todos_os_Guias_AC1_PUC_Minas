// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 04_2
// -- Nome: Jessica Luisa Betonico Andradde	Matricula: 412748

module HalfAdder (s0,s1,a,b);
input a,b;
output s0,s1;
xor XOR1 (s0,a,b);
and AND1 (s1,a,b);
endmodule //fim do circuito de meia-soma

module Adder (s0,s1,a,b,c);
input a,b,c;
output s0,s1;
wire q0,q1,q2;
HalfAdder A1 (q0,q1,a,b);
HalfAdder A2 (s0,q2,q0,c);
or OR1 (s1,q1,q2);
endmodule //fim da construcao do somador

module Teste_adder;

reg a,b,c;
wire s0,s1;
Adder A1 (s0,s1,a,b,c);
initial begin: start
 c=0;a=0;b=0;
end 

initial begin: main
$display ("Nome: Jessica Luisa Betonico Andradde	Matricula: 412748");
$display ("Soma Completa");
$display ("\n c | a | b | = | s1 | s0 |");
$monitor (" %b | %b | %b | = | %2b | %2b |",c,a,b,s1,s0);
#1 c=0;a=0;b=1;
#1 c=0;a=1;b=0;
#1 c=0;a=1;b=1;
#1 c=1;a=0;b=0;
#1 c=1;a=0;b=1;
#1 c=1;a=1;b=0;
#1 c=1;a=1;b=1;
end
endmodule

	
