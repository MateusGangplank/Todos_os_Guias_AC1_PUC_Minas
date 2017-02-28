               // ---------------------
//  GUIA 08-Exercicio 05
//  CELSO R FRAN�A JR 404590 
// ---------------------

// ---------------------
// -- Circuito  and
// ---------------------
module andNor (s0, a, b, c);

 output s0;
 input a, b, c;
 nor Nor1 (r1,a,a);
 nor Nor2 (r2,b,b);
 nor Nor3 (r3,c,c);
 nor Nor4 (s0,r1,r2,r3);

endmodule
// ---------------------
// -- Circuito  not
// ---------------------
module notNor (r1,r2,r3,r4,a,b,c,d);

 output r1,r2,r3,r4;
 input a, b, c,d;
 nor Nor1 (r1,a,a);
 nor Nor2 (r2,b,b);
 nor Nor3 (r3,c,c);
 nor Nor4 (r4,d,d);


endmodule

// ---------------------
// -- Circuito  or
// ---------------------
module orNor (s0,e1,e2,e3,e4,e5);

 output s0;
 input e1,e2,e3,e4,e5;

 nor Nor1 (r1,e1,e2,e3,e4,e5);
 nor Nor2 (s0,r1,r1);



endmodule
// ---------------------
// -- Circuito
// ---------------------
module circuito (s0, a, b, c, d);

 output s0;
 input a, b, c, d;

notNor n1 (r1,r2,r3,r4,a,b,c,d);

andNor a1 (s1,r1,r2,r4);
andNor a2 (s2,a,r2,r3);
andNor a3 (s3,a,r3,d);
andNor a4 (s4,r1,r3,r4);
andNor a5 (s5,a,r2,d);
orNor o1 (s0, s1,s2,s3,s4,s5);

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
 
   $display("Exercicio 05");
   $display("Celso R Franca Jr - 404590");
   $display("\n     Circuito 05\n");
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