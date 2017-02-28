// -------------------------
// Exemplo0035 
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------
// Mateus_gate
// -------------------------

module mateus(s,a,b,chave1,chave2,chave3);

output s;

input a;
input b;
input chave1;
input chave2;
input chave3;

wire temp01;
wire temp02;
wire temp03;
wire temp04;
wire temp05;
wire temp06;
wire temp07;
wire temp08;
wire temp09;
wire temp10;
wire temp11;
wire temp12;
wire temp13;
wire temp14;
wire temp15;
wire temp16;
wire temp17;
wire temp18;
wire temp19;
wire temp20;
wire temp21;
wire temp22;
wire temp23;

assign temp01 = a | b;
assign temp02 = (~(a|b));
assign temp03 = a & b;
assign temp04 = (~(a&b));
assign temp05 = a^b;
assign temp06 = (~(a^b));
assign temp07 = temp01 & chave1;
assign temp08 = temp02 & ~(chave1);
assign temp09 = temp03 & chave1;
assign temp10 = temp04 & ~(chave1);
assign temp11 = temp05 & chave1;
assign temp12 = temp06 & ~(chave1);
assign temp13 = temp07 | temp08;
assign temp14 = temp09 | temp10;
assign temp15 = temp11 | temp12;
assign temp16 = temp13 & chave2;
assign temp17 = temp14 & ~(chave2);
assign temp18 = (~b) & chave2;
assign temp19 = temp15 & ~(chave2);
assign temp20 = temp16 | temp17;
assign temp21 = temp18 | temp19;
assign temp22 = temp20 & chave3;
assign temp23 = temp21 & ~(chave3);
assign s = temp22 | temp23;
endmodule

// USAR PORTAS !!!

module testMateus;

reg a;
reg b;
reg chave1;
reg chave2;
reg chave3;

wire s;

mateus lima(s,a,b,chave1,chave2,chave3);

initial begin:main

$display ("Exemplo 0035 - Mateus Lima Batista");
$display ("Matricula : 451410");
$display ("Test LU's module ");
$display ("\n  a\t  b\t chave1\t chave2\t chave3\t  s");

#1 a = 0; b = 0; chave1 = 0; chave2 = 0; chave3 = 0;

$monitor("%3b\t%3b\t%3b\t%3b\t%3b\t%3b",a,b,chave1,chave2,chave3,s);
#1 a = 0; b = 1; chave1 = 0; chave2 = 0; chave3 = 0;
#1 a = 1; b = 0; chave1 = 0; chave2 = 0; chave3 = 0;
#1 a = 1; b = 1; chave1 = 0; chave2 = 0; chave3 = 0;
#1 a = 0; b = 0; chave1 = 1; chave2 = 0; chave3 = 0;
#1 a = 0; b = 1; chave1 = 1; chave2 = 0; chave3 = 0;
#1 a = 1; b = 0; chave1 = 1; chave2 = 0; chave3 = 0;
#1 a = 1; b = 1; chave1 = 1; chave2 = 0; chave3 = 0;
#1 a = 0; b = 0; chave1 = 0; chave2 = 1; chave3 = 0;
#1 a = 0; b = 1; chave1 = 0; chave2 = 1; chave3 = 0;
#1 a = 1; b = 0; chave1 = 0; chave2 = 1; chave3 = 0;
#1 a = 1; b = 1; chave1 = 0; chave2 = 1; chave3 = 0;
#1 a = 0; b = 0; chave1 = 1; chave2 = 1; chave3 = 0;
#1 a = 0; b = 1; chave1 = 1; chave2 = 1; chave3 = 0;
#1 a = 1; b = 0; chave1 = 1; chave2 = 1; chave3 = 0;
#1 a = 1; b = 1; chave1 = 1; chave2 = 1; chave3 = 0;

#1 a = 0; b = 1; chave1 = 0; chave2 = 0; chave3 = 1;
#1 a = 1; b = 0; chave1 = 0; chave2 = 0; chave3 = 1;
#1 a = 1; b = 1; chave1 = 0; chave2 = 0; chave3 = 1;
#1 a = 0; b = 0; chave1 = 1; chave2 = 0; chave3 = 1;
#1 a = 0; b = 1; chave1 = 1; chave2 = 0; chave3 = 1;
#1 a = 1; b = 0; chave1 = 1; chave2 = 0; chave3 = 1;
#1 a = 1; b = 1; chave1 = 1; chave2 = 0; chave3 = 1;
#1 a = 0; b = 0; chave1 = 0; chave2 = 1; chave3 = 1;
#1 a = 0; b = 1; chave1 = 0; chave2 = 1; chave3 = 1;
#1 a = 1; b = 0; chave1 = 0; chave2 = 1; chave3 = 1;
#1 a = 1; b = 1; chave1 = 0; chave2 = 1; chave3 = 1;
#1 a = 0; b = 0; chave1 = 1; chave2 = 1; chave3 = 1;
#1 a = 0; b = 1; chave1 = 1; chave2 = 1; chave3 = 1;
#1 a = 1; b = 0; chave1 = 1; chave2 = 1; chave3 = 1;
#1 a = 1; b = 1; chave1 = 1; chave2 = 1; chave3 = 1;

end
endmodule