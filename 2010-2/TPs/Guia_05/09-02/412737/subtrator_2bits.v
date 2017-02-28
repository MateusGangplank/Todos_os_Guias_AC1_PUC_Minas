//Guia 05 - Diferença Completa 2 Bits
//Fabricío Rodrigues de Souza
//412737
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

module subtrator_3bits(s0, s1, s2, a0, a1, b0, b1);

input a0, a1, b0, b1;
output s0, s1, s2;
wire sSUBC0;

diferencaCompleta DC1(s0,sSUBC0, a0, b0, 0);
diferencaCompleta DC2(s1, s2, a1, b1, sSUBC0);

endmodule


module teste;

reg a0, a1, b0, b1;
output s0, s1, s2;

subtrator_3bits SUB3BITS(s0, s1, s2, a0, a1, b0, b1);

initial begin:start
a0=0;a1=0;b0=0;b1=0;
end

initial begin: main
$display("Guia 05 - Exercicio02");
$display("Fabricio Rodrigues de Souza - 412737");
$display("A   -  B  = S");
$monitor("%b%b  -  %b%b = %b%b%b",  a1, a0, b1, b0, s2, s1, s0);
#1 a1=0; a0=1; b1=0; b0=0;
#1 a1=1; a0=0; b1=0; b0=0;
#1 a1=1; a0=1; b1=0; b0=0;

#1 a1=0; a0=0; b1=0; b0=1;
#1 a1=0; a0=1; b1=0; b0=1;
#1 a1=1; a0=0; b1=0; b0=1;
#1 a1=1; a0=1; b1=0; b0=1;

#1 a1=0; a0=0; b1=1; b0=0;
#1 a1=0; a0=1; b1=1; b0=0;
#1 a1=1; a0=0; b1=1; b0=0;
#1 a1=1; a0=1; b1=1; b0=0;

#1 a1=0; a0=0; b1=1; b0=1;
#1 a1=0; a0=1; b1=1; b0=1;
#1 a1=1; a0=0; b1=1; b0=1;
#1 a1=1; a0=1; b1=1; b0=1;

end
endmodule

/*

    
     ----jGRASP exec: C:\Programas\ProgramasAC\Icarus_Verilog\bin\vvp subtrator_2bits.vvp
    
    Guia 05 - Exercicio02
    Fabricio Rodrigues de Souza - 412737
    A   -  B  = S
    00  -  00 = 000
    01  -  00 = 001
    10  -  00 = 010
    11  -  00 = 011
    00  -  01 = 111
    01  -  01 = 000
    10  -  01 = 001
    11  -  01 = 010
    00  -  10 = 110
    01  -  10 = 111
    10  -  10 = 000
    11  -  10 = 001
    00  -  11 = 101
    01  -  11 = 110
    10  -  11 = 111
    11  -  11 = 000
    
     ----jGRASP: operation complete.
     
Resultado Esperado Obtido!*/