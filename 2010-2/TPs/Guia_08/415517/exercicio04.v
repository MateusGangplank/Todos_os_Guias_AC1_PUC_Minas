// ---------------------
//  Guia-8 / Exercicio 04
//  Felipe Augusto
//  Mat.: 415517 
// ---------------------

// ---------------------
// -- Circuito
// ---------------------
module circuito (s0, a, b, c, d);

 output s0;
 input a, b, c, d;

nand Nand1(r4,d,d);
nand Nand2(r1,a,a);
nand Nand3(r2,b,b);

nand Nand4(s3,a,b,r4);
nand Nand5(s2,r1,c);
nand Nand6 (s1,r2,c);

nand Nand7 (s0,s1,s2,s3);
endmodule

// ---------------------
// -- Teste Circuito ---
// ---------------------
module testeCircuito( );

reg a, b,c,d;
wire s0;

circuito C1(s0, a, b, c, d);

  initial begin:start
   a = 0; b=0; c=0; d=0;

  end

  initial begin: main
 
   $display("Exercicio 04");
   $display("Felipe Augusto - 415517");
   $display("\n     Circuito 04\n");
   $monitor("  Entrada:  [a=%b  b=%b  c=%b  d=%b]   |   Saida:[%b]", a, b, c, d, s0);

        #1 a = 0; b=0; c=0; d=1;
        #1 a = 0; b=0; c=1; d=0;
        #1 a = 0; b=0; c=1; d=1;
        #1 a = 0; b=1; c=0; d=0;
        #1 a = 0; b=1; c=0; d=1;
        #1 a = 0; b=1; c=1; d=0;
        #1 a = 0; b=1; c=1; d=1;
        #1 a = 1; b=0; c=0; d=0;
        #1 a = 1; b=0; c=0; d=1;
        #1 a = 1; b=0; c=1; d=0;
        #1 a = 1; b=0; c=1; d=1;
        #1 a = 1; b=1; c=0; d=0;
        #1 a = 1; b=1; c=0; d=1;
        #1 a = 1; b=1; c=1; d=0;
        #1 a = 1; b=1; c=1; d=1;

  end
endmodule
