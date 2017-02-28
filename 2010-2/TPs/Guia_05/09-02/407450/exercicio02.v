// ---------------------
// Exercicio 02 - Operador Diferenca completa (3 bits)
// Nome: Jéssica Daniela
// Matricula: 407450
// ---------------------
module meiadif(s0,s1,a,b);
input a,b;
output s0,s1;
wire q1;
xor XOR1(s0,a,b);
not NOT1(q1,a);
and AND1(s1,q1,b);
endmodule  // meiadif

module diferenca(s0,s1,a,b,c);
input a,b,c;
output s0,s1;
wire q1,q2,q3;
meiadif M1(q1,q2,a,b);
meiadif M2(s0,q3,q1,c);
or or1(s1,q2,q3);
endmodule  // diferenca

module diferenca3bits(s0,s1,s2,a0,b0,a1,b1);
input a0,a1,b0,b1;
output s0,s1,s2;
wire q1;
meiadif MD (s0,q1,a0,b0);
diferenca DF(s1,s2,q1,a1,b1);
endmodule //diferenca3bits

module testediferenca3bits;
reg a0,a1,b0,b1;
wire s0,s1,s2;
diferenca3bits DIF(s0,s1,s2,a0,b0,a1,b1);
initial begin: start
a0=0; a1=0; b0=0; b1=0;
end
initial begin: main
$display("Jessica Daniela - 407450");
$display("Exercicio 02 - Operador diferenca 3 bits");
$display("\n | a1 | a0 | - | b1 | b0 | = | s2 | s1 | s0 |\n");
$monitor("   | %b | %b | - | %b | %b | = | %b | %b | %b |",a1,a0,b1,b0,s2,s1,s0);
#1 a1 = 0; a1 = 0; b0 = 0; b1 = 1;

#1 a1 = 0; a0 = 0; b1 = 1; b0 = 0;
#1 a1 = 0; a0 = 0; b1 = 1; b0 = 1;

#1 a1 = 0; a0 = 1; b1 = 0; b0 = 0;
#1 a1 = 0; a0 = 1; b1 = 0; b0 = 1;

#1 a1 = 0; a0 = 1; b1 = 1; b0 = 0;
#1 a1 = 0; a0 = 1; b1 = 1; b0 = 1;

#1 a1 = 1; a0 = 0; b1 = 0; b0 = 0;
#1 a1 = 1; a0 = 0; b1 = 0; b0 = 1;

#1 a1 = 1; a0 = 0; b1 = 1; b0 = 0;
#1 a1 = 1; a0 = 0; b1 = 1; b0 = 1;

#1 a1 = 1; a0 = 1; b1 = 0; b0 = 0;
#1 a1 = 1; a0 = 1; b1 = 0; b0 = 1;

#1 a1 = 1; a0 = 1; b1 = 1; b0 = 0;
#1 a1 = 1; a0 = 1; b1 = 1; b0 = 1;

end
endmodule //testediferenca3bits