// --------------------------------------------------------------------------
// Guia 05 - Exericio 02 - Diferença completa de dois valores de 2 bits cada
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// ---------------------------------------------------------------------------

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

module diferencaCompleta(s0, s1, a, b, c);

output s0, s1;
input a, b, c;

wire s2, s3, s4;

meiaDiferenca MD1 (s2, s3, a, b);
meiaDiferenca MD2 (s0, s4, s2, c);
or OR1 (s1, s3, s4);

endmodule //--fim module Diferenca Completa

// ------------
// -- Operação  
// ------------

module operacao (s00, s10, s20, a0, a1, b0, b1);
output s00, s10, s20;
input a0, a1, b0, b1;

wire s01, s11;

meiaDiferenca MD0 (s00, s01, a0, b0);
diferencaCompleta DC1 (s10, s11, a1, b1, s01);

assign s20 = s11;

endmodule //-- fim module operacao

// ----------------
// -- test operacao
// ---------------- 


module testOperacao;
reg   a0, a1, a2, b0, b1, b2, c;
wire  s00, s10, s20, s30;

// -- instância
operacao OP1 (s00, s10, s20, a0, a1,b0, b1);

initial begin:start
a0=0; a1=0; b0=0; b1=0;    
end

//-- parte principal
initial begin:main
$display("Guia 05 - Exercicio 02 - Eduardo de Abreu Fortes - 384047");
$display("Test diferenca com 2 bits");
$display("\na1 a0 - b1 b0 = s20 s10 s00\n");
$monitor("%b %b - %b %b = %b %b %b", a1, a0, b1, b0, s20, s10, s00);
#1  a0=0; a1=0; b0=0; b1=1;
#1  a0=0; a1=0; b0=1; b1=0;
#1  a0=0; a1=0; b0=1; b1=1;
#1  a0=0; a1=1; b0=0; b1=0;
#1  a0=0; a1=1; b0=0; b1=1;
#1  a0=0; a1=1; b0=1; b1=0;
#1  a0=0; a1=1; b0=1; b1=1;
#1  a0=1; a1=0; b0=0; b1=0;
#1  a0=1; a1=0; b0=0; b1=1;
#1  a0=1; a1=0; b0=1; b1=0;
#1  a0=1; a1=0; b0=1; b1=1;
#1  a0=1; a1=1; b0=0; b1=0;
#1  a0=1; a1=1; b0=0; b1=1;
#1  a0=1; a1=1; b0=1; b1=0;
#1  a0=1; a1=1; b0=1; b1=1;
 
end

endmodule //-- fim teste operacao