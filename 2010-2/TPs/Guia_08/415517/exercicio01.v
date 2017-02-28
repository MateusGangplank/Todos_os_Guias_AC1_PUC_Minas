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

 not NOT1 (r1,d);
 and AND1 (s1, a, b, r1);
 not NOT2 (r2,a);
 and AND2 (s2,r2,c);
 not NOT3 (r3,b);
 and AND3 (s3,r3,c);
 or OR1 (s0, s1,s2,s3);
 
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
 
   $display("Exercicio 01");
   $display("Felipe Augusto - 415517");
   $display("\n     Circuito 01\n");
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
