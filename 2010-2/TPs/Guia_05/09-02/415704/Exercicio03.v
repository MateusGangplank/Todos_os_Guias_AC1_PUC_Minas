// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 05 - 30/08/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

module Half_adder (s1,s0,a,b);
input a,b;
output s0,s1;
xor XOR1 (s0,a,b);
and AND1 (s1,a,b);
endmodule //criacão do circuito meia soma

module Adder (s1,s0,a,b,c);
input a,b,c;
output s0,s1;
wire q0,q1,q3;
Half_adder HA1 (q1,q0,a,b);
Half_adder HA2 (q3,s0,c,q0);
or OR1 (s1,q1,q3);
endmodule

module multiplicador (s3,s2,s1,s0,a0,a1,b0,b1);
input a0,a1,b0,b1;
output s0,s1,s2,s3;
wire q0,q1,q2,q3;
and AND1(s0,a0,b0);
and AND2 (q0,a1,b0);
and AND3 (q1,b1,a0);
and AND4 (q2,b1,a1);
Adder AD1 (q3,s1,q0,q1,0);
Adder AD2 (s3,s2,q2,0,q3);
endmodule

module Teste ;
reg a0,a1,b0,b1;
wire s0,s1,s2,s3;
multiplicador M1 (s3,s2,s1,s0,a0,a1,b0,b1);
initial begin : start
a0=0; a1=0; b0=0; b1=0; 
end

initial begin: main
$display ("Nome: Jonathan Felipe Xavier 	Matricula:415704");
$display ("Circuito multiplicador de dois bits");
$display ("\n a1 | a0 | b1 | b0 | = | s3 | s2 | s1 | s0 |");
$monitor (" %b | %b | %b | %b | = | %2b | %2b | %2b | %2b |",a1,a0,b1,b0,s3,s2,s1,s0);
#1 a0=0; a1=0; b0=1; b1=0; 
#1 a0=0; a1=0; b0=0; b1=1;
#1 a0=0; a1=0; b0=1; b1=1;
#1 a0=1; a1=0; b0=0; b1=0; 
#1 a0=1; a1=0; b0=1; b1=0; 
#1 a0=1; a1=0; b0=0; b1=1;
#1 a0=1; a1=0; b0=1; b1=1;
#1 a0=0; a1=1; b0=0; b1=0; 
#1 a0=0; a1=1; b0=1; b1=0;
#1 a0=0; a1=1; b0=0; b1=1; 
#1 a0=0; a1=1; b0=1; b1=1;
#1 a0=1; a1=1; b0=0; b1=0; 
#1 a0=1; a1=1; b0=1; b1=0;
#1 a0=1; a1=1; b0=0; b1=1; 
#1 a0=1; a1=1; b0=1; b1=1;

end
endmodule