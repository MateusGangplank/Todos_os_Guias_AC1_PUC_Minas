// ----------------------------------------------------------------------
// Guia 05 - Exericio 01 - Soma completa de dois valores de 3 bits cada
// Nome: Henrique Carvalho Parreira
// Matricula: 384047
// ----------------------------------------------------------------------

//-------------
//-- Meia Soma
//-------------

module meiaSoma(s0, s1, a, b);

output s0, s1;
input a, b;

xor XOR1(s0, a, b);
and AND1(s1, a, b);

endmodule 

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

// ------------
// -- Operação
// ------------

module operacao (s00, s10, s20, s30, a0, a1, a2, b0, b1, b2, c);
output s00, s10, s20, s30;
input a0, a1, a2, b0, b1, b2, c;

wire s0, s1, s2, s01, s11, s21;

xor XOR0 (s0, b0, c);
somaCompleta SC0 (s00, s01, a0, s0, c);
xor XOR1 (s1, b1, c);
somaCompleta SC1 (s10, s11, a1, s1, s01);
xor XOR2 (s2, b2, c);
somaCompleta SC2 (s20, s21, a2, s2, s11);

assign s30 = s21;

endmodule //--fim module operacao
 
 
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
$display("Guia 05 - Exercicio 01");
$display("Henrique Carvalho PArreira - 347133");
$display("Test soma com 3 bits");
$display("\na2 a1 a0 + b2 b1 b0= s30 s20 s10 s00\n");
$monitor("%b %b %b   +   %b %b %b  =  %b %b %b %b", a2, a1, a0, b2, b1, b0, s30, s20, s10, s00);
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
 
 endmodule //-- fim teste operacao

