// ----------------------------------------------------------------------------------------------
// Guia 05 - Exericio 05 - Diferenca completa de 2 valores usando 2 bits somente com portas NOR
// Nome: Henrique Carvalho Parreira
// Matricula: 347133
// ----------------------------------------------------------------------------------------------

//-------------------
//-- Meia Diferença
//-------------------

module meiaDiferenca(s0, s1, a, b);

output s0, s1;
input a, b;

wire s2, s3, s4, s5, s6, s7, s8, s9;

nor NOR1 (s2, a, a);
nor NOR2 (s3, b, b);
nor NOR3 (s4, a, a);
nor NOR4 (s5, s2, b);
nor NOR5 (s6, s3, a);
nor NOR6 (s7, b, b);
nor NOR7 (s8, s4, s4);
nor NOR8 (s9, s5, s6);
nor NOR9 (s1, s7, s8);
nor NOR10(s0, s9, s9);

endmodule 

module diferencaCompleta(s0 ,s1, a, b, c);

output s0, s1;
input a, b, c;

meiaDiferenca MD1 (s2, s3, a ,b);
meiaDiferenca MD2 (s0, s4, s2, c);
nor NOR1 (s5, s3, s4);
nor NOR2 (s1, s5, s5);

endmodule

// ------------
// -- Operacao
// ------------

module operacao (s00, s10, s20, s30, a0, a1, a2, b0, b1, b2);
output s00, s10, s20, s30;
input a0, a1, a2, b0, b1, b2;

wire s01, s11, s21;

meiaDiferenca MD0 (s00, s01, a0, b0);
diferencaCompleta DC1 (s10, s11, a1, b1, s01);
diferencaCompleta DC2 (s20, s21, a2, b2, s11);

assign s30 = s21;

endmodule 

// ----------------
// -- test operacao
//-----------------

module testOperacao;
reg   a0, a1, a2, b0, b1, b2, c;
wire  s00, s10, s20, s30;

// -- instância
operacao OP1 (s00, s10, s20, s30, a0, a1, a2, b0, b1, b2);

initial begin:start
a0=0; a1=0; a2=0; b0=0; b1=0; b2=0;    
end

//-- parte principal
initial begin:main
$display("Guia 05 - Exercicio 05 - Eduardo de Abreu Fortes - 384047");
$display("Henrique Carvalho Parreira - 347133");
$display("Test Diferenca Completa com 2 bits usando apenas portar NOR");
$display("\na2 a1 a0 - b2 b1 b0 = s30 s20 s10 s00\n");
$monitor("%b %b %b  -  %b %b %b  =  %b %b %b %b", a2, a1, a0, b2, b1, b0, s30, s20, s10, s00);
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

endmodule // --fim module testOperacao