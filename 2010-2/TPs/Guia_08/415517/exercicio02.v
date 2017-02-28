// ---------------------
//  Guia-8 / Exercicio 02
//  Felipe Augusto
//  Mat.: 415517 
// ---------------------

// ---------------------
// -- Circuito
// ---------------------
module circuito (s0, a, b, c, d);

 output s0;
 input a, b, c, d;

 not NOT1 (r1,a);
 not NOT2 (r2,b);
 not NOT3 (r3,c);
 not NOT4 (r4,d);

 and AND1 (s1, r1,r2,r4);
 and AND2 (s2, r1,r3,r4);
 and AND3 (s3, r2, r3, r4);
 and AND4 (s4, a, r2,d);
 and AND5 (s5,a,r3,d);

 or OR1 (s0, s1,s2,s3,s4,s5);

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
 
   $display("Exercicio 02");
   $display("Felipe Augusto - 415517");
   $display("\n     Circuito 02\n");
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
