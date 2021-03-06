//Guia 03 - 02 - Meia Soma Comun
//Fabric�o Rodrigues de Souza
//412737
module saida0(s0, a, b);

input a, b;
output s0,sNot1, sNot2, sAnd1, sAnd2;
wire s0,sNot1, sNot2, sAnd1, sAnd2;

not NOT_A(sNot1, a);
and AND_NOT_A_B(sAnd1, sNot1, b);
not NOT_B(sNot2, b);
and AND_A_NOT_B(sAnd2, a, sNot2);
or saidaFinal (s0, sAnd1, sAnd2);

endmodule

module saida1(s1, a, b);

input a, b;
output s1;
wire s1;

and AND1(s1, a, b);

endmodule

module meiaSoma1(s0, s1, a, b);

input a,b;
output s0, s1;
wire s0,s1;

saida0 S0(s0, a, b);
saida1 S1(s1, a, b);

endmodule

module somaCompleta(s3, s5, a, b, c);

input a, b, c;
output s1, s0, s3, s4, s5;
wire s1, s0;

meiaSoma1 MEIASOMA1(s0, s1, a, b);
meiaSoma1 MEIASOMA2(s3, s4, s0, c);
or OR1(s5, s1, s4);

endmodule

module multiplicador_2bits (s0, s1, s2, s3, a0, a1, b0, b1);
input   a0, a1, b0, b1;
output s0, s1, s2, s3;
	
wire sa1, sa2, sa3, sa4;

	// instancia	
and AND1(s0, a0, b0);
and AND2(sa1, a0, b1);
and ADN3(sa2, a1, b0);
and AND4(sa3, a1, b1);
	
meiaSoma1 MS1(s1, sa4, sa1, sa2);
somaCompleta SC1(s2, s3, sa3, 0, sa4);

endmodule // prod_comp_2bits

module teste;

reg a0, a1, b0, b1;
output s0, s1, s2, s3;

multiplicador_2bits SOMA3BITS(s0, s1, s2, s3, a0, a1, b0, b1);

initial begin:start
a0=0;a1=0;b0=0;b1=0;
end

initial begin: main
$display("Guia 04 - Exercicio02");
$display("Fabricio Rodrigues de Souza - 412737");
$display("A * B = S");
$monitor("%b%b * %b%b = %b%b%b%b", a1, a0, b1, b0, s3, s2, s1, s0);
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

    ----jGRASP exec: C:\Programas\ProgramasAC\Icarus_Verilog\bin\vvp multiplicador_2bits.vvp
    
    Guia 04 - Exercicio02
    Fabricio Rodrigues de Souza - 412737
    A * B = S
    00 * 00 = 0000
    01 * 00 = 0000
    10 * 00 = 0000
    11 * 00 = 0000
    00 * 01 = 0000
    01 * 01 = 0001
    10 * 01 = 0010
    11 * 01 = 0011
    00 * 10 = 0000
    01 * 10 = 0010
    10 * 10 = 0100
    11 * 10 = 0110
    00 * 11 = 0000
    01 * 11 = 0011
    10 * 11 = 0110
    11 * 11 = 1001
    
     ----jGRASP: operation complete.
Resultado Esperado Obtido!*/

