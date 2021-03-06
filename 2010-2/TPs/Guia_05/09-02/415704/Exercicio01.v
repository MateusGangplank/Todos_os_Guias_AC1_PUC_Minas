// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 05 - 30/08/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

module Half_adder (s1,s0,a,b);
input a,b;
output s0,s1;
xor XOR1 (s0,a,b);
and AND1 (s1,a,b);
endmodule //criac�o do circuito meia soma

module Adder (s1,s0,a,b,c);
input a,b,c;
output s0,s1;
wire q0,q1,q3;
Half_adder HA1 (q1,q0,a,b);
Half_adder HA2 (q3,s0,c,q0);
or OR1 (s1,q1,q3);
endmodule

module Adder_3bit (s3,s2,s1,s0,a0,a1,a2,b0,b1,b2);
output s3,s2,s1,s0;
input a0,a1,a2,b0,b1,b2;
wire q0,q1;
Half_adder HA3(q0,s0,a0,b0);
Adder A1 (q1,s1,a1,b1,q0);
Adder A2 (s3,s2,a2,b2,q1);
endmodule

module Teste ;
reg a0,a1,a2,b0,b1,b2;
wire s0,s1,s2,s3;
Adder_3bit A31(s3,s2,s1,s0,a0,a1,a2,b0,b1,b2);
initial begin : start
a0=0; a1=0; a2=0; b0=0; b1=0; b2=0;
end

initial begin: main
$display ("Nome: Jonathan Felipe Xavier 	Matricula:415704");
$display ("Circuito somador de pares de tres bits");
$display ("\n a0 | a1 | a2 | b0 | b1 | b2 | = | s3 | s2 | s1 | s0 |");
$monitor (" %b | %b | %b | %b | %b | %b | = | %2b | %2b | %2b | %2b |",a0,a1,a2,b0,b1,b2,s3,s2,s1,s0);
#1 a0=0; a1=1; a2=0; b0=0; b1=1; b2=0;
#1 a0=1; a1=1; a2=1; b0=1; b1=0; b2=0;
end
endmodule
