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
wire [4:0] i;
//------- DESCRIÇÃO --------
not xor1 (i[0], s[0], op);
not xor2 (i[1], s[1], op);
not xor3 (i[2], s[2], op);
not xor4 (i[3], s[3], op);
not xor4 (i[4], s[4], op);
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
and bigAnd (ig, xors);
//--maior
and and1 (ands [0], a[0], ~xors[0]);
and and2 (ands [1], a[1], ~xors[1], xors[0]);
and and3 (ands [2], a[2], ~xors[2], xors[1], xors[0]);
and and4 (ands [3], a[3], ~xors[3], xors[2], xors[1], xors[0]);
and and5 (ands [4], a[4], ~xors[4], xors[3], xors[2], xors[1], xors[0]);
or bigOr (mai,ands); 
//--menor
and menor (~ig, ~mai);
endmodule //fim do modulo de relações
//---------------------------

// ------------------------------------------------------ 
// --  Sinal para Adição
// ------------------------- 
module sinalAdd ( o, men, mai, sa, sb);
//------- VARIÁVEIS --------
input men, mai, a, b;
output o;
wire [4:0] xors, ands; 
//------- DESCRIÇÃO --------
xor xor1 (xors [0], a[0], b[0]);
xor xor2 (xors [1], a[1], b[1]);
xor xor3 (xors [2], a[2], b[2]);
xor xor4 (xors [3], a[3], b[3]);
xor xor4 (xors [4], a[4], b[4]);
//--igual
and bigAnd (ig, xors);
//--maior
and and1 (ands [0], a[0], ~xors[0]);
and and2 (ands [1], a[1], ~xors[1], xors[0]);
and and3 (ands [2], a[2], ~xors[2], xors[1], xors[0]);
and and4 (ands [3], a[3], ~xors[3], xors[2], xors[1], xors[0]);
and and5 (ands [4], a[4], ~xors[4], xors[3], xors[2], xors[1], xors[0]);
or bigOr (mai,ands); 
//--menor
and menor (~ig, ~mai);
endmodule //fim do modulo de relações
//---------------------------

// ------------------------------------------------------ 
// --  Integração
// ------------------------- 
module fa5bS ( sinal, s, a, b);
//------- VARIÁVEIS --------
input [4:0] a, b;
output [4:0] s;
output sinal;
wire [4:0] compa, compb; 
//------- DESCRIÇÃO --------
Compl26th (compa, a, sinal);

endmodule //fim do modulo de integração
//---------------------------

//-- programa de testes
// ------------------------------------------------------- 
// Test full adder 5b + s
// ------------------------- 
module test_fullAdder5bS; 
// ------------------------- definir dados 
reg [5:0] x; 
reg [5:0] y; 
reg carryIn = 0; 
wire [5:0] soma;
wire [5:0] saida;
wire carryOut;
// ------------------------- Operações
wire [5:0] xi; 
wire [5:0] yi;
Compl26th c26b1 (xi, x);
Compl26th c26b2 (yi, y);
fullAdder6b FA1 (soma, carryOut, xi, yi, carryIn);
Compl26th c2out6b (saida, soma);
// ------------------------- parte principal 
initial begin 
x = 6'b000000;
y = 6'b000000; 
#1
$display("Exemplo0041 - Jose Ferreira Reis Fonseca  - 405808"); 
$display("Test ALU's full adder");
$monitor("a = %6b b = %6b soma = %9b", x, y, saida);
x = 6'b000000;
y = 6'b000000;
#1;
x = 6'b011000;
y = 6'b001111;
#1;
x = 6'b000001;
y = 6'b000011;
#1;
x = 6'b001010;
y = 6'b000101;
#1;
x = 6'b010001;
y = 6'b001101;
#1;
x = 6'b011111;
y = 6'b000001;
#1;
x = 6'b101000;
y = 6'b000001;
#1;
x = 6'b011000;
y = 6'b101111;
#1;
x = 6'b000001;
y = 6'b100011;
#1;
x = 6'b101010;
y = 6'b000101;
#1;
x = 6'b010001;
y = 6'b101101;
#1;
x = 6'b011111;
y = 6'b100001;
#1;
// -------------------------- testes do somador completo
 
end 
endmodule // test_fullAdderS5b 