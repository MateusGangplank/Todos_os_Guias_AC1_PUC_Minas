// -----------------------------------------------------------------------------------------
// Guia 05 - Exericio 04 - Soma completa de 2 valores usando 3 bits somente com portas NAND
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -----------------------------------------------------------------------------------------

//-------------
//-- Meia Soma
//-------------

module meiaSoma(s0, s1, a, b);

output s0, s1;
input a, b;

wire s2, s3, s4, s5, s6, s7;

nand NAND1 (s2, a, a);
nand NAND2 (s3, b, b);
nand NAND3 (s4, a, b);
nand NAND4 (s5, s2, s3);
nand NAND5 (s6, a, b);
nand NAND6 (s1, s4, s4);
nand NAND7 (s7, s5, s6);
nand NAND8 (s0, s7, s7);

endmodule //--fim module meiaSoma

// ------------
// -- porta OR 
// ------------

module orNandGate (s0, a, b);
output s0;
input a, b;

wire s1, s2;

nand (s1, a, a);
nand (s2, b, b);
nand (s0, s1, s2);

endmodule //--fim module orNandGate

//-----------------
//-- Soma Completa
//-----------------

module somaCompleta(s0, s1, a, b, c);
input a, b, c;
output s0, s1;

wire s2, s3, s4;

meiaSoma MS0 (s2, s3, a ,b);
meiaSoma MS1 (s0, s4, s2, c);
orNandGate OR1 (s1, s3, s4);

endmodule // --fim module Soma Completa

// ------------
// -- porta Xor
// ------------

module xorNandGate (s0, a, b);
output s0;
input a, b;

wire s1, s2, s3;

nand NAND1 (s1, a, b);
nand NAND2 (s2, s1, a);
nand NAND3 (s3, s1, b);
nand NAND4 (s0 ,s2, s3);

endmodule // --fim module xorNandGate

// ------------
// -- Operacao
// ------------

module operacao (s00, s10, s20, s30, a0, a1, a2, b0, b1, b2, c);
output s00, s10, s20, s30;
input a0, a1, a2, b0, b1, b2, c;

wire s0, s1, s2, s01, s11, s21;

xorNandGate XOR0 (s0, b0, c);
somaCompleta SC0 (s00, s01, a0, s0, c);
xorNandGate XOR1 (s1, b1, c);
somaCompleta SC1 (s10, s11, a1, s1, s01);
xorNandGate XOR2 (s2, b2, c);
somaCompleta SC2 (s20, s21, a2, s2, s11);

assign s30 = s21;

endmodule // --fim module operacao

// ----------------
// -- test operacao
// ---------------- 

module testOperacao;
reg   a0, a1, a2, b0, b1, b2, c;
wire  s00, s10, s20, s30;

// -- instância
operacao OP1 (s00, s10, s20, s30, a0, a1, a2, b0, b1, b2, c);

initial begin:start
a0=0; a1=0; a2=0; b0=0; b1=0; b2=0; c=0;    
end

//-- parte principal
initial begin:main
$display("Guia 05 - Exercicio 04 - Eduardo de Abreu Fortes - 384047");
$display("Test Soma completa com 3 bits usando apenas portas NAND");
$display("\na2 a1 a0 + b2 b1 b0 = s30 s20 s10 s00\n");
$monitor("%b %b %b  +  %b %b %b  =  %b %b %b %b", a2, a1, a0, b2, b1, b0, s30, s20, s10, s00);
#1 a0=0; a1=0; a2=0; b0=0; b1=0; b2=1;
#1 a0=0; a1=0; a2=0; b0=0; b1=1; b2=0;
#1 a0=0; a1=0; a2=0; b0=0; b1=1; b2=1;
#1 a0=0; a1=0; a2=0; b0=1; b1=0; b2=0;
#1 a0=0; a1=0; a2=0; b0=1; b1=0; b2=1;
#1 a0=0; a1=0; a2=0; b0=1; b1=1; b2=0;
#1 a0=0; a1=0; a2=0; b0=1; b1=1; b2=1;
#1 a0=0; a1=0; a2=1; b0=0; b1=0; b2=0;
#1 a0=0; a1=0; a2=1; b0=0; b1=0; b2=1;
#1 a0=0; a1=0; a2=1; b0=0; b1=1; b2=0;
#1 a0=0; a1=0; a2=1; b0=0; b1=1; b2=1;
#1 a0=0; a1=0; a2=1; b0=1; b1=0; b2=0;
#1 a0=0; a1=0; a2=1; b0=1; b1=0; b2=1;
#1 a0=0; a1=0; a2=1; b0=1; b1=1; b2=0;
#1 a0=0; a1=0; a2=1; b0=1; b1=1; b2=1;
#1 a0=0; a1=1; a2=0; b0=0; b1=0; b2=0;
#1 a0=0; a1=1; a2=0; b0=0; b1=0; b2=1;
#1 a0=0; a1=1; a2=0; b0=0; b1=1; b2=0;
#1 a0=0; a1=1; a2=0; b0=0; b1=1; b2=1;
#1 a0=0; a1=1; a2=0; b0=1; b1=0; b2=0;
#1 a0=0; a1=1; a2=0; b0=1; b1=0; b2=1;
#1 a0=0; a1=1; a2=0; b0=1; b1=1; b2=0;
#1 a0=0; a1=1; a2=0; b0=1; b1=1; b2=1;
#1 a0=0; a1=1; a2=1; b0=0; b1=0; b2=0;
#1 a0=0; a1=1; a2=1; b0=0; b1=0; b2=1;
#1 a0=0; a1=1; a2=1; b0=0; b1=1; b2=0;
#1 a0=0; a1=1; a2=1; b0=0; b1=1; b2=1;
#1 a0=0; a1=1; a2=1; b0=1; b1=0; b2=0;
#1 a0=0; a1=1; a2=1; b0=1; b1=0; b2=1;
#1 a0=0; a1=1; a2=1; b0=1; b1=1; b2=0;
#1 a0=0; a1=1; a2=1; b0=1; b1=1; b2=1;
#1 a0=1; a1=0; a2=0; b0=0; b1=0; b2=0;
#1 a0=1; a1=0; a2=0; b0=0; b1=0; b2=1;
#1 a0=1; a1=0; a2=0; b0=0; b1=1; b2=0;
#1 a0=1; a1=0; a2=0; b0=0; b1=1; b2=1;
#1 a0=1; a1=0; a2=0; b0=1; b1=0; b2=0;
#1 a0=1; a1=0; a2=0; b0=1; b1=0; b2=1;
#1 a0=1; a1=0; a2=0; b0=1; b1=1; b2=0;
#1 a0=1; a1=0; a2=0; b0=1; b1=1; b2=1;
#1 a0=1; a1=0; a2=1; b0=0; b1=0; b2=0;
#1 a0=1; a1=0; a2=1; b0=0; b1=0; b2=1;
#1 a0=1; a1=0; a2=1; b0=0; b1=1; b2=0;
#1 a0=1; a1=0; a2=1; b0=0; b1=1; b2=1;
#1 a0=1; a1=0; a2=1; b0=1; b1=0; b2=0;
#1 a0=1; a1=0; a2=1; b0=1; b1=0; b2=1;
#1 a0=1; a1=0; a2=1; b0=1; b1=1; b2=0;
#1 a0=1; a1=0; a2=1; b0=1; b1=1; b2=1;
#1 a0=1; a1=1; a2=0; b0=0; b1=0; b2=0;
#1 a0=1; a1=1; a2=0; b0=0; b1=0; b2=1;
#1 a0=1; a1=1; a2=0; b0=0; b1=1; b2=0;
#1 a0=1; a1=1; a2=0; b0=0; b1=1; b2=1;
#1 a0=1; a1=1; a2=0; b0=1; b1=0; b2=0;
#1 a0=1; a1=1; a2=0; b0=1; b1=0; b2=1;
#1 a0=1; a1=1; a2=0; b0=1; b1=1; b2=0;
#1 a0=1; a1=1; a2=0; b0=1; b1=1; b2=1;
#1 a0=1; a1=1; a2=1; b0=0; b1=0; b2=0;
#1 a0=1; a1=1; a2=1; b0=0; b1=0; b2=1;
#1 a0=1; a1=1; a2=1; b0=0; b1=1; b2=0;
#1 a0=1; a1=1; a2=1; b0=0; b1=1; b2=1;
#1 a0=1; a1=1; a2=1; b0=1; b1=0; b2=0;
#1 a0=1; a1=1; a2=1; b0=1; b1=0; b2=1;
#1 a0=1; a1=1; a2=1; b0=1; b1=1; b2=0;
#1 a0=1; a1=1; a2=1; b0=1; b1=1; b2=1;

end
 
endmodule // --fim module operacao

