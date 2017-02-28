//Guia 04 - Somador Completo 3 bits
//Fabricío Rodrigues de Souza
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

module somador_3bits(s0, s1, s2, s3, a0, a1, a2, b0, b1, b2);

input a0, a1, a2, b0, b1, b2;
output s0, s1, s2, s3;
wire sSOMAC0, sSOMAC1;

somaCompleta SOMAC1(s0, sSOMAC0, a0, b0, 0);
somaCompleta SOMAC2(s1, sSOMAC1, a1, b1, sSOMAC0);
somaCompleta SOMAC3(s2, s3, a2, b2, sSOMAC1);

endmodule

module teste;

reg a0, a1, a2, b0, b1, b2;
output s0, s1, s2, s3;

somador_3bits SOMA3BITS(s0, s1, s2, s3, a0, a1, a2, b0, b1, b2);

initial begin:start
a0=0;a1=0;a2=0;b0=0;b1=0;b2=0;
end

initial begin: main
$display("Guia 05 - Exercicio01");
$display("Fabricio Rodrigues de Souza - 412737");
$display("A + B = S");
$monitor("%b%b%b + %b%b%b = %b%b%b%b", a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);
		#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=0;
		#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=0;
		#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=0;
		#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=0;
		#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=0;
		#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=0;
		#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=0; b0=1;
		#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=1;
		#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=1;
		#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=1;
		#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=1;
		#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=1;
		#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=1;
		#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=0;
		#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=0;
		#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=0;
		#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=0;
		#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=0;
		#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=0;
		#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=0;
		#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=1;
		#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=1;
		#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=1;
		#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=1;
		#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=1;
		#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=1;
		#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=1;
		#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=0;
		#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=0;
		#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=0;
		#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=0;
		#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=0;
		#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=0;
		#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=0;
		#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=1;
		#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=1;
		#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=1;
		#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=1;
		#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=1;
		#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=1;
		#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=1;
		#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=0;
		#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=0;
		#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=0;
		#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=0;
		#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=0;
		#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=0;
		#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=0;
		#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=1;
		#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=1;
		#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=1;
		#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=1;
		#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=1;
		#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=1;
		#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=1;
		#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=1;


end
endmodule

/*

     ----jGRASP exec: C:\Programas\ProgramasAC\Icarus_Verilog\bin\vvp somador_3bits.vvp
    
    Guia 05 - Exercicio01
    Fabricio Rodrigues de Souza - 412737
    A + B = S
    000 + 000 = 0000
    001 + 000 = 0001
    010 + 000 = 0010
    011 + 000 = 0011
    100 + 000 = 0100
    101 + 000 = 0101
    110 + 000 = 0110
    111 + 000 = 0111
    000 + 001 = 0001
    001 + 001 = 0010
    010 + 001 = 0011
    011 + 001 = 0100
    100 + 001 = 0101
    101 + 001 = 0110
    110 + 001 = 0111
    111 + 001 = 1000
    000 + 010 = 0010
    001 + 010 = 0011
    010 + 010 = 0100
    011 + 010 = 0101
    100 + 010 = 0110
    101 + 010 = 0111
    110 + 010 = 1000
    111 + 010 = 1001
    000 + 011 = 0011
    001 + 011 = 0100
    010 + 011 = 0101
    011 + 011 = 0110
    100 + 011 = 0111
    101 + 011 = 1000
    110 + 011 = 1001
    111 + 011 = 1010
    000 + 100 = 0100
    001 + 100 = 0101
    010 + 100 = 0110
    011 + 100 = 0111
    100 + 100 = 1000
    101 + 100 = 1001
    110 + 100 = 1010
    111 + 100 = 1011
    000 + 101 = 0101
    001 + 101 = 0110
    010 + 101 = 0111
    011 + 101 = 1000
    100 + 101 = 1001
    101 + 101 = 1010
    110 + 101 = 1011
    111 + 101 = 1100
    000 + 110 = 0110
    001 + 110 = 0111
    010 + 110 = 1000
    011 + 110 = 1001
    100 + 110 = 1010
    101 + 110 = 1011
    110 + 110 = 1100
    111 + 110 = 1101
    000 + 111 = 0111
    001 + 111 = 1000
    010 + 111 = 1001
    011 + 111 = 1010
    100 + 111 = 1011
    101 + 111 = 1100
    110 + 111 = 1101
    111 + 111 = 1110
    
     ----jGRASP: operation complete.
Resultado Esperado Obtido!*/