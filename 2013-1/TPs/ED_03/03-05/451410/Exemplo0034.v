// -------------------------
// Exemplo0034 
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------
// Mateus_gate
// -------------------------

module mateus(s,a,b,chave1,chave2);

output s;

input a;
input b;
input chave1;
input chave2;

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

assign temp01 = (~(a^b));
assign temp02 = (a^b);
assign temp03 = (~(a|b));
assign temp04 = a|b;
assign temp05 = temp01&chave1;
assign temp06 = temp03&(~chave1);
assign temp07 = temp02&chave1;
assign temp08 = temp04&(~chave1);
assign temp09 = temp05 | temp06;
assign temp10 = temp07 | temp08;
assign temp11 = temp09&chave2;
assign temp12 = temp10&(~chave2);
assign s = temp11 | temp12;

endmodule

module testMateus;

reg a;
reg b;
reg chave1;
reg chave2;

wire s;

mateus lima(s,a,b,chave1,chave2);

initial begin:main

$display ("Exemplo 0034 - Mateus Lima Batista");
$display ("Matricula : 451410");
$display ("Test LU's module ");
$display ("\n a b chave1 chave2 s");

#1 a = 0; b = 0; chave1 = 0; chave2 = 0;

$monitor("%3b\t%3b\t%3b\t%3b\t%3b",a,b,chave1,chave2,s);
#1 a = 0; b = 1; chave1 = 0; chave2 = 0;
#1 a = 1; b = 0; chave1 = 0; chave2 = 0;
#1 a = 1; b = 1; chave1 = 0; chave2 = 0;
#1 a = 0; b = 0; chave1 = 1; chave2 = 0;
#1 a = 0; b = 1; chave1 = 1; chave2 = 0;
#1 a = 1; b = 0; chave1 = 1; chave2 = 0;
#1 a = 1; b = 1; chave1 = 1; chave2 = 0;
#1 a = 0; b = 0; chave1 = 0; chave2 = 1;
#1 a = 0; b = 1; chave1 = 0; chave2 = 1;
#1 a = 1; b = 0; chave1 = 0; chave2 = 1;
#1 a = 1; b = 1; chave1 = 0; chave2 = 1;
#1 a = 0; b = 0; chave1 = 1; chave2 = 1;
#1 a = 0; b = 1; chave1 = 1; chave2 = 1;
#1 a = 1; b = 0; chave1 = 1; chave2 = 1;
#1 a = 1; b = 1; chave1 = 1; chave2 = 1;

end
endmodule
