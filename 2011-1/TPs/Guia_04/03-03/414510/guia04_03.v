// ---------------------
// Guia 04_03 - Diferenca completa com meia diferenca
// Nome: Marley Ribeiro
// Matricula: 414510
// ---------------------

// ---------------------
// -- meia diferenca
// ---------------------

module meiadiferenca (s0, s1, a, b);

 output s0, s1;
 input  a, b;
 wire q0;
 
xor XOR1 (s0, a, b);
not NOT1 (q0, a);
and AND1 (s1, q0, b);
 
 endmodule //meiadiferenca
 
// ---------------------
// -- module diferenca completa
// ---------------------

module diferencacompleta(s0, s1, a, b, v);

wire q0,q1,q2;
output s0, s1;
input a, b, v;

meiadiferenca MD1 (q0, q1, a, b);
meiadiferenca MD2 (s0, q2, v, q0);
or OR1 (s1, q1, q2);

endmodule // diferenca completa

// --------------------------
// -- test diferenca completa
// --------------------------

module testdiferencacompleta;
 reg   a, b, v;             
 wire  s0, s1;
          // instancia
 diferencacompleta DIFERENCACOMPLETA1 (s0, s1, a, b, v);

 initial begin:start
      a=0; b=0; v=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04_03 - Marley Ribeiro - 414510");
      $display("Operador Diferenca-Completa usando dois circuitos Meia-Diferenca.");
      $display("\nv a b = s1 s0\n");
      $monitor(" %b %b %b = %b %b", v, a, b, s1, s0);
#1 a=0;b=1;v=0;
#1 a=1;b=0;v=0;
#1 a=1;b=1;v=0;
#1 a=0;b=0;v=1;
#1 a=0;b=1;v=1;
#1 a=1;b=0;v=1;
#1 a=1;b=1;v=1;
  
 end

endmodule // testdiferencacompleta