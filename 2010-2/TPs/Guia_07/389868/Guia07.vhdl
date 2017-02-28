//Felipe Pacifico - 389868
//Guia 7
//ALU 4bits 1 = sinal, 3 = amplitude


module somadorCompleto(carry_out, s0, a0, b0, carry_in);

output carry_out, s0;
input a0, b0, carry_in;
wire c0, c1, c2;

xor XOR1(c0, a0, b0);
and AND1(c1, a0, b0);

xor XOR2(s0, c0, carry_in);
and AND2(c2, c0, carry_in);

or OR1(carry_out, c1, c2);

endmodule

module somador4bits(s, a, b);

output [5:0]s;
input [3:0]a, b;
wire c1, c3, c5, c7;

somadorCompleto S1(c1, s[0], a[0], b[0], 0);
somadorCompleto S2(c3, s[1], a[1], b[1], c1);
somadorCompleto S3(c5, s[2], a[2], b[2], c3);
somadorCompleto S4(s[4], s[3], a[3], b[3], c5);


and A1(s[5], c5, s[4]);

endmodule

module comparadorLogico(s, a, b);

input [3:0]a, b;
output s;
wire st1;
xor XOR1(st1, a[0], b[0]);
xor XOR2(st2, a[1], b[1]);
xor XOR3(st3, a[2], b[2]);
xor XOR4(st4, a[3], b[3]);

or OR1(s, st1, st2, st3, st4);

endmodule

module notGate(s, a);

output s;
input a;

nand NAND1(s, a, a);

endmodule

module andGate(s, a, b);

output s0,s;
input a,b;
wire s,s0;

nand NAND1(s, a, b);
notGate NOT1_NAND1(s0, s);

endmodule

module orGate(s0, a, b);

output s0,sA,sB;
input a, b;
wire s0, sA, sB;

notGate NOT1(sA, a);
notGate NOT2(sB, b);
nand NAND1(s0, sA, sB);

endmodule

module saida0(s, a, b);

output s, s1, s2, s3, s4;
input a,b;
wire s, s1;

notGate NOT1(s1, a);
nand NAND1(s2, s1, b);
notGate NOT2(s3, b);
nand NAND2(s4, s3, a);
nand NAND3(s, s2, s4);

endmodule

module saida1(s, a, b);

output s1,s2,s;
input a, b;
wire s;

notGate NOT1(s1, a);
nand NAND1(s2, s1, b);
notGate NOT2(s, s2);

endmodule

module meiaDiferenca1(s0, s1, a, b);

input a,b;
output s0, s1;
wire s0,s1;

saida0 S0(s0, a, b);
saida1 S1(s1, a, b);

endmodule

module diferencaCompleta(s3, s5, a, b, c);

input a, b, c;
output s1, s0, s3, s4, s5;
wire s1, s0;

meiaDiferenca1 MEIASOMA1(s0, s1, a, b);
meiaDiferenca1 MEIASOMA2(s3, s4, s0, c);
or OR1(s5, s1, s4);

endmodule

module subtrator4bits(s, a, b);
input [3:0] a, b;
output [4:0]s;
wire st1, st2, st3;

diferencaCompleta D1(s[0], st1, a[0], b[0], 0);
diferencaCompleta D2(s[1], st2, a[1], b[1], st1);
diferencaCompleta D3(s[2], st3, a[2], b[2], st2);
diferencaCompleta D4(s[3], s[4], a[3], b[3], st3);

endmodule

module zero(s, a, b);

input [3:0] a, b;
output s;

nor N1(s, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0]);

endmodule

module complementoDe1(s, a);

input [3:0]a;
output [3:0]s;

not N1(s[0], a[0]);
not N1(s[1], a[1]);
not N1(s[2], a[2]);
not N1(s[3], a[3]);

endmodule

module complementoDe2(s, a);

input [3:0] a;
output[5:0] s;
wire [3:0] st1;

complementoDe1 C1(st1, a);
somador4bits S1(s, st1, 1);

endmodule


module decrementoDe1(s, a);

input [3:0]a;
output[4:0]s;

subtrator4bits S1(s, a, 1);

endmodule

module incrementoDe1(s, a);

input [3:0]a;
output[5:0]s;

somador4bits S1(s, a, 1);

endmodule


module teste;

wire [5:0] s, s3, s4, sIncre1, sIncre2;
wire s1, s2;
wire [3:0] c1a, c1b;
wire [4:0] sSubtrator, sDecre1, sDecre2;
reg [3:0] a, b;

somador4bits A1(s, a, b);
comparadorLogico C1(s1, a, b);
zero Z1(s2, a, b);
complementoDe1 CD11(c1a, a);
complementoDe1 CD12(c1b, b);
subtrator4bits S1(sSubtrator, a, b);
complementoDe2 C21(s3, a);
complementoDe2 C22(s4, b);
incrementoDe1 I1(sIncre1, a);
incrementoDe1 I2(sIncre2, b);
decrementoDe1 D1(sDecre1, a);
decrementoDe1 D2(sDecre2, b);

initial begin: start

a=0;b=0;

end

initial begin: main
$display("Felipe Pacifico - Guia 7 - ALU 4bits(1 = sinal, 3 = amplitude)");
$monitor("\n\nA = %4b\nB = %4b \nDiferente: %b\nSomado: %b%b%b%b%b\nZero: %b\nOverFlow: %b\nA': %b\nB': %b\nSubtraido: %b%b%b%b\nA < B: %b\nComplemento De 2 de A: %6b\nComplemento De 2 de B: %6b\nIncremento de 1 de A: %6b\nIncremento de 1 de b: %6b\nDecremento de 1 de A: %5b\nDecremento de 1 de B: %5b",a , b, s1, s[4], s[3], s[2], s[1], s[0], s2, s[5], c1a, c1b, sSubtrator[3], sSubtrator[2], sSubtrator[1], sSubtrator[0], sSubtrator[4], s3, s4, sIncre1, sIncre2, sDecre1, sDecre2);
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
#1 a = -1; b = 0;
#1 a = -1; b = 1;
#1 a = -1; b = 2;
#1 a = -1; b = 3;
#1 a = -1; b = 4;
#1 a = -1; b = 5;
#1 a = -1; b = 6;
#1 a = -1; b = 7;
#1 a = -1; b = -1;
	





end

endmodule

/*

teste

     ----jGRASP exec: C:\Programas\ProgramasAC\Icarus_Verilog\bin\vvp ALU.vvp
    
    Felipe Pacifico - Guia 7 - ALU 4bits(1 = sinal, 3 = amplitude)
    
    
    A = 0000
    B = 0000 
    Diferente: 0
    Somado: 00000
    Zero: 1
    OverFlow: 0
    A': 1111
    B': 1111
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 11111
    
    
    A = 0000
    B = 0001 
    Diferente: 1
    Somado: 00001
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1110
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00000
    
    
    A = 0000
    B = 0010 
    Diferente: 1
    Somado: 00010
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1101
    Subtraido: 1110
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00001
    
    
    A = 0000
    B = 0011 
    Diferente: 1
    Somado: 00011
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1100
    Subtraido: 1101
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00010
    
    
    A = 0000
    B = 0100 
    Diferente: 1
    Somado: 00100
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1011
    Subtraido: 1100
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00011
    
    
    A = 0000
    B = 0101 
    Diferente: 1
    Somado: 00101
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1010
    Subtraido: 1011
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00100
    
    
    A = 0000
    B = 0110 
    Diferente: 1
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1001
    Subtraido: 1010
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001010
    
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00101
    
    
    A = 0000
    B = 0111 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1111
    B': 1000
    Subtraido: 1001
    A < B: 1
    Complemento De 2 de A: 110000
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000001
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 11111
    Decremento de 1 de B: 00110
    
    
    A = 0001
    B = 0000 
    Diferente: 1
    Somado: 00001
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1111
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 11111
    
    
    A = 0001
    B = 0001 
    Diferente: 0
    Somado: 00010
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1110
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00000
    
    
    A = 0001
    B = 0010 
    Diferente: 1
    Somado: 00011
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1101
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00001
    
    
    A = 0001
    B = 0011 
    Diferente: 1
    Somado: 00100
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1100
    Subtraido: 1110
    A < B: 1
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00010
    
    
    A = 0001
    B = 0100 
    Diferente: 1
    Somado: 00101
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1011
    Subtraido: 1101
    A < B: 1
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00011
    
    
    A = 0001
    B = 0101 
    Diferente: 1
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1010
    Subtraido: 1100
    A < B: 1
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00100
    
    
    A = 0001
    B = 0110 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1001
    Subtraido: 1011
    A < B: 1
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00101
    
    
    A = 0001
    B = 0111 
    Diferente: 1
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1110
    B': 1000
    Subtraido: 1010
    A < B: 1
    Complemento De 2 de A: 001111
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000010
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00000
    Decremento de 1 de B: 00110
    
    
    A = 0010
    B = 0000 
    Diferente: 1
    Somado: 00010
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1111
    Subtraido: 0010
    A < B: 0
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 11111
    
    
    A = 0010
    B = 0001 
    Diferente: 1
    Somado: 00011
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1110
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00000
    
    
    A = 0010
    B = 0010 
    Diferente: 0
    Somado: 00100
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1101
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00001
    
    
    A = 0010
    B = 0011 
    Diferente: 1
    Somado: 00101
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1100
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00010
    
    
    A = 0010
    B = 0100 
    Diferente: 1
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1011
    Subtraido: 1110
    A < B: 1
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00011
    
    
    A = 0010
    B = 0101 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1010
    Subtraido: 1101
    A < B: 1
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00100
    
    
    A = 0010
    B = 0110 
    Diferente: 1
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1001
    Subtraido: 1100
    A < B: 1
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00101
    
    
    A = 0010
    B = 0111 
    Diferente: 1
    Somado: 01001
    Zero: 0
    OverFlow: 0
    A': 1101
    B': 1000
    Subtraido: 1011
    A < B: 1
    Complemento De 2 de A: 001110
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000011
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00001
    Decremento de 1 de B: 00110
    
    
    A = 0011
    B = 0000 
    Diferente: 1
    Somado: 00011
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1111
    Subtraido: 0011
    A < B: 0
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 11111
    
    
    A = 0011
    B = 0001 
    Diferente: 1
    Somado: 00100
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1110
    Subtraido: 0010
    A < B: 0
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00000
    
    
    A = 0011
    B = 0010 
    Diferente: 1
    Somado: 00101
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1101
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001101
    
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00001
    
    
    A = 0011
    B = 0011 
    Diferente: 0
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1100
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00010
    
    
    A = 0011
    B = 0100 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1011
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00011
    
    
    A = 0011
    B = 0101 
    Diferente: 1
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1010
    Subtraido: 1110
    A < B: 1
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00100
    
    
    A = 0011
    B = 0110 
    Diferente: 1
    Somado: 01001
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1001
    Subtraido: 1101
    A < B: 1
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00101
    
    
    A = 0011
    B = 0111 
    Diferente: 1
    Somado: 01010
    Zero: 0
    OverFlow: 0
    A': 1100
    B': 1000
    Subtraido: 1100
    A < B: 1
    Complemento De 2 de A: 001101
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000100
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00010
    Decremento de 1 de B: 00110
    
    
    A = 0100
    B = 0000 
    Diferente: 1
    Somado: 00100
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1111
    Subtraido: 0100
    A < B: 0
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 11111
    
    
    A = 0100
    B = 0001 
    Diferente: 1
    Somado: 00101
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1110
    Subtraido: 0011
    A < B: 0
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00000
    
    
    A = 0100
    B = 0010 
    Diferente: 1
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1101
    Subtraido: 0010
    A < B: 0
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00001
    
    
    A = 0100
    B = 0011 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1100
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00010
    
    
    A = 0100
    B = 0100 
    Diferente: 0
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1011
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00011
    
    
    A = 0100
    B = 0101 
    Diferente: 1
    Somado: 01001
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1010
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00100
    
    
    A = 0100
    B = 0110 
    Diferente: 1
    Somado: 01010
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1001
    Subtraido: 1110
    A < B: 1
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00101
    
    
    A = 0100
    B = 0111 
    Diferente: 1
    Somado: 01011
    Zero: 0
    OverFlow: 0
    A': 1011
    B': 1000
    Subtraido: 1101
    A < B: 1
    Complemento De 2 de A: 001100
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000101
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00011
    Decremento de 1 de B: 00110
    
    
    A = 0101
    B = 0000 
    Diferente: 1
    Somado: 00101
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1111
    Subtraido: 0101
    A < B: 0
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 11111
    
    
    A = 0101
    B = 0001 
    Diferente: 1
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1110
    Subtraido: 0100
    A < B: 0
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00000
    
    
    A = 0101
    B = 0010 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1101
    Subtraido: 0011
    A < B: 0
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00001
    
    
    A = 0101
    B = 0011 
    Diferente: 1
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1100
    Subtraido: 0010
    A < B: 0
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00010
    
    
    A = 0101
    B = 0100 
    Diferente: 1
    Somado: 01001
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1011
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00011
    
    
    A = 0101
    B = 0101 
    Diferente: 0
    Somado: 01010
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1010
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00100
    
    
    A = 0101
    B = 0110 
    Diferente: 1
    Somado: 01011
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1001
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00101
    
    
    A = 0101
    B = 0111 
    Diferente: 1
    Somado: 01100
    Zero: 0
    OverFlow: 0
    A': 1010
    B': 1000
    Subtraido: 1110
    A < B: 1
    Complemento De 2 de A: 001011
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000110
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00100
    Decremento de 1 de B: 00110
    
    
    A = 0110
    B = 0000 
    Diferente: 1
    Somado: 00110
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1111
    Subtraido: 0110
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 11111
    
    
    A = 0110
    B = 0001 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1110
    Subtraido: 0101
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00000
    
    
    A = 0110
    B = 0010 
    Diferente: 1
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1101
    Subtraido: 0100
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00001
    
    
    A = 0110
    B = 0011 
    Diferente: 1
    Somado: 01001
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1100
    Subtraido: 0011
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00010
    
    
    A = 0110
    B = 0100 
    Diferente: 1
    Somado: 01010
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1011
    Subtraido: 0010
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00011
    
    
    A = 0110
    B = 0101 
    Diferente: 1
    Somado: 01011
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1010
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00100
    
    
    A = 0110
    B = 0110 
    Diferente: 0
    Somado: 01100
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1001
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00101
    
    
    A = 0110
    B = 0111 
    Diferente: 1
    Somado: 01101
    Zero: 0
    OverFlow: 0
    A': 1001
    B': 1000
    Subtraido: 1111
    A < B: 1
    Complemento De 2 de A: 001010
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 000111
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00101
    Decremento de 1 de B: 00110
    
    
    A = 0111
    B = 0000 
    Diferente: 1
    Somado: 00111
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1111
    Subtraido: 0111
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 11111
    
    
    A = 0111
    B = 0001 
    Diferente: 1
    Somado: 01000
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1110
    Subtraido: 0110
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00000
    
    
    A = 0111
    B = 0010 
    Diferente: 1
    Somado: 01001
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1101
    Subtraido: 0101
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00001
    
    
    A = 0111
    B = 0011 
    Diferente: 1
    Somado: 01010
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1100
    Subtraido: 0100
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00010
    
    
    A = 0111
    B = 0100 
    Diferente: 1
    Somado: 01011
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1011
    Subtraido: 0011
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00011
    
    
    A = 0111
    B = 0101 
    Diferente: 1
    Somado: 01100
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1010
    Subtraido: 0010
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00100
    
    
    A = 0111
    B = 0110 
    Diferente: 1
    Somado: 01101
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1001
    Subtraido: 0001
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00101
    
    
    A = 0111
    B = 0111 
    Diferente: 0
    Somado: 01110
    Zero: 0
    OverFlow: 0
    A': 1000
    B': 1000
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 001001
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 001000
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 00110
    Decremento de 1 de B: 00110
    
    
    A = 1111
    B = 0000 
    Diferente: 1
    Somado: 01111
    Zero: 0
    OverFlow: 0
    A': 0000
    B': 1111
    Subtraido: 1111
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 110000
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000001
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 11111
    
    
    A = 1111
    B = 0001 
    Diferente: 1
    Somado: 10000
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1110
    Subtraido: 1110
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001111
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000010
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00000
    
    
    A = 1111
    B = 0010 
    Diferente: 1
    Somado: 10001
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1101
    Subtraido: 1101
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001110
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000011
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00001
    
    
    A = 1111
    B = 0011 
    Diferente: 1
    Somado: 10010
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1100
    Subtraido: 1100
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001101
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000100
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00010
    
    
    A = 1111
    B = 0100 
    Diferente: 1
    Somado: 10011
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1011
    Subtraido: 1011
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001100
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000101
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00011
    
    
    A = 1111
    B = 0101 
    Diferente: 1
    Somado: 10100
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1010
    Subtraido: 1010
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001011
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000110
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00100
    
    
    A = 1111
    B = 0110 
    Diferente: 1
    Somado: 10101
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1001
    Subtraido: 1001
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001010
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 000111
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00101
    
    
    A = 1111
    B = 0111 
    Diferente: 1
    Somado: 10110
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 1000
    Subtraido: 1000
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 001001
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 001000
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 00110
    
    
    A = 1111
    B = 1111 
    Diferente: 0
    Somado: 11110
    Zero: 0
    OverFlow: 1
    A': 0000
    B': 0000
    Subtraido: 0000
    A < B: 0
    Complemento De 2 de A: 000001
    Complemento De 2 de B: 000001
    Incremento de 1 de A: 110000
    Incremento de 1 de b: 110000
    Decremento de 1 de A: 01110
    Decremento de 1 de B: 01110
    
     ----jGRASP: operation complete.
    Resultados Esperados Obtidos */
    
    // OBS.: FAVOR DEIXAR ARQUIVO COM EXTENSAO .v
    