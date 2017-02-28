// ---------------------
// Guia 04 Ex 3 - Diferenca completa
// Nome: Alvaro Henrique
// Matricula: 395487
// ---------------------

// ---------------------
// --Half Substractor
// ---------------------

module meiadiferenca (s0, s1, a, b);

 output s0, s1;
 input  a, b;
 wire t1;
 
xor XOR1 (s0, a, b);
not NOT1 (t1, a);
and AND1 (s1, t1, b);
 
 endmodule //
 
// ---------------------
// -- Full Substractor
// ---------------------

module diferencacompleta(s0, s1, a, b, c);

wire t1,t2,t3;
output s0, s1;
input a, b, c;

meiadiferenca MD1 (t1, t2, a, b);
meiadiferenca MD2 (s0, t3, c, t1);
or OR1 (s1, t2 , t3);

endmodule //

// --------------------------
// -- test diferenca completa
// --------------------------

module testdiferencacompleta;
 reg   a, b, c;             
 wire  s0, s1;
          // instancia
 diferencacompleta DIFERENCACOMPLETA1 (s0, s1, a, b, c);

 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04 Ex 03 - Alvaro Henrique - 395487");
      $display("Diferenca completa");
      $display("\n c a b = s1 s0\n");
      $monitor(" %b %b %b = %b %b", c, a, b, s1, s0);
#1 a=0;b=1;c=0;
#1 a=1;b=0;c=0;
#1 a=1;b=1;c=0;
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=1;
  
 end

endmodule //