// ---------------------
// Guia 06  ALU para 4 bits
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------
 
// ---------------------
// -- somador completo
// ---------------------

module somador_completo(cout, s0, a0, b0, cin);

output cout, s0;
input a0, b0, cin;
wire c0, c1, c2;

xor XOR1(c0, a0, b0);
and AND1(c1, a0, b0);

xor XOR2(s0, c0, cin);
and AND2(c2, c0, cin);

or OR1(cout, c1, c2);

endmodule //fim

// ---------------------
// -- somador 4 bits
// ---------------------

module somador_4bits(s, a, b);

output [5:0]s;
input [3:0]a, b;
wire c1, c3, c5, c7;

somador_completo S1(c1, s[0], a[0], b[0], 0);
somador_completo S2(c3, s[1], a[1], b[1], c1);
somador_completo S3(c5, s[2], a[2], b[2], c3);
somador_completo S4(s[4], s[3], a[3], b[3], c5);

not NOT1(c7, c5);
and AND1(s[5], c7, s[4]);

endmodule //fim

// ---------------------
// -- comparador logico
// ---------------------

module comparador_logico(s, a, b);

input [3:0]a, b;
output s;
wire st1;

xor XOR1(saida1, a[0], b[0]);
xor XOR2(saida2, a[1], b[1]);
xor XOR3(saida3, a[2], b[2]);
xor XOR4(saida4, a[3], b[3]);

or OR1(s, saida1, saida2, saida3, saida4);

endmodule //fim

// ---------------------
// -- not Gate
// ---------------------
module notGate(s, a);

output s;
input a;

nand NAND1(s, a, a);

endmodule //fim

// ---------------------
// -- and Gate
// ---------------------

module andGate(s, a, b);

output s0, s;
input a, b;
wire s, s0;

nand NAND1(s, a, b);
notGate NOT1_NAND1(s0, s);

endmodule //fim

// ---------------------
// -- or Gate
// ---------------------

module orGate(s0, a, b);

output s0, sA, sB;
input a, b;
wire s0, sA, sB;

notGate NOT1(sA, a);
notGate NOT2(sB, b);
nand NAND1(s0, sA, sB);

endmodule //fim

// ---------------------
// -- saida 0
// ---------------------

module saida_0(s, a, b);

output s, s1, s2, s3, s4;
input a,b;
wire s, s1;

notGate NOT1(s1, a);
nand NAND1(s2, s1, b);
notGate NOT2(s3, b);
nand NAND2(s4, s3, a);
nand NAND3(s, s2, s4);

endmodule //fim

// ---------------------
// -- saida 1
// ---------------------

module saida_1(s, a, b);

output s1, s2, s;
input a, b;
wire s;

notGate NOT1(s1, a);
nand NAND1(s2, s1, b);
notGate NOT2(s, s2);

endmodule //fim

// ---------------------
// -- meia diferenca 1
// ---------------------

module meiaDif1(s0, s1, a, b);

input a, b;
output s0, s1;
wire s0, s1;

saida_0 S0(s0, a, b);
saida_1 S1(s1, a, b);

endmodule //fim

// ---------------------
// -- diferenca completa
// ---------------------

module diferenca_completa(s3, s5, a, b, c);

input a, b, c;
output s1, s0, s3, s4, s5;
wire s1, s0;

meiaDif1 MEIASOMA1(s0, s1, a, b);
meiaDif1 MEIASOMA2(s3, s4, s0, c);
or OR1(s5, s1, s4);

endmodule //fim

// ---------------------
// -- subtrator 4 bits
// ---------------------

module subtrator_4bits(s, a, b);
input [3:0] a, b;
output [4:0]s;
wire st1, st2, st3;

diferenca_completa DC1(s[0], st1, a[0], b[0], 0);
diferenca_completa DC2(s[1], st2, a[1], b[1], st1);
diferenca_completa DC3(s[2], st3, a[2], b[2], st2);
diferenca_completa DC4(s[3], s[4], a[3], b[3], st3);

endmodule //fim

// ---------------------
// -- zero
// ---------------------
module Zero(s, a, b);

input [3:0] a, b;
output s;

nor NOR_1(s, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0]);

endmodule //fim 

// ---------------------
// -- complemento de 1
// ---------------------

module complemento_de_1(s, a);

input [3:0]a;
output [3:0]s;

not NOT1(s[0], a[0]);
not NOT1(s[1], a[1]);
not NOT1(s[2], a[2]);
not NOT1(s[3], a[3]);

endmodule //fim 

module teste;

wire [5:0] s;
wire s1, s2;
wire [3:0] c1a, c1b;
wire [4:0] s_Subtrator;
reg [3:0] a, b;

somador_4bits A1(s, a, b);
comparador_logico CL1(s1, a, b);
Zero Z1(s2, a, b);
complemento_de_1 CD11(c1a, a);
complemento_de_1 CD12(c1b, b);
subtrator_4bits S1(s_Subtrator, a, b);


initial begin: start

a=0;b=0;

end

initial begin: main

	$display("Guia 06_- Anderson Belchior de Carvalho - 396673");
	
	$display("ALU para 4 bits (sinal = 1 + amplitude = 3 )");
	
	$monitor("\n\nA = %4b\nB = %4b \nDiferente(1 - Sim, 0 - Nao): %b\nSomador: %b%b%b%b%b\nZero: %b\nOverFlow: %b\nA': %b\nB': %b\nSubtraido: %b%b%b%b\nA < B(1 - Sim, 0 - Nao): %b",a , b, s1, s[4], s[3], s[2], s[1], s[0], s[5], s2, c1a, c1b, s_Subtrator[3], s_Subtrator[2], s_Subtrator[1], s_Subtrator[0], s_Subtrator[4]);
		
	#1 a = 0; b = 1;
	#1 a = 0; b = 2;
	#1 a = 0; b = 3;
	#1 a = 0; b = 4;
	#1 a = 0; b = 5;
	#1 a = 0; b = 6;
	#1 a = 0; b = 7;
	
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	#1 a = 1; b = 2;
	#1 a = 1; b = 3;
	#1 a = 1; b = 4;
	#1 a = 1; b = 5;
	#1 a = 1; b = 6;
	#1 a = 1; b = 7;
	
	#1 a = 2; b = 0;
	#1 a = 2; b = 1;
	#1 a = 2; b = 2;
	#1 a = 2; b = 3;
	#1 a = 2; b = 4;
	#1 a = 2; b = 5;
	#1 a = 2; b = 6;
	#1 a = 2; b = 7;
	
	#1 a = 3; b = 0;
	#1 a = 3; b = 1;
	#1 a = 3; b = 2;
	#1 a = 3; b = 3;
	#1 a = 3; b = 4;
	#1 a = 3; b = 5;
	#1 a = 3; b = 6;
	#1 a = 3; b = 7;
	
	#1 a = 4; b = 0;
	#1 a = 4; b = 1;
	#1 a = 4; b = 2;
	#1 a = 4; b = 3;
	#1 a = 4; b = 4;
	#1 a = 4; b = 5;
	#1 a = 4; b = 6;
	#1 a = 4; b = 7;
	
	#1 a = 5; b = 0;
	#1 a = 5; b = 1;
	#1 a = 5; b = 2;
	#1 a = 5; b = 3;
	#1 a = 5; b = 4;
	#1 a = 5; b = 5;
	#1 a = 5; b = 6;
	#1 a = 5; b = 7;
	
	#1 a = 6; b = 0;
	#1 a = 6; b = 1;
	#1 a = 6; b = 2;
	#1 a = 6; b = 3;
	#1 a = 6; b = 4;
	#1 a = 6; b = 5;
	#1 a = 6; b = 6;
	#1 a = 6; b = 7;
	
	#1 a = 7; b = 0;
	#1 a = 7; b = 1;
	#1 a = 7; b = 2;
	#1 a = 7; b = 3;
	#1 a = 7; b = 4;
	#1 a = 7; b = 5;
	#1 a = 7; b = 6;
	#1 a = 7; b = 7;
end

endmodule //fim guia06