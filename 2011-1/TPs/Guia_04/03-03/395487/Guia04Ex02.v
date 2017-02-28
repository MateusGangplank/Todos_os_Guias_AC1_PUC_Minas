// ---------------------
// Guia 04_02 -Soma Completa
// Nome:Alvaro Henrique de Araujo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- Half Adder
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0, s1;
 input  a, b;
 
xor XOR1 (s0, a, b);
and AND1 (s1, a, b);
 
 endmodule //meiasoma
 
 
 // ---------------------
// -- Soma completa
// ---------------------

module somacompleta(s0, s1, a, b, c);

wire t1,t2,t3;
output s0, s1;
input a, b, c;

meiasoma MS1 (t1, t2, a, b);
meiasoma MS2 (s0, t3, t1, c);
or OR1 (s1, t2, t3);

endmodule // soma 

// --------------------------
// -- Tes Soma completa
// --------------------------

module testsomacompleta;
 reg   a, b, c;             
 wire  s0, s1;
          // instancia
 somacompleta SOMACOMPLETA1 (s0, s1, a, b, c);

 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04 Ex 2 - Alvaro Henrique - 395487");
      $display("Soma Completa.");
      $display("\n a b c = s0 s1\n");
      $monitor(" %b %b %b = %b %b", c, a, b, s0, s1);
#1 a=0;b=1;c=0;
#1 a=1;b=0;c=0;
#1 a=1;b=1;c=0;
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=1;
  
 end

endmodule // soma completa
