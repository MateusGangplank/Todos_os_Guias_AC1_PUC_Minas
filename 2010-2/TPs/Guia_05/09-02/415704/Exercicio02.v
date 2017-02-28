// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 05 - 30/08/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

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

module Subtractor_2bit (s2,s1,s0,a0,a1,b0,b1);
input a0,a1,b0,b1;
output s0,s1,s2;
wire q0;
HalfSub HS1 (s0,q0,a0,b0);
Subtractor S1 (s1,s2,a1,b1,q0);
endmodule

module Teste ;
reg a0,a1,b0,b1;
wire s0,s1,s2;
Subtractor_2bit S2b(s2,s1,s0,a0,a1,b0,b1);
initial begin : start
a0=0; a1=0; b0=0; b1=0; 
end

initial begin: main
$display ("Nome: Jonathan Felipe Xavier 	Matricula:415704");
$display ("Circuito somador de pares de tres bits");
$display ("\n a1 | a0 | b1 | b0 |  = | s2 | s1 | s0 |");
$monitor (" %b | %b | %b | %b | = | %2b | %2b | %2b |",a1,a0,b1,b0,s2,s1,s0);
#1 a0=1; a1=0; b0=0; b1=0; 
#1 a0=0; a1=0; b0=1; b1=0;
#1 a0=0; a1=1; b0=0; b1=1;
#1 a0=1; a1=1; b0=0; b1=0;
#1 a0=0; a1=0; b0=1; b1=1;
end
endmodule