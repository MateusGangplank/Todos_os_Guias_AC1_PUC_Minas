// ------------------------------
// Guia 06 - ALU
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// ------------------------------

//-------------
//-- Meia Soma
//-------------

module meiaSoma(s0, s1, a, b);

output s0, s1;
input a, b;

xor XOR1(s0, a, b);
and AND1(s1, a, b);

endmodule //--fim module meiaSoma

//-----------------
//-- Soma Completa
//-----------------

module somaCompleta(s0, s1, a, b, c);

output s0, s1;
input a, b, c;

wire s2, s3, s4;

meiaSoma MS1 (s2, s3, a, b);
meiaSoma MS2 (s0, s4, s2, c);
or OR1 (s1, s3, s4);

endmodule //--fim module somaCompleta

// ----------------------
// -- Somador de 4 bits
// ----------------------

module somador4bits(s0, s1, s2, s3, carry, comparador, a0, a1, a2, a3, b0 ,b1, b2, b3);

output s0, s1, s2, s3, carry, comparador;
input a0, a1, a2, a3, b0 ,b1, b2, b3;

wire w1, w2, w3;

somaCompleta SM1(s0, w1, b0, a1, 0'b0);
somaCompleta SM2(s1, w2, b1, a1, w1);
somaCompleta SM3(s2, w3, b2, a2, w2);
somaCompleta SM4(s3, carry, b3, a3, w3);

not NOT1(comparador, w3);

endmodule //--fim module somador

//------------------
//-- Meia Diferença
//------------------

module meiaDiferenca(s0, s1, a ,b);

output s0, s1;
input a, b;

wire s2;

xor XOR1 (s0, a, b);
not NOT1 (s2, a);
and AND1 (s1, b, s2);

endmodule //--fim module Meia Diferença

//----------------------
//-- Diferença Completa
//----------------------

module diferencaCompleta(s0, s1, a, b, c);

output s0, s1;
input a, b, c;

wire s2, s3, s4;

meiaDiferenca MD1 (s2, s3, a, b);
meiaDiferenca MD2 (s0, s4, s2, c);
or OR1 (s1, s3, s4);

endmodule //--fim module Diferenca Completa

// ----------------------
// -- Subtrator de 4 bits
// ----------------------

module subtrator4bits(s0, s1, s2, s3, comparador, a0, a1, a2, a3, b0, b1, b2, b3);
output s0, s1, s2, s3, comparador;
input a0, a1, a2, a3, b0 ,b1, b2, b3;

wire w1, w2, w3;

diferencaCompleta DC1 (s0, w1, a0 ,b0, 0'b0);
diferencaCompleta DC2 (s1, w2, a1, b1, w1);
diferencaCompleta DC3 (s2, w3, a2, b2, w2);
diferencaCompleta DC4 (s3, comparador, a3, b3, w3);

endmodule //--fim module Subtrator4bits

// -------------------
// -- Complemento de 1
// -------------------

module complementode1(s00, s01, s02, s03, s10, s11, s12, s13, a0 ,a1, a2, a3, b0 ,b1, b2, b3);

output s00, s01, s02, s03, s10, s11, s12, s13;
input a0 ,a1, a2, a3, b0 ,b1, b2, b3;

not NOT1(s00, a0);
not NOT2(s01, a1);
not NOT3(s02, a2);
not NOT4(s03, a3);
not NOT5(s10, b0);
not NOT6(s11, b1);
not NOT7(s12, b2);
not NOT8(s13, b3);

endmodule //--fim module complementode1);

// --------------------
// -- Comparador Logico
// --------------------

module comparadorLogico(s0, a0, a1, a2, a3, b0 ,b1, b2, b3);

output s0;
input a0, a1, a2, a3, b0 ,b1, b2, b3;

wire w1, w2, w3, w4;

xor XOR1(w1, a0, b0);
xor XOR2(w2, a1, b1);
xor XOR3(w3, a2, b2);
xor XOR4(w4, a3, b3);
xor XOR5(s0, w1, w2, w3, w4);

endmodule //--fim module comparadorLogico

// ------
// -- ALU
// ------

module aLU(s0 ,s1, s2, s3, carry, overFlow, x0, y0, y1, y2, y3, comparador, k0, s00, s01, s02, s03, s10, s11, s12, s13, a0, a1, a2, a3, b0, b1, b2, b3);

output  s0 ,s1, s2, s3, carry, overFlow, x0, y0, y1, y2, y3, comparador, k0, s00, s01, s02, s03, s10, s11, s12, s13;
input a0, a1, a2, a3, b0, b1, b2, b3;

wire w1;

somador4bits S4B(s0, s1, s2, s3, carry, w1, a0, a1, a2, a3, b0 ,b1, b2, b3);
and AND1(overFlow, carry, w1);

comparadorLogico CL (x0, a0, a1, a2, a3, b0 ,b1, b2, b3);

subtrator4bits Su4B(y0, y1, y2, y3, comparador, a0, a1, a2, a3, b0, b1, b2, b3);

//igual a zero
xor XOR1(k0, a0, a1, a2, a3, b0, b1, b2, b3);

complementode1 C1(s00, s01, s02, s03, s10, s11, s12, s13, a0 ,a1, a2, a3, b0 ,b1, b2, b3);

endmodule //--fim module ALU

