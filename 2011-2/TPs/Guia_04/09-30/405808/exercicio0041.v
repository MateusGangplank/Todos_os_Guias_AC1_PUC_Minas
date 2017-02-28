// ------------------------- 
// Exercicio0041 - FULL ADDER 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808
// ------------------------- 

// ------------------------- 
// half adder 1bit
// ------------------------- 
module halfAdder ( s, carryOut, a, b);
//------- VARIÁVEIS --------
output s;
output carryOut;
input a, b;
//------- DESCRIÇÃO --------
xor xor1 (s, a, b);
and and1 (carryOut, a, b);
endmodule // halfAdder 
// ------------------------- 

// ------------------------- 
// full adder 1bit
// ------------------------- 
module fullAdder ( s, carryOut, a, b, carryIn);
//------- VARIÁVEIS --------
output s;
output carryOut;
input a, b;
input carryIn;
wire sha1, coha1, coha2;
//------- DESCRIÇÃO --------
halfAdder HA1 (sha1, coha1, a, b);
halfAdder HA2 (s, coha2, sha1, carryIn);
or OR1 (carryOut, coha1, coha2);
endmodule // fullAdder 
// ------------------------- 

// ------------------------- 
// full adder 5bit
// ------------------------- 
module fullAdder5b ( s, carryOut, a, b, carryIn);
//------- VARIÁVEIS --------
output [4:0] s;
output carryOut;
input [4:0] a, b;
input carryIn;
wire co0, co1, co2, co3;
//------- DESCRIÇÃO --------
fullAdder FA1 (s[0], co0, a[0], b[0], carryIn);
fullAdder FA2 (s[1], co1, a[1], b[1], co0);
fullAdder FA3 (s[2], co2, a[2], b[2], co1);
fullAdder FA4 (s[3], co3, a[3], b[3], co2);
fullAdder FA5 (s[4], carryOut, a[4], b[4], co3);
endmodule // fullAdder5b 
// ------------------------- 

// ------------------------- 
// --2's complement 5 bit
// ------------------------- 
module Compl26th ( o, s, op);
//------- VARIÁVEIS --------
input [4:0] s;
input op;
output [4:0] o;
wire lost;
wire [4:0] fix;
wire [4:0] i;
assign fix = s;
//------- DESCRIÇÃO --------
not xor1 (i[0], fix[0], op);
not xor2 (i[1], fix[1], op);
not xor3 (i[2], fix[2], op);
not xor4 (i[3], fix[3], op);
not xor4 (i[4], fix[4], op);
fullAdder5b FA1 (o, lost, i, 1, 0);
endmodule //fim do modulo compl de 2
//---------------------------

// ------------------------------------------------------ 
// --  =<>
// ------------------------- 
module relacao ( ig, men, mai, a, b);
//------- VARIÁVEIS --------
input [4:0] a, b;
output ig, men, mai;
wire [4:0] xors, ands; 
//------- DESCRIÇÃO --------
xor xor1 (xors [0], a[0], b[0]);
xor xor2 (xors [1], a[1], b[1]);
xor xor3 (xors [2], a[2], b[2]);
xor xor4 (xors [3], a[3], b[3]);
xor xor4 (xors [4], a[4], b[4]);
//--igual
and bigAnd (ig, xors[0], xors[1], xors[2], xors[3], xors[4], xors[0]);
//--maior
and and1 (ands [0], a[0], ~xors[0]);
and and2 (ands [1], a[1], ~xors[1], xors[0]);
and and3 (ands [2], a[2], ~xors[2], xors[1], xors[0]);
and and4 (ands [3], a[3], ~xors[3], xors[2], xors[1], xors[0]);
and and5 (ands [4], a[4], ~xors[4], xors[3], xors[2], xors[1], xors[0]);
or bigOr (mai, ands[0], ands[1], ands[2], ands[3], ands[4]); 
//--menor
wire dif, meo;
not dif (dif, ig);
not men (meo, mai);
and menor (men, dif, meo);
endmodule //fim do modulo de relações
//---------------------------

// ------------------------------------------------------ 
// --  Sinal para Adição
// ------------------------- 
module sinalAdd ( o, men, mai, sa, sb);
//------- VARIÁVEIS --------
input men, mai, sa, sb;
output o;
wire aneg, apos;
and andneg (aneg, men, sb);
and andpos (apos, mai, sa); 
or orout (o, aneg, apos);
endmodule //fim do modulo de sinal
//---------------------------

// ------------------------------------------------------ 
// --  Integração
// ------------------------- 
module fa5bS ( sin, s, sinala, a, sinalb, b);
//------- VARIÁVEIS --------
input [4:0] a, b;
input sinala, sinalb;
output [4:0] s;
output sin;
wire [4:0] compa, compb, soma, compsom;
wire ig, men, mai, lost; 
//------- DESCRIÇÃO --------
Compl26th ca (compa, a, sinala);
Compl26th cb (compb, b, sinalb);
relacao rel (ig, men, mai, a, b);
sinalAdd sn (sin, men, mai, sinala, sinalb);
fullAdder5b som (soma, lost, compa, compb, 0);
Compl26th cs (s, soma, sin);
endmodule //fim do modulo de integração
//---------------------------

//-- programa de testes
// ------------------------------------------------------- 
// Test full adder 5b + s
// ------------------------- 
module test_fullAdder5bS; 
// ------------------------- definir dados 
reg [4:0] x, y;
reg sx, sy; 
wire [4:0] saida, xi, yi;
wire ss, sxi, syi;
assign sxi = sx;
assign syi = sy;
assign xi = x;
assign yi = y;
// ------------------------- Operações
fa5bS FA1 (ss, saida, sxi, xi, syi, yi);
// ------------------------- parte principal 
initial begin 
x = 5'b00000;
y = 5'b00000; 
#1
$display("Exemplo0041 - Jose Ferreira Reis Fonseca  - 405808"); 
$display("Test ALU's full adder");
$monitor("a = %1b %5b b = %1b %5b soma = %1b %5b", sx, x, sy, y, ss, saida);
//--soma de modulo o pos
sx = 0;
sy = 0;
x = 5'b00000;
y = 5'b00000;
#1;
//--soma de modulo o neg
sx = 1;
sy = 1;
x = 5'b00000;
y = 5'b00000;
#1;
//--soma de modulo o sin dif
sx = 0;
sy = 1;
x = 5'b00000;
y = 5'b00000;
#1;
//--soma de result 0 pos
sx = 0;
sy = 0;
x = 5'b10111;
y = 5'b01001;
#1;
//--soma de result 0
sx = 0;
sy = 1;
x = 5'b11010;
y = 5'b11010;
#1;
//--< + > pos
sx = 0;
sy = 0;
x = 5'b00101;
y = 5'b01001;
#1;
//--< + > neg
sx = 1;
sy = 1;
x = 5'b00111;
y = 5'b01001;
#1;
//--> + > neg
sx = 0;
sy = 1;
x = 5'b00111;
y = 5'b01001;
#1;
// -------------------------- testes do somador completo
 
end 
endmodule // test_fullAdderS5b 