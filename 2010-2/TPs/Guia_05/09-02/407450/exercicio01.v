// ---------------------
// Exercicio 01 - Operador Soma completa (3 bits)
// Nome: Jéssica Daniela
// Matricula: 407450
// ---------------------
module meiasoma (s0,s1,a,b);
input a,b;
output s0,s1;
xor XOR1(s0,a,b);
and AND1(s1,a,b);
endmodule  // meiasoma

module somacompleta (s0,s1,a,b,c);
input a,b,c;
output s0,s1;
wire q1,q2,q3;
meiasoma M1(q1,q2,a,b);
meiasoma M2(s0,q3,q1,c);
or OR1 (s1,q2,q3);
endmodule  // somacompleta

module soma3bits (s0,s1,s2,s3,a0,b0,a1,b1,a2,b2);
input a0,a1,a2,b0,b1,b2;
output s0,s1,s2,s3;
wire q1,q2;
meiasoma MS(s0,q1,a0,b0);
somacompleta SC1(s1,q2,q1,a1,b1);
somacompleta SC2(s2,s3,q2,a2,b2);
endmodule   //soma3bits

module testesoma3bits;
reg a0,a1,a2,b0,b1,b2;
wire s0,s1,s2,s3; 
soma3bits SOMA(s0,s1,s2,s3,a0,b0,a1,b1,a2,b2);
initial begin: start
a2=0; a1=0; a0=0; b2=0; b1=0; b0=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 01 - Operador soma 3 bits");
$display("\n | a2 | a1 | a0 | + | b2 | b1 | b0 | = | s3 | s2 | s1 | s0 |\n");
$monitor("   | %b | %b | %b | + | %b | %b | %b | = | %b | %b | %b | %b |",a2,a1,a0,b2,b1,b0,s3,s2,s1,s0);
#1 a2=0; a1=0; a0=0; b2=0; b1=0; b0=1;

#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=0;
#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=1;

#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=0;
#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=1;

#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=0;
#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=1;

#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=0;
#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=1;

#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=0;
#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=1;

#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=0;
#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=1;

#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=0;
#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=1;

#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=0;
#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=1;

#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=0;
#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=1;

#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=0;
#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=1;

#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=0;
#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=1;

#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=0;
#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=1;

#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=0;
#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=1;

#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=0;
#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=1;

#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=0;
#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=1;

#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=0;
#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=1;

#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=0;
#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=1;

#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=0;
#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=1;

#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=0;
#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=1;

#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=0;
#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=1;

#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=0;
#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=1;

#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=0;
#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=1;

#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=0;
#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=1;

#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=0;
#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=1;

#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=0;
#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=1;

#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=0;
#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=1;

#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=0;
#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=1;

#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=0;
#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=1;

#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=0;
#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=1;

#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=0;
#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=1;

#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=0;
#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=1;
end
endmodule //testesoma3bits

